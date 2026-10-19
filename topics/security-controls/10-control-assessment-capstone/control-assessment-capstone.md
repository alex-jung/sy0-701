# Übung 10 – Capstone: Control-Assessment fürs Lab

**Schwierigkeit: 10/10 · Dauer: ca. 3–4 Std.**

## Lernziele

- Ein vollständiges Control-Assessment des eigenen Labs durchführen
- Inventar, Klassifizierung, Gaps, Mapping, Wirksamkeit und Empfehlungen zusammenführen
- Einen professionellen, management-tauglichen Assessment-Report schreiben

## Theorie

Dieses Capstone bündelt Übungen 01–09 zu einem echten **Security Control Assessment**: Scope → **Inventar** (04) → **Klassifizierung** nach Kategorie/Typ (01/02) → **Gap-Analyse** gegen eine Baseline (05) → **Threat-/Framework-Mapping** (07/09) → **Wirksamkeitstests** (08) → **Compensating Controls** für nicht schließbare Gaps (06) → **priorisierte Empfehlungen** mit Risiko. Das Ergebnis ist ein Report, den man einem „Management" vorlegen könnte. Nutze `control-assessment-template.md`.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Control-Inventar + Crosswalk | Daten aus 04/09 |
| `lynis`/`greenbone`/`nmap` | Gap-/Validierungs-Belege |
| `wazuh`/`suricata` | Detective-Wirksamkeit |
| CIS/NIST/ISO | Baseline & Mapping |

## Lab-Setup

- Dein gesamtes Lab + Ergebnisse der Übungen 01–09.

## Aufgabe (selbst lösen)

Erstelle ein vollständiges Control-Assessment:

1. **Scope & Methodik:** definiere Umfang (welche Systeme/Netze) und das gewählte **Leitframework/Baseline**.
2. **Inventar & Klassifizierung:** ≥ 15 Controls, je Kategorie × Typ (aus 01/02/04).
3. **Gap-Analyse:** gegen die Baseline (05), Gaps mit Tool-Belegen, nach Risiko priorisiert.
4. **Mapping:** Controls ↔ Top-Threats (ATT&CK) **und** ↔ Framework (Crosswalk) aus 07/09.
5. **Wirksamkeit:** validiere mind. drei Controls aktiv (08) mit Nachweis; nenne KPIs (MTTD etc.).
6. **Compensating Controls:** für mind. zwei nicht schließbare Gaps (06), dokumentiert.
7. **Empfehlungen & Roadmap:** priorisierte Maßnahmen (Quick Wins vs. mittel-/langfristig), Rest-Risiko.
8. **Report:** fülle `control-assessment-template.md` vollständig aus (inkl. Management Summary).

**Ziel:** ein durchgängiges, belegtes Control-Assessment deines Labs + ein management-tauglicher Report mit priorisierter Roadmap.

## SY0-701 Prüfungsbezug

- **1.0/4.0/5.0** kombiniert: control categories/types, defense in depth, baselines/gap analysis, frameworks, validation/metrics, risk-based recommendations, assessment/reporting.
- Prüfungsnah: Controls korrekt klassifizieren, Lücken/Priorität begründen, Wirksamkeit belegen.
- Begriffe: *security control assessment*, *gap analysis*, *crosswalk*, *control validation*, *residual risk*, *roadmap/prioritization*.
