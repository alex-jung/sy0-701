# Übung 10 – Detection-Engineering & SOC-Workflow + Report

**Schwierigkeit: 10/10 · Dauer: ca. 2–3 Std.**

## Lernziele

- Alle IDS/IPS-Bausteine zu einem Detection-/Monitoring-Konzept bündeln
- Einen SOC-Workflow nachvollziehen (Detect → Triage → Investigate → Respond)
- Detection-Coverage bewerten (MITRE ATT&CK) und Gaps schließen
- Einen Detection-/Monitoring-Report erstellen

## Theorie

**Detection Engineering** ist der kontinuierliche Prozess, Erkennung zu bauen, zu testen und zu verbessern:

1. **Sammeln:** Suricata (Signaturen) + Zeek (Metadaten) + Firewall-Logs → zentral (SIEM, Bezug `logging-siem`).
2. **Detektieren:** Regeln/Analytics je Angriffsphase (Scan/Exploit/C2/Exfil).
3. **Triage (SOC L1):** Alert bewerten (TP/FP, Severity, Kontext).
4. **Investigate (L2):** korrelieren (Firewall + IDS + Zeek + Host), Umfang bestimmen.
5. **Respond:** blockieren/isolieren, an IR übergeben (Bezug `incident-response`).
6. **Improve:** Gaps schließen (neue Regel/Analytic), FP tunen, Coverage gegen **MITRE ATT&CK** messen.

Ziel: **Coverage** je ATT&CK-Technik dokumentieren – was wird erkannt, was nicht (Detection-Gaps). `detection-report-template.md` ist das Gerüst.

## Verwendete Tools

Kombination aus Übung 01–09: Suricata (IDS/IPS), eigene Regeln, Zeek, Firewall-Logs, (SIEM) + `detection-report-template.md`.

## Lab-Setup

- Getunte Suricata + Zeek + Firewall-Logging. Angriffe aus den offensiven Themen als Testfälle. Optional SIEM.

## Aufgabe (selbst lösen)

Baue ein kleines Detection-/Monitoring-Konzept für dein Lab und teste es.

1. **Coverage-Matrix:** liste typische Angriffsphasen/ATT&CK-Techniken (Scan, Exploit, Lateral Movement, C2, Exfil) und ob/wie du sie erkennst (Suricata/Zeek/Firewall).
2. **Testfälle:** fahre je Phase einen Angriff (aus den offensiven Themen) und prüfe die Erkennung.
3. **SOC-Workflow:** gehe für einen Alert den Weg Detect → Triage → Investigate → Respond durch (dokumentiert).
4. **Gaps schließen:** identifiziere eine Lücke und schließe sie (neue Suricata-Regel oder Zeek-Analytic).
5. **Report:** fülle `detection-report-template.md` – Coverage, Gaps, Verbesserungen, SOC-Prozess.

**Ziel:** eine getestete Detection-Coverage-Matrix mit geschlossenem Gap + ein dokumentierter SOC-Workflow und Report.

## SY0-701 Prüfungsbezug

- **SOC-Workflow / Detection & Response**, Alert-Triage, Eskalation, **SIEM-Korrelation**.
- **MITRE ATT&CK Coverage**, Detection-Gaps, kontinuierliche Verbesserung.
- **IR-Anbindung** (Bezug `incident-response`).
- Begriffe: *detection engineering*, *SOC*, *triage/escalation*, *MITRE ATT&CK coverage*, *SIEM*, *continuous improvement*.
