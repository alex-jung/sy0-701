#!/usr/bin/env bash
#
# enum-workflow.sh – Gerüst für eine methodische Netz-Enumeration (Übung 10).
#
# ⚠️  NUR gegen dein eigenes, autorisiertes Lab-Netz verwenden.
# ⚠️  LIES das Skript, bevor du es ausführst, und passe NETZ/IFACE an.
#
# Ablauf: Discovery -> Breite (masscan) -> Tiefe (nmap -sV -sC) -> Report.
# Voraussetzungen: nmap, masscan, xsltproc; als root/sudo ausführen.

set -euo pipefail

# ------------------------- ANPASSEN -------------------------
NET="192.168.56.0/24"      # dein Lab-Netz
IFACE="eth0"               # Kali-Interface
RATE="1000"                # masscan-Pakete/s (im Lab moderat halten)
OUTDIR="scan_$(date +%Y%m%d_%H%M%S)"
# ------------------------------------------------------------

mkdir -p "$OUTDIR"
cd "$OUTDIR"
echo "[*] Ergebnisse in: $(pwd)"

echo "[*] Phase 1: Host Discovery (ARP/Ping-Sweep)"
nmap -sn -n "$NET" -oG hosts.gnmap >/dev/null
awk '/Up$/{print $2}' hosts.gnmap > live_hosts.txt
echo "    aktive Hosts: $(wc -l < live_hosts.txt)"
cat live_hosts.txt

echo "[*] Phase 2: Breiter Port-Sweep mit masscan"
# masscan über alle TCP-Ports der Live-Hosts; Ausgabe als Liste
masscan -iL live_hosts.txt -p1-65535 --rate "$RATE" -oL masscan.txt || true
# offene Ports je Host extrahieren -> "ip:port"
awk '/^open/{print $4":"$3}' masscan.txt | sort -u > open_ports.txt
echo "    offene Ports gefunden: $(wc -l < open_ports.txt)"

echo "[*] Phase 3: Gezielte Tiefe mit nmap (-sV -sC -O + vuln)"
# pro Host die offenen Ports sammeln und einmal tief scannen
for host in $(cut -d: -f1 open_ports.txt | sort -u); do
  ports=$(grep "^${host}:" open_ports.txt | cut -d: -f2 | paste -sd, -)
  [ -z "$ports" ] && continue
  echo "    -> $host  Ports: $ports"
  nmap -Pn -sV -sC -O -p "$ports" --script "vuln and safe" \
       -oA "nmap_${host}" "$host" >/dev/null || true
done

echo "[*] Phase 4/5: HTML-Report erzeugen"
# Alle Einzel-XMLs zu HTML wandeln (benötigt nmap.xsl, liegt bei nmap bei)
for xml in nmap_*.xml; do
  [ -e "$xml" ] || continue
  xsltproc "$xml" -o "${xml%.xml}.html" 2>/dev/null || true
done

echo "[*] Fertig. Prüfe:"
echo "    - live_hosts.txt     (aktive Hosts)"
echo "    - open_ports.txt     (ip:port)"
echo "    - nmap_<host>.nmap    (lesbar)  / .html (Report)"
echo
echo "[!] Nächster Schritt (manuell): Dienste+Versionen gegen CVEs prüfen,"
echo "    Risiko (CVSS) einstufen und im Report priorisieren."
