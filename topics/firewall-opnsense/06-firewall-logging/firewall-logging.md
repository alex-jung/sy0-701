# Übung 06 – Firewall-Logging & Traffic-Analyse

**Schwierigkeit: 6/10 · Dauer: ca. 55 Min.**

## Lernziele

- Firewall-Logging in OPNsense konfigurieren und lesen (Live View)
- Geblockte vs. erlaubte Verbindungen analysieren
- Logs an einen externen Syslog/SIEM weiterleiten
- Aus Logs Angriffsmuster (z. B. Scans) erkennen

## Theorie

Logs sind die Grundlage von **Detection & Response**. OPNsense protokolliert je Regel (wenn „Log" aktiviert) Treffer; die **Live View** zeigt in Echtzeit, welche Pakete welche Regel passieren/blocken. Wichtig:

- **Default block rule** loggt standardmäßig geblockte Pakete → sichtbar, was abgewiesen wird.
- **Pro-Regel-Logging** bewusst setzen (nicht alles loggen = Rauschen; kritische Regeln ja).
- **Externe Weiterleitung:** Logs sollten zu einem **zentralen Syslog/SIEM** gehen (lokale Logs gehen bei Kompromittierung/Reboot verloren) → Korrelation, Aufbewahrung, Alerting (Bezug zu `logging-siem`).
- In den Logs erkennt man **Scans** (viele geblockte Ports/Zeit von einer Quelle), ungewöhnliche Outbound-Ziele (C2), abgewiesene Inter-VLAN-Versuche.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Firewall → Log Files → Live View | Echtzeit-Logs, Filter |
| Firewall → Log Files → Normalization/Settings | Logging-Optionen |
| System → Settings → Logging/Targets | Remote-Syslog |
| `nmap` (Kali) | Scan erzeugen zum Beobachten |

## Lab-Setup

- OPNsense mit Regelwerk (Übung 02–05). Kali zum Traffic/Scan-Erzeugen. Optional ein Syslog-Empfänger.

## Aufgabe (selbst lösen)

1. Aktiviere Logging für eine Block- und eine Pass-Regel und öffne die **Live View**.
2. Erzeuge von Kali einen **Port-Scan** gegen die Firewall/ein Segment und beobachte die Log-Einträge – woran erkennst du den Scan?
3. Filtere die Logs gezielt (Quelle/Port/Interface/Aktion) und identifiziere die greifende Regel.
4. Richte eine **Remote-Syslog-Weiterleitung** an einen (Test-)Empfänger ein und verifiziere den Eingang.
5. Erkläre, warum lokale Firewall-Logs allein nicht reichen und wie sie ins SIEM passen.

**Ziel:** aussagekräftiges Logging aktiviert, einen Scan in den Logs erkannt und die Weiterleitung an ein zentrales Ziel eingerichtet.

## SY0-701 Prüfungsbezug

- **Logging/Monitoring**, **Syslog**, **SIEM-Integration**, Log-Korrelation.
- **Scan-/Angriffserkennung** aus Firewall-Logs; IoCs.
- **Log-Aufbewahrung/-Integrität** (zentral, manipulationssicher).
- Begriffe: *firewall logging*, *syslog*, *SIEM*, *log correlation*, *indicators of compromise*.
