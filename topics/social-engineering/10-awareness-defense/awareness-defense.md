# Übung 10 – Awareness-Programm & Abwehr + Report

**Schwierigkeit: 10/10 · Dauer: ca. 2 Std.**

## Lernziele

- Alle SE-Erkenntnisse zu einem Verteidigungskonzept bündeln
- Ein Security-Awareness-Programm entwerfen (Training, Simulation, Metriken)
- Technische + organisatorische Gegenmaßnahmen über alle SE-Kanäle zusammenführen
- Einen Report/Programmplan erstellen (die defensive Capstone)

## Theorie

Social Engineering adressiert man mit **Defense in Depth über Mensch, Prozess und Technik**:

- **Mensch:** kontinuierliches **Security-Awareness-Training**, **Phishing-Simulationen** (Übung 04), einfacher **Melde-Button**, positive Melde-Kultur, rollenbasierte Schulung (Buchhaltung ↔ BEC).
- **Prozess:** Verifikation über zweiten Kanal, **Vier-Augen/Dual Control** bei Zahlungen/Bankdaten, klare Meldewege, Incident-Response-Einbindung.
- **Technik:** **SPF/DKIM/DMARC** (Übung 03), Mail-Security-Gateway (Sandboxing/Link-Rewriting), **phishing-resistente MFA (FIDO2)**, USB-Device-Control, physische Kontrollen (Übung 08), EDR.

Wirksamkeit misst man über **Metriken** (Klick-/Melderate über Zeit) – nicht als einmaliges Häkchen.

Die beiliegende `awareness-report-template.md` ist das Gerüst.

## Verwendete Tools

Erkenntnisse aus Übung 01–09; GoPhish (Metriken), DMARC-Checks + `awareness-report-template.md`.

## Lab-Setup

- Ergebnisse der vorherigen Übungen (Simulationsmetriken, Phishing-Analyse, Szenario). Eigene/fiktive Org als Bezug.

## Aufgabe (selbst lösen)

Entwirf ein SE-Abwehr-/Awareness-Programm für deine (eigene/fiktive) Organisation.

1. **Ist-Analyse:** nutze die Erkenntnisse aus Übung 01–09 (welche Kanäle/Schwächen).
2. **Technische Maßnahmen:** liste sie je SE-Kanal (Mail/Vishing/Smishing/physisch/Anhang) auf.
3. **Prozess-Maßnahmen:** Verifikations-/Freigabe-/Meldeprozesse (v. a. gegen BEC).
4. **Awareness-Plan:** Trainingsinhalte, Simulationsrhythmus, Zielgruppen, **Metriken/KPIs**.
5. **Report:** fülle `awareness-report-template.md` – priorisierte Maßnahmen + Messgrößen.

**Ziel:** ein vollständiges, priorisiertes SE-Abwehr- und Awareness-Programm (Mensch/Prozess/Technik) mit Erfolgsmetriken.

## SY0-701 Prüfungsbezug

- **Security awareness training / program** (5.0), **phishing campaigns/metrics**.
- **Mitigations gebündelt:** DMARC/MFA(FIDO2)/Gateway, Dual Control, Melde-Kultur, physische Kontrollen.
- **Defense in depth** über Mensch/Prozess/Technik.
- Begriffe: *security awareness training*, *phishing simulation/KPIs*, *SPF/DKIM/DMARC*, *phishing-resistant MFA*, *dual control*, *defense in depth*.
