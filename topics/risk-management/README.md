# Thema: Risk Management

Praxis-/Analyse-Übungen zum **Risikomanagement** (SY0-701-Domäne 5.0): Risiko-Grundbegriffe, Risk Identification/Register, qualitative & quantitative Analyse (SLE/ARO/ALE), Risk-Treatment-Strategien, Business Impact Analysis (RTO/RPO/MTD), Third-Party-/Supply-Chain-Risiko, KRIs/Reporting und kontinuierliches Risikomanagement. Szenario-/rechenlastig mit Bezug zum eigenen Lab als Beispiel-„Organisation". Verbindet `security-controls`, `governance-compliance` und (operativ) `incident-response`.

> ℹ️ **GRC/Theorie mit Lab-Bezug.** Keine Angriffs-Tools; Fokus auf Methodik, Berechnung, Dokumentation und Entscheidungen. Zahlenbeispiele sind illustrativ.

## Lernziele

- Risiko-Grundbegriffe sauber unterscheiden (threat, vulnerability, likelihood, impact, inherent/residual)
- Risiken identifizieren und ein Risk Register führen
- Qualitative (Matrix) und quantitative (SLE·ARO=ALE) Analyse durchführen
- Risk-Treatment-Strategien wählen und begründen (avoid/transfer/mitigate/accept)
- BIA mit RTO/RPO/MTD/MTBF/MTTR erstellen
- Third-Party-/Supply-Chain-Risiken bewerten und KRIs/Reporting aufsetzen

## Abgedeckte SY0-701-Domänen

- **5.0 Program Management & Oversight** – risk management process, assessment types, risk analysis, treatment, BIA, third-party risk
- **4.0 Security Operations** – Bezug zu IR/Continuity (RTO/RPO)
- **1.0 General Security Concepts** – CIA/Impact, controls (Bezug)

## Übungen (Schwierigkeit 1 → 10)

| #  | Übung | Schwierigkeit |
|----|-------|---------------|
| 01 | Risk-Grundbegriffe & Risikogleichung | 1/10 |
| 02 | Risk Identification & Risk Register | 2/10 |
| 03 | Qualitative Risikoanalyse (Matrix) | 3/10 |
| 04 | Quantitative Risikoanalyse (SLE/ARO/ALE) | 4/10 |
| 05 | Risk-Treatment-Strategien | 5/10 |
| 06 | Business Impact Analysis (RTO/RPO/MTD) | 6/10 |
| 07 | Third-Party- & Supply-Chain-Risiko | 7/10 |
| 08 | KRIs, Risk-Monitoring & Reporting | 8/10 |
| 09 | Continuous Risk Management | 9/10 |
| 10 | Capstone: Risk Assessment fürs Lab | 10/10 |

## Lab-Voraussetzungen

- Keine Tools nötig – Tabellenkalkulation/Markdown genügt (Risk Register, ALE-Rechnung, BIA, Heatmap)
- Referenzen: **NIST SP 800-30** (Risk Assessment), **NIST RMF (800-37)**, **ISO 31000/27005**
- Als „Organisation" dient dein Lab (Assets: OPNsense, Ziel-VMs, Daten, dieses Repo)

Reihenfolge: starte bei `01-risk-grundbegriffe/`. Pro Übung erst die `.md` lösen, dann `solution.md`.
