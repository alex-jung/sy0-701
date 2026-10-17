# Übung 02 – Zentrales Syslog einrichten

**Schwierigkeit: 2/10 · Dauer: ca. 50 Min.**

## Lernziele

- Einen zentralen Syslog-Server einrichten (rsyslog)
- Clients (Linux, OPNsense) zum Weiterleiten konfigurieren
- Transport verstehen (UDP/TCP/TLS 514) und absichern
- Warum zentrales, manipulationssicheres Logging wichtig ist

## Theorie

**Zentrales Logging** sammelt Logs vieler Systeme an einem Ort → Korrelation, Aufbewahrung, Schutz vor lokaler Manipulation. Ein Angreifer, der einen Host kompromittiert, kann dessen **lokale** Logs löschen – aber nicht die bereits weitergeleiteten.

Transport:
- **UDP 514:** einfach, aber unzuverlässig (Verlust möglich) + unverschlüsselt.
- **TCP 514:** zuverlässiger.
- **TLS (RELP/Syslog over TLS):** verschlüsselt + authentifiziert → empfohlen.

Der zentrale Server (**rsyslog**/syslog-ng) nimmt entgegen, kann nach Quelle/Severity in Dateien/Datenbanken sortieren und dient als **Vorstufe/Input fürs SIEM** (Übung 03). Wichtig: **Integrität** (append-only/WORM, Zugriffsschutz) und **Zeitsync**.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `rsyslog` | zentraler Server + Client-Weiterleitung |
| OPNsense → Logging Targets | Firewall-Logs weiterleiten |
| `logger` / Angriff | Testmeldungen erzeugen |

## Lab-Setup

- Eine Linux-VM als **Log-Server** (rsyslog). Ein/zwei Client-Hosts + OPNsense als Quellen. NTP überall.

## Aufgabe (selbst lösen)

1. Richte auf einer VM einen **rsyslog-Server** ein, der Remote-Logs annimmt (TCP 514), und sortiere eingehende Logs pro Quell-Host in eigene Dateien.
2. Konfiguriere einen **Linux-Client**, seine Logs an den Server weiterzuleiten; verifiziere den Eingang.
3. Leite **OPNsense**-Logs (Firewall/Suricata) an denselben Server weiter (Bezug Übung 06 `firewall-opnsense`).
4. Erzeuge Testereignisse (fehlgeschlagener SSH-Login + ein Scan) und finde sie zentral wieder.
5. Erkläre, warum ein Angreifer zentrale Logs schwerer manipulieren kann – und wie man Integrität/Transport absichert.

**Ziel:** ein funktionierender zentraler Syslog-Server, der Logs von Linux-Clients und OPNsense empfängt und pro Quelle ablegt.

## SY0-701 Prüfungsbezug

- **Centralized logging / log aggregation**, Transport (UDP/TCP/TLS), **Log integrity/WORM**.
- **Anti-tampering** (Angreifer kann lokale, nicht weitergeleitete Logs löschen).
- Begriffe: *syslog server*, *log forwarding*, *log integrity*, *WORM*, *secure transport (TLS)*.
