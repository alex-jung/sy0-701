# Übung 02 – Preparation & Readiness

**Schwierigkeit: 2/10 · Dauer: ca. 50 Min.**

## Lernziele

- Die wichtigste IR-Phase verstehen: Vorbereitung
- Einen IR-Plan, Playbooks und Rollen/Kommunikation entwerfen
- Ein „Jump Bag"/Readiness-Kit und Logging/Backup-Voraussetzungen definieren
- Erkennen, dass Readiness den Ernstfall entscheidet

## Theorie

**Preparation** ist die einzige Phase, die man **vor** dem Vorfall beeinflussen kann – und entscheidet, wie gut die anderen laufen. Bestandteile:

- **IR-Plan/Policy:** wer macht was, wann wird eskaliert, wer darf abschalten.
- **Playbooks:** szenariospezifische Abläufe (Ransomware, Phishing, Datenabfluss, kompromittierter Host).
- **Rollen & Kommunikation:** CSIRT, Incident Commander, Kontaktlisten, **out-of-band** Kommunikation (nicht über das evtl. kompromittierte Netz!), Eskalationspfade, rechtliche/Behörden-Kontakte.
- **Technische Readiness:** zentrales Logging (`logging-siem`), Detection (`ids-ips`), **Backups** (getestet!), Asset-Inventar, Baselines/Known-Good.
- **Jump Bag / Toolkit:** vorbereitete Forensik-Tools, write-blocking-Medien, Dokumentationsvorlagen.

Ohne Preparation improvisiert man im Stress – meist mit Beweisvernichtung und Chaos.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Vorlagen/Dokumente | IR-Plan, Playbook, Kontaktliste |
| (vorhandene) SIEM/Backup | Readiness-Check |

## Lab-Setup

- Konzeptionell + Check der vorhandenen Lab-Infrastruktur (SIEM, Backups, Snapshots).

## Aufgabe (selbst lösen)

1. Entwirf einen **IR-Plan** in Kurzform: Phasen, Rollen, Eskalationskriterien, Entscheidungsbefugnisse.
2. Schreibe ein **Playbook** für ein Szenario (z. B. „kompromittierter Host" oder „Ransomware") mit konkreten Schritten je IR-Phase.
3. Definiere **Kommunikation**: wer wird wann informiert, warum **out-of-band**?
4. Erstelle eine **Readiness-Checkliste** (Logging an? Backups getestet? Snapshots? Asset-Inventar? Tools bereit?) und prüfe dein Lab dagegen.
5. Liste den Inhalt eines **Jump Bag** (Forensik-Toolkit) auf.

**Ziel:** ein knapper IR-Plan + ein Playbook + eine Readiness-Checkliste, gegen die du dein Lab bewertet hast.

## SY0-701 Prüfungsbezug

- **Preparation**: IR-Plan, **Playbooks/Runbooks**, Rollen, **Kommunikationsplan (out-of-band)**, Eskalation.
- **Readiness**: Backups (getestet!), Logging, Asset-Inventar, Baselines.
- Begriffe: *incident response plan*, *playbook/runbook*, *out-of-band communication*, *escalation*, *backups/retention*.
