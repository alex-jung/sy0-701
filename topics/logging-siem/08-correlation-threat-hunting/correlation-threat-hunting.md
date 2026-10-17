# Übung 08 – Korrelation & Threat Hunting

**Schwierigkeit: 8/10 · Dauer: ca. 80 Min.**

## Lernziele

- Ereignisse quellenübergreifend korrelieren (Firewall + IDS + Host)
- Eine Angriffskette im SIEM rekonstruieren (Timeline)
- Proaktives Threat Hunting mit Hypothesen betreiben
- IoCs suchen und ATT&CK-basiert jagen

## Theorie

**Korrelation** verknüpft Events verschiedener Quellen zu einem Gesamtbild: ein Scan (Firewall/IDS) + ein Exploit-Alert (IDS) + ein neuer Prozess/Login (Host) + ein Outbound-Beacon (Zeek/Firewall) = **eine Angriffskette**, nicht fünf isolierte Alerts. Voraussetzung: Normalisierung (Übung 05) + Zeitsync.

**Threat Hunting** ist **proaktiv**: statt auf Alerts zu warten, stellt man **Hypothesen** („gibt es Lateral Movement per PtH?", „Beaconing zu seltenen Zielen?") und sucht gezielt in den Daten – auch nach dem, was keine Regel getriggert hat (0-Day/Evasion). Basis: IoCs (IP/Domain/Hash), ATT&CK-Techniken, Anomalien (Bezug Zeek, `ids-ips` 09).

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Wazuh Dashboard (Discover/Threat Hunting) | Suche/Filter über alle Quellen |
| OpenSearch Query / Zeitfilter | Timeline/Korrelation |
| MITRE-ATT&CK-Modul | technikbasiertes Hunting |

## Lab-Setup

- Wazuh mit mehreren Quellen (Übung 04). Fahre eine **mehrstufige Angriffskette** aus den offensiven Themen (Scan → Exploit → Shell → Lateral/C2).

## Aufgabe (selbst lösen)

1. Führe eine mehrstufige Attacke von Kali aus (z. B. Scan → vsftpd/Samba-Exploit → Reverse-Shell → Zugriff auf zweiten Host).
2. **Korreliere** im SIEM über die Quell-IP/Zeit: rekonstruiere die **Timeline** der Angriffskette über Firewall-, IDS- und Host-Events.
3. **Threat Hunt**: stelle eine Hypothese (z. B. „Brute-Force gefolgt von erfolgreichem Login") und suche gezielt danach.
4. Jage einen **IoC** (z. B. die Angreifer-IP / einen Hash) über alle Quellen.
5. Dokumentiere die Kette als **ATT&CK-Timeline** (welche Technik wann, welche Quelle hat es gesehen).

**Ziel:** eine quellenübergreifend korrelierte Angriffskette als Timeline + ein hypothesengetriebener Hunt mit IoC-Suche.

## SY0-701 Prüfungsbezug

- **Correlation**, **Threat Hunting** (proaktiv vs. reaktiv), **IoC-Suche**, Timeline/Forensik.
- **MITRE ATT&CK** als Jagd-/Mapping-Framework; Zusammenspiel der Quellen.
- Begriffe: *correlation*, *threat hunting*, *IoC*, *timeline/kill chain*, *MITRE ATT&CK*.
