# Übung 08 – KRIs, Risk-Monitoring & Reporting

**Schwierigkeit: 8/10 · Dauer: ca. 75 Min.**

## Lernziele

- Key Risk Indicators (KRIs) definieren und von KPIs abgrenzen
- Risiken laufend überwachen und an das Management berichten
- Ein management-taugliches Risk-Reporting/Dashboard entwerfen

## Theorie

Risikomanagement ist kein Einmalprojekt – man muss Risiken **überwachen** und **berichten**. **KRIs (Key Risk Indicators)** sind Frühwarn-Kennzahlen, die anzeigen, dass sich ein Risiko **erhöht** (z. B. Anzahl offener kritischer Schwachstellen, Patch-Rückstand, fehlgeschlagene Logins, überfällige Zugriffs-Reviews, Phishing-Klickrate). Abgrenzung: **KPI** misst **Leistung** (wie gut läuft etwas), **KRI** misst **Risiko** (wie gefährlich wird es); viele Kennzahlen sind beides je nach Blickwinkel.

Gutes Reporting: an die **Zielgruppe** angepasst (Management = Ampel/Trend/Top-Risiken; Technik = Details), mit **Schwellenwerten/Thresholds** (ab wann Alarm/Eskalation), **Trends** (steigt/fällt) und **Handlungsempfehlungen**. Oft als **Risk Dashboard** (Heatmap + Top-Risiken + KRI-Ampeln). Governance-Bezug: regelmäßige Risk-Reviews, Eskalationswege, Risk Committee (`governance-compliance`).

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Risk Register + Dashboard | KRIs/Trends |
| SIEM/Scanner (als Datenquelle) | KRI-Werte (offene CVEs, Logins…) |

## Lab-Setup

- Risk Register + vorhandene Datenquellen (Greenbone offene CVEs, Wazuh-Alerts, Patch-Stand).

## Aufgabe (selbst lösen)

1. Definiere **5 KRIs** für dein Lab mit je **Schwellenwert** (grün/gelb/rot) und Datenquelle.
2. Erhebe aktuelle Werte (soweit möglich) und bestimme den Ampelstatus.
3. Grenze an zwei Beispielen **KRI vs. KPI** ab.
4. Entwirf ein **einseitiges Risk-Dashboard** (Heatmap + Top-5-Risiken + KRI-Ampeln + Trend), adressatengerecht fürs „Management".

**Ziel:** 5 KRIs mit Schwellenwerten + ein management-taugliches Risk-Dashboard für dein Lab.

## SY0-701 Prüfungsbezug

- **5.0** risk monitoring/reporting, KRI vs. KPI, risk register updates, thresholds, risk dashboard, escalation.
- Begriffe: *KRI/KPI*, *risk threshold*, *risk dashboard*, *risk reporting*, *trend/leading indicator*.
