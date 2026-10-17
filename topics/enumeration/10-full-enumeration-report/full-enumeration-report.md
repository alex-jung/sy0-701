# Übung 10 – Vollständige Enumeration + Report

**Schwierigkeit: 10/10 · Dauer: ca. 2–3 Std.**

## Lernziele

- Alle Enumeration-Techniken zu einem methodischen Gesamtprozess kombinieren
- Pro offenem Port den passenden Enumeration-Pfad wählen
- Findings konsolidieren und als Angriffsfläche + Risiko dokumentieren
- Den Übergang zur Exploitation vorbereiten (priorisierte Ziele)

## Theorie

Professionelle Enumeration ist **port-/dienstgetrieben**: Man nimmt das Scan-Ergebnis (`network-scanning`) und arbeitet jeden offenen Dienst mit dem richtigen Werkzeug ab:

| Port/Dienst | Enumeration |
|-------------|-------------|
| 25 SMTP | User-Enum (Übung 01) |
| 139/445 SMB | Shares, User, Gruppen, Policy (02, 06) |
| 161 SNMP | System/Prozesse/User (03) |
| 111/2049 NFS | Exports mounten (04) |
| 137/135 NetBIOS/RPC | Namen, RPC, Null Session (05) |
| 389 LDAP | Directory/User (07) |
| 3306/5432 DB | Version, DBs, User, Privilegien (08) |
| 80/443 Web | Content/Directory (09) |

Danach **konsolidieren**: alle Findings je Host zusammenführen, Credentials/User zentral sammeln, Risiko bewerten, nächste Schritte (Exploitation-Ziele) priorisieren.

Das beiliegende `enum-sweep.sh` triggert pro erkanntem Port die passende Enumeration. **Lies es, bevor du es nutzt**, und setze das Ziel.

## Verwendete Tools

Kombination aus Übung 01–09 + `nmap` (zur Port-Erkennung) + `enum-sweep.sh` (beiliegend).

## Lab-Setup

- Metasploitable + DVWA, Tools aus den vorherigen Übungen installiert, SecLists vorhanden.

## Aufgabe (selbst lösen)

Du bekommst den „Auftrag", einen Lab-Host vollständig zu enumerieren und einen Enumeration-Report zu liefern.

1. **Scan-Grundlage:** ermittle (erneut) alle offenen Ports/Dienste des Ziels.
2. **Dienstweise Enumeration:** arbeite jeden relevanten Dienst mit dem passenden Verfahren ab (nutze `enum-sweep.sh` als Gerüst + manuelle Vertiefung).
3. **Credentials/User sammeln:** führe alle gefundenen Benutzernamen, Default-Creds und Hashes in einer zentralen Liste zusammen.
4. **Findings & Risiko:** bewerte die Funde (Null Session, Default-Creds, offene Exports, exponierte DB …) mit High/Med/Low + Empfehlung.
5. **Report:** erstelle einen strukturierten Enumeration-Report (pro Host: Dienste → Funde → verwertbare Zugänge → Empfehlung) und lege die Befehle reproduzierbar ab.
6. **Priorisierung:** benenne die 3 aussichtsreichsten Ansatzpunkte für die nächste Phase (Exploitation).

**Ziel:** eine vollständige, konsolidierte Enumeration eines Hosts mit priorisierten, belegten Findings – das Gesamtprodukt aus Übung 01–09.

## SY0-701 Prüfungsbezug

- **Enumeration-Phase** im Pentest-Prozess; Übergang zu Exploitation.
- **Vulnerability management & attack surface:** systematische Erfassung, Priorisierung (CVSS-Denke).
- **Mitigations gebündelt:** Hardening über alle Dienste (Null Sessions, Default-Creds, Exposure, least privilege, MFA, Segmentierung).
- Begriffe: *enumeration*, *attack surface*, *default credentials*, *least privilege*, *hardening*, *prioritization*.
