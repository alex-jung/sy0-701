# Lösung – Übung 10: Vollständige IR-Übung

Beispiel: „kompromittierter Webserver → Lateral Movement". `ir-report-template.md` ist das Gerüst. Snapshots!

## 1. Injekt (Angriff fahren)

```bash
sudo nmap -sS -p- <ziel>                     # Scan
# Web-Upload/Exploit -> Webshell -> Reverse-Shell (web-exploitation/exploitation)
# Persistence (cron/key) + Zugriff auf 2. Host (post-exploitation)
```

## 2. Detection & Triage

SIEM/IDS-Alert bestätigen (Übung 03), Multi-Source-Verifikation, Scope/IoCs, **Severity** → Incident deklarieren, **Rollen** besetzen (IC/Analyst/Comms), out-of-band kommunizieren.

## 3. Containment

Host per OPNsense isolieren (nicht ausschalten), Konto sperren/Credentials rotieren, weitere Zugänge prüfen (Übung 04) – alles zeitgestempelt.

## 4. Forensik

Flüchtige Daten + RAM-Image (avml) + Disk-Image mit Hashes (Übung 05), Volatility (böser Prozess + C2) und Sleuth Kit/plaso (Artefakte + Timeline, Übung 06/08). Chain of Custody führen.

## 5. Eradication/Recovery

Root Cause (unsicherer Upload) schließen + patchen, Persistence/Webshell/Konto entfernen, Host aus Known-Good neu aufsetzen, IoC-Watchlist + verschärftes Monitoring (Übung 07).

## 6. Postmortem + Report

`ir-report-template.md` ausfüllen: Executive Summary, Timeline (ATT&CK), Response je Phase, Root Cause/Impact, IoCs, Lessons Learned/Action Items, MTTD/MTTR, Meldepflichten.

## Tabletop-Aspekt (Prozess)

Parallel die **Entscheidungen** durchspielen: Wer entscheidet über Isolation/Abschaltung? Wann Management/Behörde? Reichen Playbook/Backups/Comms? → Readiness-Lücken notieren (fließen in Lessons Learned).

## Kernaussagen (Prüfung)

- **Prozess + Technik** gehören zusammen (Tabletop + Hands-on).
- Reihenfolge strikt: **Containment + Beweise vor Eradication**; nicht ausschalten (Memory).
- **Blameless Postmortem** + messbare Action Items + MTTD/MTTR.
- Übung deckt Readiness-Lücken auf, bevor der Ernstfall kommt.

## Häufige Fehler / Troubleshooting

- **Phasen übersprungen:** erst eindämmen/sichern, dann bereinigen.
- **Keine Doku/Zeitstempel:** Timeline/Report unmöglich (NTP!).
- **Kette reißt im Lab:** Snapshots zum Zurücksetzen.
- **Nur Technik, kein Prozess:** die Entscheidungen/Rollen sind prüfungs- und praxisrelevant.
