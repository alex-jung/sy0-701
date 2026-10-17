# Lösung – Übung 10: Vollständige Enumeration + Report

Beispiel-Durchführung gegen Metasploitable. `enum-sweep.sh` triggert pro Port die passende Enumeration; hier Ablauf + Report-Struktur.

## 1. Scan-Grundlage

```bash
sudo nmap -sS -sV -T4 -p- -oA portscan <ZIEL>
```
Offene Ports notieren (21, 22, 23, 25, 53, 80, 111, 139, 445, 2049, 3306, 5432, 5900, 6667 …).

## 2. Dienstweise Enumeration (Sweep)

```bash
chmod +x enum-sweep.sh
# TARGET im Skript setzen
./enum-sweep.sh
```
Erzeugt im Ausgabeordner u. a. `smtp.txt`, `smb_shares.txt`, `smb_map.txt`, `smb_enum4linux.txt`, `snmp*.txt`, `nfs_exports.txt`, `rpcinfo.txt`, `ldap.txt`, `mysql.txt`, `web_gobuster.txt`.
Danach gezielt vertiefen (rpcclient RID-Cycling, NFS mounten, DB-Login) wie in den Einzelübungen.

## 3. Credentials/User konsolidieren

Zentrale Listen bauen:
```bash
# User aus SMB/SMTP/SNMP zusammenführen
grep -hoE '[a-z_][a-z0-9_-]+' smb_enum4linux.txt | sort -u > users_all.txt
```
Plus bekannte Default-Creds (Metasploitable): `msfadmin:msfadmin`, MySQL `root:(leer)`, PostgreSQL `postgres:postgres`, DVWA `admin:password`.

## 4. Findings & Risiko (Beispiel)

| Host | Dienst | Finding | Risiko | Empfehlung |
|------|--------|---------|--------|------------|
| .100 | SMB | Null Session, `tmp` RW, User-Liste | **High** | anonym verbieten, SMBv1 aus, least priv |
| .100 | NFS | `/` an `*` exportiert | **High** | Export auf Hosts beschränken, `ro`, root_squash |
| .100 | MySQL | root ohne Passwort, 3306 offen | **High** | Passwort setzen, bind localhost, segmentieren |
| .100 | SMTP | VRFY-User-Enum möglich | Med | VRFY/EXPN aus |
| .100 | SNMP | Community `public` | Med | v3, Community ändern, ACL |
| .100 | Web | `/phpinfo.php`, Backups auffindbar | Med | entfernen, Auth, Directory-Listing aus |

Risiko nach Zugriffstiefe + Impact (CVSS-Denke).

## 5. Report-Struktur

1. **Management Summary** (Angriffsfläche, Top-3-Risiken).
2. **Scope & Methodik** (Ziel, Tools, nur Lab).
3. **Ergebnisse je Dienst** (verweist auf die Artefakt-Dateien).
4. **Verwertbare Zugänge** (User-/Cred-Liste).
5. **Findings & Empfehlungen** (Tabelle oben, priorisiert).
6. **Anhang:** alle Befehle + Ausgabeordner → reproduzierbar.

## 6. Top-3-Ziele für Exploitation

1. **MySQL root ohne Passwort** → direkter Datenzugriff, evtl. `INTO OUTFILE`-Webshell.
2. **NFS `/`-Export** → Dateizugriff, bei `no_root_squash` PrivEsc/SSH-Key.
3. **vsftpd 2.3.4 / Samba usermap** (aus Scan/Version) → bekannte RCE.

→ Diese Priorisierung ist der Übergang zum Thema `exploitation-metasploit`.

## Häufige Fehler / Troubleshooting

- **Skript überspringt Dienste:** Tool fehlt oder Port als „open|filtered" (UDP). Tools nachinstallieren; SNMP/UDP ggf. separat prüfen.
- **enum4linux-ng fehlt:** `pipx install enum4linux-ng`; Skript fällt auf `enum4linux` zurück.
- **Zu laut/langsam:** gegen kleine VMs Threads/Top-Ports reduzieren.
- **Leere Ergebnisse trotz offenem Port:** Dienst gehärtet (keine Null Session/Default-Creds) → genau das im Report als „kein Finding" festhalten.
