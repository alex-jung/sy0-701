# Lösung – Übung 05: Risk Treatment

## 1./2. Strategien je Risiko (Beispiele)

| Risiko | Strategie | Begründung |
|--------|-----------|------------|
| R1 ungepatchter Dienst | **Mitigate** | Patch/Segmentierung, Netto-Nutzen positiv (Übung 04) |
| R2 kein Backup | **Mitigate** | Backup/Snapshots – günstig, hoher Impact |
| R8 Secret-Leak | **Mitigate** | `.gitignore`/Secret-Scanning |
| Datenverlust-Großschaden | **Transfer** | (reale Org) Cyber-Versicherung/SLA |
| Betrieb eines riskanten Legacy-Dienstes | **Avoid** | Dienst abschalten, wenn nicht nötig |
| R6 Stromausfall (Lab) | **Accept** | geringer Impact, USV unwirtschaftlich fürs Lab |

Alle vier abgedeckt: mitigate (R1/R2/R8), transfer (Versicherung), avoid (Legacy abschalten), accept (R6).

## 3. Risk-Acceptance-Notiz (Beispiel R6)

> **Risiko R6 – Stromausfall → kurzer Lab-Ausfall.** Likelihood niedrig, Impact niedrig (nur Lab, keine Produktion). Behandlung (USV) unwirtschaftlich gegenüber Schaden. **Entscheidung:** akzeptiert. **Rest-Risiko:** kurzer Ausfall, Daten durch Snapshots gesichert. **Genehmiger:** Lab-Owner. **Review:** in 12 Monaten / bei Lab-Ausbau.

## 4. Transfer ≠ Verantwortung weg

Eine Versicherung/ein Dienstleister übernimmt die **finanzielle** Folge, aber die **Accountability** (Rechenschaft, Reputationsschaden, rechtliche Pflicht) bleibt bei der Organisation. Ein Datenleck bleibt **dein** Vorfall, auch wenn ein Dritter zahlt. Daher Transfer meist **zusätzlich** zu Mitigation, nicht als Ersatz.

## Hinweise / Troubleshooting

- „Accept" ohne Dokumentation/Genehmigung ist kein Treatment, sondern Ignorieren.
- Transfer braucht Prüfung der SLA/Vertragsklauseln (was ist wirklich abgedeckt?).
- Treatment-Entscheidung + Owner + Residual Risk zurück ins Register.
