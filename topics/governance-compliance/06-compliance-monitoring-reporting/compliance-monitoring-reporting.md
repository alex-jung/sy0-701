# Übung 06 – Compliance-Monitoring & Reporting

**Schwierigkeit: 6/10 · Dauer: ca. 70 Min.**

## Lernziele

- Compliance laufend überwachen und nachweisen
- Anforderungen auf Controls/Evidence mappen (Compliance-Matrix)
- Internes vs. externes Reporting und Attestation verstehen

## Theorie

Compliance ist kein Zustand, sondern ein **fortlaufender Nachweis**. Kernidee: jede Anforderung (aus Gesetz/Standard/Policy) wird auf **Controls** und **Evidence** (Nachweise) abgebildet und regelmäßig überprüft.

- **Compliance-Monitoring:** laufende Prüfung, ob Controls umgesetzt/wirksam sind (automatisiert via SIEM/Scanner/Config-Checks + manuelle Reviews). Metriken: **% erfüllter Anforderungen**, offene Findings, überfällige Maßnahmen.
- **Evidence/Artefakte:** Logs, Scan-Reports, Policy-Freigaben, Schulungsnachweise, Screenshots, Tickets – für Audits (Übung 07).
- **Reporting:** **intern** (Management/Committee: Ampel/Trend/Findings) vs. **extern** (Regulator/Kunde/Auditor). **Attestation** (Selbst-/Management-Bestätigung) vs. externe **Certification/Audit**.
- **Consequences of non-compliance:** Bußgeld, Haftung, Reputations-/Vertragsverlust → Compliance-Gaps wie Risiken behandeln.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Compliance-Matrix (Tabelle) | Anforderung ↔ Control ↔ Evidence |
| SIEM/Scanner/Config-Checks | automatisierte Nachweise |

## Lab-Setup

- Dein Lab + eine gewählte Referenz (z. B. CIS IG1 oder eine selbst gesetzte „Policy-Compliance").

## Aufgabe (selbst lösen)

1. Wähle 6–8 Anforderungen (aus CIS/Policy) und baue eine **Compliance-Matrix**: Anforderung → verantwortliche Control → **Evidence** → Status (compliant/partial/non-compliant).
2. Markiere, welche Nachweise sich **automatisieren** lassen (SIEM/Scanner) und welche manuell sind.
3. Erhebe einen **Compliance-Score** (% erfüllt) und liste die Top-Gaps.
4. Entwirf ein kurzes **Compliance-Report** (intern, 1 Seite): Score, Trend, Top-Findings, Maßnahmen; erkläre den Unterschied zu einem **externen** Report.

**Ziel:** eine Compliance-Matrix mit Evidence + ein internes Compliance-Report mit Score/Gaps.

## SY0-701 Prüfungsbezug

- **5.0** compliance monitoring, evidence/attestation, internal vs. external reporting, compliance reporting, consequences of non-compliance.
- Begriffe: *compliance matrix*, *evidence/artifact*, *attestation*, *internal/external reporting*, *compliance score*, *continuous compliance*.
