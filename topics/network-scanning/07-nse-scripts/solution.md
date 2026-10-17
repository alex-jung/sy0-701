# Lösung – Übung 07: NSE – Nmap Scripting Engine

## 1. Überblick & Hilfe

```bash
ls /usr/share/nmap/scripts/ | wc -l        # Anzahl Scripts (~600+)
ls /usr/share/nmap/scripts/ | grep ^smb    # alle SMB-Scripts
nmap --script-help ftp-anon                # Was macht dieses Script?
sudo nmap --script-updatedb                # Script-DB aktualisieren
```

## 2. Default-Scripts

```bash
sudo nmap -sC <ZIEL>            # entspricht --script default
# oder mit Version zusammen:
sudo nmap -sV -sC <ZIEL>
```
Liefert pro Dienst Zusatzinfos, z. B. HTTP-Titel, SSL-Zertifikate, FTP-Anon, SMB-OS.

## 3. SMB-Enumeration

```bash
sudo nmap -p 139,445 \
  --script smb-os-discovery,smb-enum-shares,smb-enum-users,smb-enum-sessions \
  <ZIEL>
```
Beispiel-Erkenntnisse (Metasploitable 2):
```
smb-os-discovery: Unix (Samba 3.0.20-Debian)
smb-enum-shares:  tmp (READ/WRITE), opt, IPC$, ADMIN$ ...
smb-enum-users:   games, nobody, bind, msfadmin, user, ...
```
→ Lesbare/schreibbare Shares und eine User-Liste = wertvolle Enumeration. (Zugriff ohne Login = **Null Session**.)

## 4. FTP prüfen

```bash
# Anonymous-Login?
sudo nmap -p 21 --script ftp-anon <ZIEL>
# Bekannte vsftpd-2.3.4-Backdoor?
sudo nmap -p 21 --script ftp-vsftpd-backdoor <ZIEL>
```
Erwartet z. B.:
```
| ftp-vsftpd-backdoor:
|   VULNERABLE:
|   vsFTPd version 2.3.4 backdoor
|     State: VULNERABLE (Exploitable)
|     IDs:  OSVDB:73573  ...
```

## 5. Vuln-Scan

```bash
sudo nmap -sV --script vuln <ZIEL>
```
Sammelt u. a.:
- `ftp-vsftpd-backdoor` → vsftpd 2.3.4 Backdoor
- `smb-vuln-*` → Samba/SMB-Schwachstellen (z. B. `smb-vuln-cve-2017-7494` SambaCry falls zutreffend)
- `http-*` → veraltete Apache-/Webapp-Findings

**Intrusiv** sind insbesondere `*-backdoor`, `smb-vuln-*` (einige triggern den Bug real), alles aus `exploit`/`dos`/`brute`. `safe`/`discovery` sind unkritisch.

Nur „sichere" Vuln-Checks:
```bash
sudo nmap --script "vuln and safe" <ZIEL>
```

## Häufige Fehler / Troubleshooting

- **`--script vuln` dauert lange:** viele Scripts × Ports; auf relevante `-p` eingrenzen.
- **Script nicht gefunden:** Name exakt (ohne `.nse`) oder Wildcard `"smb-vuln-*"`; `--script-updatedb` laufen lassen.
- **Dienst crasht nach Scan:** ein `intrusive`/`dos`-Script hat zugeschlagen – genau deshalb nur im Lab. Dienst/VM neu starten.
- **SMB-Scripts liefern nichts:** manche brauchen `--script-args smbusername=...,smbpassword=...` (credentialed) für volle Ergebnisse.
