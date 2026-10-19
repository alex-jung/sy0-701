# Thema: Security Controls

Praxis-/Analyse-Übungen zu **Security Controls** – dem konzeptionellen Rückgrat der SY0-701-Domäne 1.0. Control-**Typen** (preventive/detective/corrective/deterrent/compensating/directive) und -**Kategorien** (technical/managerial/operational/physical), Defense in Depth, Gap-Analyse gegen Baselines, Compensating Controls, Mapping Controls↔Threats (MITRE ATT&CK/NIST CSF), Wirksamkeitsmessung und Framework-Mapping (NIST 800-53 / CIS Controls / ISO 27001). Dieses Thema ist **szenario-/konzeptlastig**, nutzt aber durchgehend **dein echtes Lab** als Objekt (die in den anderen Themen gebauten Controls werden hier klassifiziert, bewertet und auditiert).

> ℹ️ **GRC/Theorie mit Lab-Bezug.** Keine neuen Angriffs-Tools; stattdessen Analyse, Klassifizierung und Reporting. Angriffs-/Test-Nachweise (z. B. aus `vulnerability-scanning`/`hardening`) nur gegen **eigene** Systeme.

## Lernziele

- Control-Typen und -Kategorien sicher unterscheiden und zuordnen (prüfungszentral)
- Defense in Depth / Layered Security im eigenen Lab erkennen
- Control-Gaps gegen eine Baseline (CIS) finden und Compensating Controls entwerfen
- Controls auf Threats/TTPs (ATT&CK) und Frameworks (NIST CSF/800-53, CIS, ISO 27001) mappen
- Control-Wirksamkeit messen/validieren und ein Control-Assessment erstellen

## Abgedeckte SY0-701-Domänen

- **1.0 General Security Concepts** – control categories & types; defense in depth
- **5.0 Program Management & Oversight** – frameworks, control selection, audits/assessments
- **4.0 Security Operations** – control validation/effectiveness (Bezug)

## Übungen (Schwierigkeit 1 → 10)

| #  | Übung | Schwierigkeit |
|----|-------|---------------|
| 01 | Control-Typen (preventive/detective/…) | 1/10 |
| 02 | Control-Kategorien (technical/managerial/…) | 2/10 |
| 03 | Defense in Depth / Layered Security | 3/10 |
| 04 | Lab-Controls inventarisieren & klassifizieren | 4/10 |
| 05 | Control-Gaps gegen eine Baseline (CIS) | 5/10 |
| 06 | Compensating Controls entwerfen | 6/10 |
| 07 | Controls ↔ Threats mappen (ATT&CK/NIST CSF) | 7/10 |
| 08 | Control-Wirksamkeit messen & testen | 8/10 |
| 09 | Framework-Mapping (NIST 800-53 / CIS / ISO 27001) | 9/10 |
| 10 | Capstone: Control-Assessment fürs Lab | 10/10 |

## Lab-Voraussetzungen

- Keine neuen Tools. Genutzt werden dein bestehendes Lab (OPNsense, IDS/IPS, SIEM, Hardening) und Referenzen: **CIS Controls v8**, **CIS Benchmarks**, **NIST SP 800-53**, **NIST CSF**, **ISO/IEC 27001 Annex A**, **MITRE ATT&CK**
- Zur Validierung wiederverwendbar: `lynis`, `greenbone`/`nmap` (Gaps), `wazuh`/`suricata` (Detective Controls), `atomic-red-team`-Konzept (Wirksamkeit)

Reihenfolge: starte bei `01-control-typen/`. Pro Übung erst die `.md` lösen, dann `solution.md`.
