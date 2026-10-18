# Übung 10 – Vollständige IR-Übung (Tabletop + technisch)

**Schwierigkeit: 10/10 · Dauer: ca. 3 Std.**

## Lernziele

- Den gesamten IR-Lifecycle an einem realistischen Vorfall durchspielen
- Prozess (Rollen/Entscheidungen) und Technik (Forensik/Containment) verbinden
- Alle vorherigen Übungen zu einem Ende-zu-Ende-Ablauf integrieren
- Einen vollständigen IR-Report erstellen

## Theorie

Eine **IR-Übung** kombiniert ein **Tabletop** (prozessual: Rollen, Entscheidungen, Kommunikation durchspielen) mit der **technischen** Behandlung (Triage, Containment, Forensik, Recovery). Sie testet die **Readiness** (Übung 02) unter realistischen Bedingungen und deckt Lücken auf, **bevor** ein echter Vorfall kommt.

Ablauf (alle Phasen):
Preparation → **Injekt** (Vorfall) → Detection/Triage → Containment → Beweissicherung/Forensik → Eradication/Recovery → Timeline → Postmortem.

`ir-report-template.md` ist das Gerüst. Ziel ist ein durchgängiger, dokumentierter Lauf mit klaren Entscheidungen und Nachweisen.

## Verwendete Tools

Kombination aus Übung 01–09: SIEM/IDS, Containment (Firewall/Account), Forensik (Volatility/Sleuth Kit/plaso), Report-Vorlage.

## Lab-Setup

- Vollständiges Lab (Opfer-Host, Detection-Stack, Snapshots). Ein vorbereitetes Angriffsszenario (aus den offensiven Themen), das als „Injekt" gefahren wird.

## Aufgabe (selbst lösen)

Spiele einen kompletten Vorfall durch (z. B. „kompromittierter Webserver → Lateral Movement").

1. **Injekt:** fahre den mehrstufigen Angriff (Scan → Exploit → Shell → Persistence → Lateral/C2).
2. **Detection & Triage:** erkenne, verifiziere, klassifiziere (Übung 03), deklariere den Incident + Rollen.
3. **Containment:** dämme ein, ohne Beweise zu zerstören (Übung 04).
4. **Forensik:** sichere Beweise (Übung 05) und analysiere Memory/Disk/Timeline (Übung 06/08).
5. **Eradication/Recovery:** Root Cause schließen, bereinigen/neu aufsetzen, nachüberwachen (Übung 07).
6. **Postmortem + Report:** fülle `ir-report-template.md` (Timeline, Root Cause, Impact, Lessons Learned, MTTD/MTTR, Action Items).

**Ziel:** ein vollständiger, dokumentierter IR-Durchlauf (Prozess + Technik) über alle Phasen mit abschließendem Report.

## SY0-701 Prüfungsbezug

- **Gesamter IR-Lifecycle**, **Tabletop Exercise**, Rollen/Entscheidungen, Technik + Prozess.
- **Reporting**, MTTD/MTTR, Lessons Learned, Readiness-Validierung.
- Begriffe: *incident response exercise*, *tabletop*, *full lifecycle*, *MTTD/MTTR*, *after-action report*.
