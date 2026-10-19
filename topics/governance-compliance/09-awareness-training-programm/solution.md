# Lösung – Übung 09: Awareness-Programm

## 1. Programm (1 Jahr, Beispiel)

| Quartal | Thema | Zielgruppe | Methode |
|---------|-------|-----------|---------|
| Onboarding | Grundlagen, AUP, Reporting-Weg | alle (neu) | Kurs + Quiz |
| Q1 | Phishing/Social Engineering | alle | Micro-Learning + Phishing-Sim |
| Q2 | Passwörter/MFA, Datenhandhabung | alle | Kurs; Admins vertieft |
| Q3 | Sichere Entwicklung / privilegierte Rollen | Entwickler/Admins | rollenbasiert |
| Q4 | Insider/anomalous behavior, Incident-Reporting | alle + Management | Kurs + Tabletop |

## 2. Metriken + Zielwerte

- Phishing-**Klickrate** < 5 % (sinkend über Zeit).
- **Reporting-Rate** gemeldeter Phishings > 70 %.
- Schulungs-Abschlussquote > 95 %; Zeit bis Meldung sinkend.

## 3. Phishing-Simulation (Planung, nur Lab)

- **Ziel:** eigene Test-Accounts/Lab-Nutzer (keine realen Dritten).
- **Szenario:** generische „Passwort läuft ab"-Mail auf eine Lab-Landingpage (gophish, `social-engineering`).
- **Messung:** Öffnen/Klick/„Eingabe" + Reporting.
- **Nachbereitung:** sofortige, **nicht beschämende** Aufklärung + kurzes Lernmodul; aggregierte Auswertung.

## 4. Continuous + anomalous behavior

- **Continuous:** Bedrohungen/Tricks ändern sich; einmalige Schulung verpufft (Vergessenskurve). Regelmäßig + anlassbezogen (neue Masche) hält Verhalten aktuell.
- **Anomalous behavior schulen:** Beispiele erkennbarer Auffälligkeiten (ungewöhnliche Login-Zeiten, unerwartete MFA-Prompts/„MFA-Fatigue", seltsame Dateizugriffe) + klarer, **niederschwelliger Reporting-Weg** („lieber einmal zu viel melden").

## Hinweise / Troubleshooting

- Phishing-Sims nur mit **Autorisierung** und ohne Bloßstellen – Ziel ist Lernen, nicht Bestrafen.
- Reporting-Kultur fördern: eine hohe Meldequote ist wertvoller als eine niedrige Klickrate allein.
- Awareness ist **messbar** – ohne Metriken kein Nachweis der Wirksamkeit (Control-Validierung, `security-controls`).
