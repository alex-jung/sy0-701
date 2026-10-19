# Übung 02 – Risk Identification & Risk Register

**Schwierigkeit: 2/10 · Dauer: ca. 55 Min.**

## Lernziele

- Risiken systematisch identifizieren (verschiedene Quellen/Methoden)
- Ein Risk Register aufbauen und pflegen
- Risk Owner und Status sauber zuordnen

## Theorie

**Risk Identification** ist der erste Schritt im Risk-Management-Prozess: welche Risiken existieren überhaupt? Quellen/Methoden: Asset-Inventar (aus `security-controls`), Vuln-Scans (`vulnerability-scanning`), Threat Intelligence (`threat-concepts`), Brainstorming/Interviews, Audit-Findings, Incident-Historie, Frameworks/Checklisten.

Das zentrale Werkzeug ist das **Risk Register**: eine lebende Liste aller Risiken mit mindestens: ID, Beschreibung (Threat/Vuln/Asset), Likelihood, Impact, resultierendes Risiko, **Risk Owner** (wer verantwortet die Behandlung), geplante/umgesetzte Controls, Treatment-Entscheidung und Status. Das Register ist die Grundlage für Analyse (03/04), Treatment (05) und Reporting (08).

Risiko-Kategorien helfen bei Vollständigkeit: **external/internal**, **legacy systems**, **IP theft**, **software compliance/licensing**, **operational**, **financial**, **strategic**, **reputational**.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Tabelle/CSV | Risk Register |
| vorhandenes Asset-/Control-Inventar | Input |

## Lab-Setup

- Dein Lab + das Control-Inventar aus `security-controls` als Ausgangspunkt.

## Aufgabe (selbst lösen)

1. Identifiziere mind. **10** Risiken für dein Lab aus **mindestens drei** verschiedenen Quellen/Methoden (Inventar, Scan, Incident-Historie, Brainstorming…).
2. Baue ein **Risk Register** mit den Spalten: ID, Beschreibung (Threat/Vuln/Asset), Kategorie, Likelihood, Impact, Risiko, Owner, Control(s), Status.
3. Ordne jedem Risiko eine **Kategorie** und einen **Risk Owner** zu.
4. Markiere, welche Risiken aus welcher Identifikationsquelle stammen – welche Quelle war am ergiebigsten?

**Ziel:** ein befülltes, strukturiertes Risk Register (≥10 Risiken) als Arbeitsgrundlage für die Analyse.

## SY0-701 Prüfungsbezug

- **5.0** risk identification, risk register, risk owner, risk categories (external/internal/legacy/…).
- Begriffe: *risk register*, *risk owner*, *risk identification*, *risk categories*, *key risk indicators (Bezug)*.
