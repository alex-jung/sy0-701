# Übung 07 – Tuning: False Positives, Thresholds, Suppress

**Schwierigkeit: 7/10 · Dauer: ca. 60 Min.**

## Lernziele

- False Positives systematisch erkennen und reduzieren
- Thresholding und Suppression gezielt einsetzen
- Die Balance Signal/Rauschen (Alert Fatigue) verstehen
- Ein getuntes, aussagekräftiges Regelwerk erreichen

## Theorie

Ein frisch installiertes IDS erzeugt oft **Alert-Flut** – viele davon False Positives (FP) oder irrelevant. Zu viele Alerts → **Alert Fatigue** → echte Angriffe gehen unter. **Tuning** macht aus Rauschen Signal:

- **Disable/Policy:** irrelevante Regeln/Kategorien abschalten.
- **Suppress:** eine SID für bestimmte Quellen/Ziele unterdrücken (z. B. „dieser Vuln-Scanner ist bekannt/erlaubt"), ohne die Regel global zu verlieren.
- **Threshold/detection_filter:** erst ab X Treffern / pro Zeit alarmieren bzw. limitieren (gegen Alert-Spam).
- **HOME_NET/Variablen** korrekt (Übung 04) – häufigste FP-Ursache.

Ziel: jede verbleibende Regel soll **actionable** sein (ein Alert = etwas, das man wirklich ansehen will).

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| IDS → Alerts | FP identifizieren (welche SIDs rauschen?) |
| IDS → Administration (Suppress/Policy) | Regeln unterdrücken/anpassen |
| Threshold/suppress-Config | `threshold.config`-Einträge |

## Lab-Setup

- Suricata mit einigen Tagen Alert-Historie bzw. gezielt erzeugtem gemischtem Traffic (legitim + Angriff).

## Aufgabe (selbst lösen)

1. Identifiziere die **lautesten SIDs** (welche Regeln erzeugen die meisten Alerts?) und bewerte, welche FP/irrelevant sind.
2. **Suppress** einen FP für eine bestimmte Quelle (z. B. dein autorisierter Scanner), ohne die Regel komplett zu deaktivieren.
3. Setze ein **Threshold** für eine rauschende, aber relevante Regel (limit/both).
4. Deaktiviere eine komplett irrelevante Kategorie/Regel per Policy.
5. Vergleiche die Alert-Menge vor/nach dem Tuning und erkläre „Alert Fatigue".

**Ziel:** eine spürbar reduzierte, aber weiterhin aussagekräftige Alert-Lage durch gezieltes Suppress/Threshold/Disable.

## SY0-701 Prüfungsbezug

- **False positive/negative**, **Tuning**, **Alert Fatigue**, actionable Alerts.
- **Threshold/suppression** als Betriebspraxis; Balance Erkennung vs. Rauschen.
- Begriffe: *false positive*, *tuning*, *suppression*, *thresholding*, *alert fatigue*.
