# Übung 04 – Quantitative Risikoanalyse (SLE/ARO/ALE)

**Schwierigkeit: 4/10 · Dauer: ca. 60 Min.**

## Lernziele

- Quantitative Risikokennzahlen berechnen: AV, EF, SLE, ARO, ALE
- Kosten-Nutzen einer Control über die ALE-Reduktion bewerten
- Quantitativ vs. qualitativ richtig einordnen

## Theorie

**Quantitative** Analyse bewertet Risiken in **Geld**. Kernformeln (prüfungsrelevant!):

- **AV (Asset Value)** – Wert des Assets (€).
- **EF (Exposure Factor)** – Anteil des Assets, der bei einem Vorfall verloren geht (0–100 %).
- **SLE (Single Loss Expectancy)** = **AV × EF** – Schaden pro Einzelvorfall.
- **ARO (Annualized Rate of Occurrence)** – wie oft pro Jahr (z. B. 0,5 = alle 2 Jahre).
- **ALE (Annualized Loss Expectancy)** = **SLE × ARO** – erwarteter Jahresschaden.

**Kosten-Nutzen einer Control:** lohnt sich, wenn die **Reduktion der ALE** größer ist als die **jährlichen Kosten** der Control. Faustregel: Nutzen = `ALE_vorher − ALE_nachher − jährliche_Control-Kosten`. Ist das positiv, ist die Control wirtschaftlich.

Vorteil: objektiv, vergleichbar, €-Entscheidungen. Nachteil: braucht belastbare Daten (AV/ARO oft schwer zu schätzen). Deshalb in der Praxis **qualitativ zuerst**, **quantitativ für Top-Risiken**.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Taschenrechner/Tabelle | SLE/ALE-Rechnung |
| Risk Register | Input (Top-Risiken) |

## Lab-Setup

- Die Top-Risiken aus Übung 03.

## Aufgabe (selbst lösen)

1. Wähle **drei** Top-Risiken und schätze je AV, EF, ARO; berechne **SLE** und **ALE**.
2. Für **ein** Risiko: schlage eine Control vor, schätze deren **jährliche Kosten** und die **neue ARO/EF**; berechne die **ALE danach** und den **Netto-Nutzen**.
3. Entscheide begründet, ob sich die Control lohnt.
4. Erkläre, wann du **quantitativ** und wann **qualitativ** bevorzugst.

**Ziel:** SLE/ARO/ALE korrekt berechnen und eine Control per Kosten-Nutzen (ALE-Reduktion) bewerten.

## SY0-701 Prüfungsbezug

- **5.0** quantitative risk analysis: AV, EF, SLE, ARO, ALE; cost-benefit of controls.
- **Die ALE-Formeln sind klassischer Prüfungsstoff** (rechnen können!).
- Begriffe: *SLE = AV×EF*, *ALE = SLE×ARO*, *ARO*, *exposure factor*, *cost-benefit analysis*.
