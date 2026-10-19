# Lösung – Übung 10: Risk Assessment (Capstone)

Muster-Lösungspfad; Qualität = **Durchgängigkeit** (Identify→Analyze→Treat→BIA→Monitor) + nachvollziehbare Zahlen/Entscheidungen.

## 1. Scope & Methodik
- Scope: gesamtes Lab (OPNsense, VMs, Daten, Repo). Framework: **NIST 800-30**; Skalen 1–5 (Ü03); ALE-Formeln (Ü04). Annahmen dokumentiert.

## 2. Identification
- Risk Register aus Übung 02 (≥12 Risiken, Owner/Kategorie), ergänzt um Scan-/Threat-Intel-Funde.

## 3. Qualitative Analyse
- Heatmap (Ü03); Top-Risiken: R1 (ungepatcht), R2 (Backup), R5 (OPNsense-Config), R8 (Secrets).

## 4. Quantitative Analyse
- ALE für Top-3 (Ü04-Beispiele: R1=3.000 €, R2=1.200 €, R8=1.600 €).
- Control R1: ALE 3.000→600 €, Kosten 800 € ⇒ Netto +1.600 € ⇒ lohnt sich.

## 5. Treatment
- R1/R2/R8 mitigate, Großschaden transfer (Versicherung, reale Org), Legacy avoid, R6 accept (dokumentiert, Ü05). Residual Risk je Risiko benannt.

## 6. BIA
- OPNsense: RTO 2 h / RPO 24 h; Repo: RTO 4 h / RPO 1 h (Ü06). Maßnahmen: Config-Backup, häufige Commits, Snapshots/HA.

## 7. Third-Party & Monitoring
- Supply-Chain: Docker-Images (Tags/Integrität) → Hash/Signatur + Pinning (Ü07).
- KRIs: offene kritische CVEs, Patch-Rückstand, Backup-Alter vs. RPO – mit Schwellen (Ü08).

## 8. Report + Roadmap
`risk-assessment-template.md` vollständig; Management Summary (Reifegrad, Top-Risiken, Kernempfehlungen); Roadmap: Quick Wins (MFA, R1-Patch), mittel (Vuln-Zyklus, BIA-Maßnahmen), lang (Continuous Monitoring/Automatisierung); Review halbjährlich + ad hoc.

## Bewertungs-Checkliste
- [ ] Scope + Framework + Skalen definiert
- [ ] Risk Register (≥12) mit Owner/Kategorie
- [ ] Heatmap + Priorisierung
- [ ] ALE für Top-3 + Kosten-Nutzen für ≥1 Control
- [ ] Treatment je Top-Risiko + ≥1 Risk Acceptance + Residual Risk
- [ ] BIA (RTO/RPO/MTD) für ≥2 Assets + Maßnahmen
- [ ] ≥1 Supply-Chain-Risiko + 3 KRIs mit Schwellen
- [ ] Vollständiger Report + Roadmap + Review-Zyklus

## Häufige Fehler / Troubleshooting
- Analyse ohne Treatment/Entscheidung (reine Liste) → kein Nutzen.
- ALE/SLE verwechselt oder Einheiten (pro Jahr) falsch.
- RTO/RPO vertauscht.
- Report zu technisch ohne Management Summary/Priorisierung.
