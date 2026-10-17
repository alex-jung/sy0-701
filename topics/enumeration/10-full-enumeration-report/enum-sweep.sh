#!/usr/bin/env bash
#
# enum-sweep.sh – port-getriebene Enumeration eines Hosts (Übung 10).
#
# ⚠️  NUR gegen dein eigenes, autorisiertes Lab-Ziel (Metasploitable/DVWA/eigene VM).
# ⚠️  Enumeration ist AKTIV. LIES das Skript, bevor du es ausführst, setze TARGET.
#
# Ablauf: schneller Service-Scan -> je offenem Port passende Enumeration.
# Voraussetzungen (je nach Port): nmap, smbclient, smbmap, enum4linux(-ng),
#   snmpwalk, snmp-check, showmount, rpcinfo, ldapsearch, gobuster, seclists.

set -uo pipefail

# ------------------------- ANPASSEN -------------------------
TARGET="192.168.56.100"      # Ziel-IP
WORDLIST="/usr/share/seclists/Discovery/Web-Content/directory-list-2.3-medium.txt"
# ------------------------------------------------------------

OUTDIR="enum_${TARGET}_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$OUTDIR"; cd "$OUTDIR"
echo "[*] Ziel: $TARGET   Ergebnisse: $(pwd)"

echo "[*] Service-Scan"
sudo nmap -sS -sU -sV -T4 --top-ports 200 -oA portscan "$TARGET" >/dev/null 2>&1 || \
  nmap -sT -sV -T4 --top-ports 200 -oA portscan "$TARGET" >/dev/null 2>&1
OPEN=$(awk '/\/tcp.*open|\/udp.*open/{split($1,a,"/"); print a[1]}' portscan.nmap 2>/dev/null | sort -un)
echo "    offene Ports: $(echo "$OPEN" | tr '\n' ' ')"

has(){ echo "$OPEN" | grep -qx "$1"; }

if has 25;  then echo "[*] 25 SMTP";  nmap -p25 --script smtp-commands,smtp-enum-users "$TARGET" > smtp.txt 2>&1; fi
if has 139 || has 445; then
  echo "[*] 139/445 SMB"
  smbclient -L "//$TARGET/" -N > smb_shares.txt 2>&1
  smbmap -H "$TARGET" -u '' -p '' > smb_map.txt 2>&1
  (enum4linux-ng -A "$TARGET" || enum4linux -a "$TARGET") > smb_enum4linux.txt 2>&1
fi
if has 161; then echo "[*] 161 SNMP"; snmp-check "$TARGET" -c public > snmp.txt 2>&1; \
  snmpwalk -v2c -c public "$TARGET" > snmp_walk.txt 2>&1; fi
if has 111 || has 2049; then echo "[*] 111/2049 NFS/RPC"; rpcinfo -p "$TARGET" > rpcinfo.txt 2>&1; \
  showmount -e "$TARGET" > nfs_exports.txt 2>&1; fi
if has 389; then echo "[*] 389 LDAP"; \
  BASE=$(ldapsearch -x -H "ldap://$TARGET" -s base -b "" namingContexts 2>/dev/null | awk -F': ' '/namingContexts/{print $2}'); \
  echo "baseDN=$BASE" > ldap.txt; ldapsearch -x -H "ldap://$TARGET" -b "$BASE" >> ldap.txt 2>&1; fi
if has 3306; then echo "[*] 3306 MySQL"; nmap -p3306 --script mysql-info,mysql-empty-password,mysql-databases "$TARGET" > mysql.txt 2>&1; fi
if has 5432; then echo "[*] 5432 PostgreSQL"; nmap -p5432 --script pgsql-brute "$TARGET" > pgsql.txt 2>&1; fi
if has 80 || has 443; then
  echo "[*] 80/443 Web"
  proto=http; has 443 && proto=https
  nmap -p80,443 --script http-enum "$TARGET" > web_httpenum.txt 2>&1
  command -v gobuster >/dev/null && gobuster dir -u "$proto://$TARGET/" -w "$WORDLIST" -x php,txt,bak -t 40 -q -o web_gobuster.txt 2>/dev/null || true
fi

echo
echo "[*] Fertig. Artefakte in $(pwd):"
ls -1
echo
echo "[!] Nächster Schritt (manuell): Funde konsolidieren -> zentrale User-/Cred-Liste,"
echo "    Findings mit Risiko (Null Session? Default-Creds? offene Exports/DB?) + Empfehlungen,"
echo "    danach 3 Top-Ziele für die Exploitation-Phase priorisieren."
