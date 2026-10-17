# Übung 07 – NSE: Nmap Scripting Engine

**Schwierigkeit: 7/10 · Dauer: ca. 60 Min.**

## Lernziele

- Die Nmap Scripting Engine (NSE) gezielt einsetzen
- Script-Kategorien verstehen und bewusst wählen (`safe` vs. `intrusive`/`vuln`)
- Enumeration vertiefen: SMB, HTTP, FTP, Default-Credentials
- NSE-Scripts für **Schwachstellen-Checks** nutzen – der Übergang vom Scannen zur Vuln-Analyse

## Theorie

NSE ist nmaps eingebaute Lua-Scripting-Engine (`--script`). Scripts sind in **Kategorien** gruppiert:

| Kategorie | Bedeutung |
|-----------|-----------|
| `safe` | harmlos, kein Schaden/keine hohe Last |
| `default` (`-sC`) | nützliche, meist safe Scripts, die bei `-A` laufen |
| `discovery` | Infos sammeln (SMB-Shares, DNS, SNMP) |
| `auth` | Authentifizierung/Default-Creds |
| `vuln` | prüft auf bekannte Schwachstellen (CVE) |
| `exploit` | versucht aktiv auszunutzen |
| `brute` | Brute-Force von Logins |
| `intrusive` | kann stören/auffallen |
| `dos` | **gefährlich** – kann Dienst crashen |

Man wählt Scripts per Name (`--script smb-os-discovery`), per Kategorie (`--script vuln`), per Wildcard (`--script "smb-*"`) oder per boolescher Logik (`--script "default and safe"`). `--script-args` übergibt Parameter.

> ⚠️ `vuln`/`exploit`/`dos`/`brute` sind **intrusiv**. Nur gegen eigene Lab-Ziele – manche Scripts können Dienste tatsächlich zum Absturz bringen.

## Verwendete Tools

| Tool | Zweck | Wichtige Optionen |
|------|-------|-------------------|
| `nmap` + NSE | Enumeration & Vuln-Checks | `-sC`, `--script <...>`, `--script-args`, `--script-help <name>` |
| Script-Verzeichnis | Nachschauen, was es gibt | `ls /usr/share/nmap/scripts/` |

## Lab-Setup

- Kali + Metasploitable (SMB/Samba, FTP, HTTP, MySQL – ideal für NSE).
- `nmap --script-updatedb` einmal ausführen, damit die Script-DB aktuell ist.

## Aufgabe (selbst lösen)

1. Verschaffe dir einen Überblick: Wo liegen die NSE-Scripts, und wie viele gibt es? Lies die Hilfe zu **einem** Script mit `--script-help`.
2. Führe die **Default-Scripts** (`-sC`) gegen das Ziel aus und wandere die Zusatzinfos durch (z. B. SMB-, FTP-, HTTP-Details).
3. Enumeriere **SMB** gezielt: OS, Shares, User/Sessions. Welche Shares sind erreichbar?
4. Prüfe den **FTP**-Dienst mit einem passenden NSE-Script auf Anonymous-Login bzw. die bekannte Backdoor.
5. Lass **`--script vuln`** gegen das Ziel laufen und sammle die gemeldeten CVEs/Findings. Markiere, welche davon `intrusive` sind.

**Ziel:** Du kannst NSE kategoriebewusst einsetzen und aus einem Scan konkrete, CVE-benannte Findings ableiten.

## SY0-701 Prüfungsbezug

- **Vulnerability scanning** (4.0): NSE `vuln` ist ein leichtgewichtiger Vuln-Scanner. Abgrenzung **credentialed vs. non-credentialed scan**, **intrusive vs. non-intrusive scan** – exakt die NSE-Kategorien.
- **SMB-Enumeration / Null Sessions**, **Anonymous FTP**, **Default Credentials** sind typische Findings und Prüfungsbegriffe.
- **CVE/CVSS**: NSE meldet CVE-IDs → Priorisierung nach CVSS.
- Begriffe: *non-intrusive/intrusive scan*, *credentialed scan*, *enumeration*, *default credentials*, *null session*.
