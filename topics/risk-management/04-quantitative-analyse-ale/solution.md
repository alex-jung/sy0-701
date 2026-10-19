# Lösung – Übung 04: Quantitative Analyse (ALE)

## 1. SLE/ALE (Beispiele)

| Risiko | AV | EF | SLE (AV×EF) | ARO | ALE (SLE×ARO) |
|--------|----|----|-------------|-----|----------------|
| R1 Kompromittierung Ziel-VM/Daten | 10.000 € | 60 % | 6.000 € | 0,5 | 3.000 € |
| R2 Verlust Lab-Config (kein Backup) | 4.000 € | 100 % | 4.000 € | 0,3 | 1.200 € |
| R8 Secret-Leak (Repo) | 8.000 € | 50 % | 4.000 € | 0,4 | 1.600 € |

## 2. Control-Rechnung (Beispiel R1)

- Control: Patch-/Vuln-Mgmt-Zyklus + Segmentierung.
- **ALE vorher:** 3.000 €/Jahr.
- Neue ARO (durch Patching) 0,1, EF unverändert → neues SLE 6.000 €, **ALE nachher** = 6.000 × 0,1 = **600 €/Jahr**.
- Jährliche Control-Kosten (Zeit/Tools): **800 €**.
- **Netto-Nutzen** = ALE_vorher − ALE_nachher − Kosten = 3.000 − 600 − 800 = **+1.600 €/Jahr**.

## 3. Entscheidung

Netto-Nutzen positiv (+1.600 €) → Control **lohnt sich**. (Wäre der Wert negativ, wäre die Control teurer als der verhinderte Schaden → ggf. günstigere Control oder Risiko akzeptieren.)

## 4. Quantitativ vs qualitativ

- **Quantitativ:** wenn belastbare Zahlen (AV/ARO) vorliegen und €-Entscheidungen/Investitionen begründet werden müssen.
- **Qualitativ:** zur schnellen Triage, bei Datenmangel, zur Kommunikation. Praxis: qualitativ breit, quantitativ für die Top-Risiken.

## Hinweise / Troubleshooting

- Einheiten konsistent halten: **ALE ist pro Jahr**; ARO ist eine Rate (0,5 = alle 2 Jahre).
- SLE ist **pro Einzelvorfall** – nicht mit ALE verwechseln (häufiger Prüfungsfehler).
- Garbage in, garbage out: AV/ARO-Schätzungen dokumentieren/begründen.
- Kosten-Nutzen auch **qualitative** Faktoren (Reputation/Recht) nennen, die nicht leicht in € passen.
