# Übung 01 – Logging-Grundlagen

**Schwierigkeit: 1/10 · Dauer: ca. 40 Min.**

## Lernziele

- Log-Quellen und -Arten unterscheiden (OS, Dienste, Netz, Security)
- Gängige Log-Formate kennen (Syslog, JSON, Windows Event Log, CEF)
- Severity-Level und den Nutzen von Zeitstempeln/Zeitsync verstehen
- Warum zentrale Sammlung + Aufbewahrung wichtig sind

## Theorie

Logs sind die Grundlage von **Detection, Forensik und Compliance**. Quellen:
- **OS:** Linux `/var/log/*` (auth.log, syslog), Windows **Event Log** (Security/System/Application), **Sysmon**.
- **Dienste:** Web-/DB-/Mailserver, DNS.
- **Netz/Security:** Firewall (OPNsense), IDS/IPS (Suricata), Proxy, VPN.

Formate: **Syslog** (RFC 3164/5424), **JSON** (z. B. Suricata eve.json), **Windows Event Log (EVTX)**, **CEF/LEEF** (SIEM-Normalisierung).

**Syslog-Severity** (0–7): 0 emerg … 3 err … 6 info … 7 debug. **Zeitstempel + NTP** sind essenziell – ohne synchrone Zeit ist **Korrelation** über Systeme unmöglich und Forensik wertlos. Logs gehören **zentral** gesammelt (lokal gehen sie bei Kompromittierung/Reboot verloren), mit definierter **Aufbewahrung (Retention)** und Zugriffsschutz.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `journalctl` / `cat /var/log/*` | Linux-Logs ansehen |
| `logger` | Testmeldung in Syslog schreiben |
| (Windows) Event Viewer | Windows-Logs |

## Lab-Setup

- Ein Linux-Host (Kali/Server). Optional Windows. Keine Zusatzinfra (Zentralisierung folgt in Übung 02).

## Aufgabe (selbst lösen)

1. Sichte auf einem Linux-Host die wichtigsten Logs (auth/ssh, syslog, Dienst-Logs) – wo wird ein fehlgeschlagener/erfolgreicher SSH-Login protokolliert?
2. Schreibe mit `logger` eine Testmeldung mit definierter **Severity** und finde sie im Log wieder.
3. Vergleiche zwei **Formate**: eine Syslog-Zeile vs. eine JSON-Zeile (z. B. Suricata eve.json) – welche ist maschinenlesbarer und warum?
4. Prüfe die **Zeitsync** (NTP) und erkläre, warum sie für Korrelation kritisch ist.
5. Liste die Log-Quellen deines Labs und ordne jeder einen Sicherheitsnutzen zu.

**Ziel:** ein Überblick über Log-Quellen/-Formate, Severity und Zeitsync + eine Quellen-Inventur des Labs als Basis fürs SIEM.

## SY0-701 Prüfungsbezug

- **Log types/sources**, **Syslog**, Windows Event Log, **CEF**, JSON.
- **Zeitsync (NTP)**, Severity, **Log retention**, zentrale Sammlung.
- Begriffe: *syslog*, *event log*, *log aggregation*, *retention*, *time synchronization (NTP)*.
