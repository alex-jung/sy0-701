# Übung 10 – Capstone: Risk Assessment fürs Lab

**Schwierigkeit: 10/10 · Dauer: ca. 3–4 Std.**

## Lernziele

- Einen vollständigen Risk-Assessment-Prozess end-to-end durchführen
- Qualitative + quantitative Analyse, Treatment, BIA und Reporting zusammenführen
- Einen management-tauglichen Risk-Assessment-Report erstellen

## Theorie

Dieses Capstone bündelt Übungen 01–09 zu einem echten **Risk Assessment** (nach NIST 800-30-Logik): Scope → Risk Identification → qualitative Analyse (Heatmap) → quantitative Analyse (ALE) der Top-Risiken → Treatment-Entscheidungen → BIA (RTO/RPO) für kritische Assets → Third-Party-Betrachtung → KRIs/Reporting → Review-Zyklus. Ergebnis ist ein Report, den ein „Management" zur Entscheidung nutzen könnte. Nutze `risk-assessment-template.md`.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Risk Register + Heatmap + ALE-Tabelle | Analyse |
| BIA-Tabelle | RTO/RPO |
| Greenbone/Wazuh (optional) | Daten/KRIs |

## Lab-Setup

- Dein gesamtes Lab + Ergebnisse der Übungen 02–09.

## Aufgabe (selbst lösen)

Erstelle ein vollständiges Risk Assessment:

1. **Scope & Methodik:** Umfang, gewähltes Framework (NIST 800-30/RMF, ISO 31000), Skalen/Annahmen.
2. **Identification:** Risk Register (≥12 Risiken, Owner, Kategorie).
3. **Qualitative Analyse:** Heatmap + Priorisierung (Top-Risiken).
4. **Quantitative Analyse:** AV/EF/SLE/ARO/**ALE** für die **Top-3**; für ≥1 Risiko eine Control per Kosten-Nutzen bewerten.
5. **Treatment:** je Top-Risiko eine begründete Strategie (mitigate/transfer/avoid/accept); ≥1 dokumentierte Risk Acceptance; Residual Risk.
6. **BIA:** RTO/RPO/MTD für ≥2 kritische Assets + abgeleitete Maßnahmen.
7. **Third-Party & Monitoring:** mind. ein Supply-Chain-Risiko + 3 KRIs mit Schwellen.
8. **Report + Roadmap:** `risk-assessment-template.md` vollständig, inkl. Management Summary, priorisierten Empfehlungen und Review-Zyklus.

**Ziel:** ein durchgängiges, belegtes Risk Assessment deines Labs (Identify→Analyze→Treat→BIA→Monitor) + management-tauglicher Report mit Roadmap.

## SY0-701 Prüfungsbezug

- **5.0 (+4.0/1.0)** kombiniert: risk process, qualitative/quantitative analysis (ALE), treatment, BIA (RTO/RPO), third-party, KRIs/reporting, frameworks.
- Prüfungsnah: ALE rechnen, Treatment begründen, RTO/RPO ableiten, Residual Risk bewerten.
- Begriffe: *risk assessment*, *risk register*, *heat map*, *SLE/ARO/ALE*, *treatment*, *BIA/RTO/RPO*, *residual risk*, *KRI*.
