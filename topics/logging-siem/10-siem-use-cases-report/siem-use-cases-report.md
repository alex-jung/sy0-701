# Übung 10 – SIEM-Use-Cases & Report

**Schwierigkeit: 10/10 · Dauer: ca. 2–3 Std.**

## Lernziele

- Alle SIEM-Bausteine zu einem Monitoring-/Detection-Programm bündeln
- SIEM-Use-Cases strukturiert definieren (Ziel → Datenquellen → Logik → Response)
- Coverage gegen MITRE ATT&CK bewerten und Gaps priorisieren
- Einen SIEM-/Logging-Report erstellen

## Theorie

Ein **SIEM-Use-Case** ist eine dokumentierte Erkennungsabsicht:
```
Ziel (was erkennen?) → benötigte Datenquellen → Detection-Logik (Regel/Korrelation)
→ erwartete Alerts → Response/Playbook → ATT&CK-Mapping → Status/Coverage
```
Ein gutes Programm hat eine **Use-Case-Bibliothek** (Brute-Force, PrivEsc, Lateral Movement, C2, Exfil, neue Admin-User, FIM-Änderungen …), die Coverage ist gegen **MITRE ATT&CK** gemessen, und jeder Use-Case hat ein **Response-Playbook** (Anbindung an `incident-response`). Logging-Governance (Quellen, Retention, Integrität, Zugriff) rundet es ab.

Die beiliegende `siem-report-template.md` ist das Gerüst.

## Verwendete Tools

Kombination aus Übung 01–09: Wazuh (oder ELK), Detection-Regeln, Dashboards/Alerting, Korrelation/Hunting + `siem-report-template.md`.

## Lab-Setup

- Das aufgebaute SIEM mit Quellen (Übung 03/04) + Regeln (Übung 06). Angriffe aus den offensiven Themen als Testfälle.

## Aufgabe (selbst lösen)

Baue eine kleine Use-Case-Bibliothek und dokumentiere sie.

1. Definiere **mindestens vier Use-Cases** (z. B. SSH-Brute-Force, PrivEsc, Lateral Movement/PtH, C2-Beaconing) jeweils mit Ziel → Quellen → Logik → Response → ATT&CK.
2. **Teste** jeden Use-Case mit einem realen Angriff (aus den offensiven Themen) und belege den Alert.
3. Bewerte die **Coverage** gegen ATT&CK (abgedeckt / Lücke) und priorisiere die wichtigsten Gaps.
4. Definiere pro Use-Case ein kurzes **Response-Playbook** (Triage → Investigate → Contain).
5. **Report:** fülle `siem-report-template.md` – Use-Cases, Coverage, Gaps, Logging-Governance (Quellen/Retention).

**Ziel:** eine getestete SIEM-Use-Case-Bibliothek mit ATT&CK-Coverage, Response-Playbooks und einem Report.

## SY0-701 Prüfungsbezug

- **SIEM use cases / detection coverage**, **MITRE ATT&CK**, Response-Playbooks.
- **Logging governance**: Quellen, **Retention**, Integrität, Zugriff, Reporting.
- Anbindung an **Incident Response / SOC**.
- Begriffe: *SIEM use case*, *detection coverage*, *MITRE ATT&CK*, *playbook*, *log retention/governance*.
