# Übung 09 – Continuous Risk Management

**Schwierigkeit: 9/10 · Dauer: ca. 80 Min.**

## Lernziele

- Den Risk-Management-Prozess als kontinuierlichen Zyklus verstehen
- Assessment-Typen (ad hoc, recurring, one-time, continuous) einordnen
- Risikomanagement in NIST RMF / ISO 31000 verorten

## Theorie

Risiko ist dynamisch: neue Threats, neue Assets, geänderte Controls. Deshalb ist Risikomanagement ein **fortlaufender Zyklus**: **Identify → Assess (Analyze) → Treat → Monitor → (Review) → Identify …** – mit regelmäßiger Aktualisierung des Risk Registers.

**Assessment-Typen (SY0-701):**
- **One-time:** einmalig, z. B. vor einem Projekt.
- **Recurring:** regelmäßig (jährlich/quartalsweise).
- **Ad hoc:** anlassbezogen (nach Vorfall, großer Änderung, neuer Bedrohung).
- **Continuous:** laufende Überwachung (Automatisierung, KRIs, Continuous Monitoring).

**Frameworks:** **NIST RMF (SP 800-37)** mit 7 Schritten (Prepare, Categorize, Select, Implement, Assess, Authorize, Monitor) und **ISO 31000** (Prinzipien/Rahmen/Prozess) geben den Managementrahmen. **Continuous Monitoring** (Schritt „Monitor") verbindet das mit SecOps (SIEM/Scanner/KRIs). Trigger für Re-Assessment: Change-Management, Incidents, neue Vulnerabilities, M&A, neue Regulierung.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Risk Register + Review-Plan | Zyklus betreiben |
| SIEM/Scanner | Continuous Monitoring (Datenquellen) |

## Lab-Setup

- Risk Register + Monitoring-Quellen aus den Vorthemen.

## Aufgabe (selbst lösen)

1. Zeichne den Risk-Management-Zyklus und ordne deine bisherigen Übungen (01–08) den Phasen zu.
2. Lege für dein Lab einen **Review-Rhythmus** fest: welche Assessments **recurring**, welche **ad hoc** (mit konkreten Triggern)?
3. Mappe die Schritte auf **NIST RMF** (oder ISO 31000) und benenne, was „Continuous Monitoring" in deinem Lab konkret bedeutet (Datenquellen/KRIs).
4. Definiere **drei Trigger**, die ein außerplanmäßiges (ad hoc) Re-Assessment auslösen.

**Ziel:** einen betreibbaren, kontinuierlichen Risk-Prozess für dein Lab definieren (Rhythmus, Trigger, RMF-Mapping, Continuous Monitoring).

## SY0-701 Prüfungsbezug

- **5.0** risk management process/lifecycle, assessment types (one-time/recurring/ad hoc/continuous), NIST RMF, ISO 31000, continuous monitoring.
- Begriffe: *risk lifecycle*, *recurring/ad hoc/continuous assessment*, *NIST RMF*, *ISO 31000*, *continuous monitoring*, *change trigger*.
