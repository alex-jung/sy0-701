# Übung 09 – Security-Awareness-Programm

**Schwierigkeit: 9/10 · Dauer: ca. 80 Min.**

## Lernziele

- Ein Security-Awareness-Programm planen (Inhalte, Zielgruppen, Zyklus)
- Awareness als Control verankern und ihre Wirksamkeit messen
- Phishing-Simulationen und rollenbasierte Schulung einordnen

## Theorie

Der Mensch ist ein zentraler Angriffsvektor (vgl. `social-engineering`). Ein **Security-Awareness-Programm** ist eine **operational/managerial Control**, die menschliches Verhalten adressiert. Bausteine (SY0-701):

- **Inhalte/Kampagnen:** Phishing/Social Engineering, Passwörter/MFA, sichere Datenhandhabung, **anomalous behavior recognition**, Clean-Desk, Reporting-Wege, Insider/Threat-Awareness.
- **Zielgruppen/rollenbasiert:** Allgemein vs. spezifisch (Admins, Entwickler, Management, privilegierte Nutzer).
- **Methoden:** Schulungen, **Phishing-Simulationen**, Micro-Learnings, Poster, Onboarding, regelmäßige Auffrischung.
- **Zyklus:** **continuous** (onboarding + periodisch + anlassbezogen), nicht einmalig.
- **Wirksamkeit messen:** Phishing-Klick-/Reportingrate, Quiz-/Abschlussquoten, Incident-Trends, Zeit bis Meldung. Awareness ist Pflicht in vielen Regulierungen/Frameworks (DSGVO, ISO, PCI).

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Programm-Plan (Tabelle) | Inhalte/Zielgruppen/Zyklus |
| Phishing-Sim (gophish, nur eigenes Lab) | Übung/Messung |
| Metriken | Wirksamkeit |

## Lab-Setup

- Konzeptionell; Phishing-Simulation nur gegen **eigene** Test-Accounts (Bezug `social-engineering`/`gophish`).

## Aufgabe (selbst lösen)

1. Entwirf ein **Awareness-Programm** (1 Jahr): Themen, Zielgruppen (rollenbasiert), Methoden, Zyklus.
2. Definiere **3 Wirksamkeits-Metriken** mit Zielwerten (z. B. Phishing-Klickrate < X %, Reportingrate > Y %).
3. Plane eine **Phishing-Simulation** (Ziel, Szenario, Messung, Nachbereitung) – ausschließlich fürs eigene Lab, ohne reale Dritte.
4. Begründe, warum Awareness **continuous** statt einmalig sein muss und wie du anomalous behavior schulst.

**Ziel:** ein durchdachtes, messbares Awareness-Programm + eine ethisch saubere Phishing-Simulationsplanung.

## SY0-701 Prüfungsbezug

- **5.0/2.0** security awareness training, phishing simulations, role-based training, anomalous behavior recognition, reporting; awareness as control; metrics.
- Begriffe: *security awareness*, *phishing campaign/simulation*, *role-based training*, *anomalous behavior*, *reporting culture*, *continuous training*.
