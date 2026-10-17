# Thema: Social Engineering

Praxis-Übungen zu **Social Engineering** aus der Perspektive von **autorisiertem Security-Awareness-Testing und Verteidigung**. Schwerpunkt: die Mechanik von Phishing & Co. verstehen, um Menschen und Organisationen dagegen zu schützen – Erkennung, simulierte Kampagnen, Abwehr.

> ⚠️ **Strenge ethische Grenzen – unbedingt lesen.**
> - **Keine realen Dritten** als Ziel. Simulierte Phishing-/Vishing-Übungen **nur** gegen **eigene Test-Accounts / eigene Lab-Nutzer / ausdrücklich beauftragte und informierte** Teilnehmer (mit Management-Freigabe und definiertem Scope – wie bei einem echten Awareness-Programm).
> - **Keine Impersonation realer Personen/Marken** gegenüber Dritten, kein tatsächliches Abgreifen fremder Credentials.
> - Ziel ist **Erkennung & Abwehr**, nicht das Täuschen echter Opfer. Credential-Harvesting/Payload-Teile laufen gegen **eigene Test-Ziele** im Lab.
> - Tools wie SET/GoPhish sind für **legitime, autorisierte** Awareness-Programme gedacht – so werden sie hier genutzt.

## Lernziele

- Social-Engineering-Prinzipien (Psychologie) verstehen und wiedererkennen
- Phishing-Mails technisch analysieren (Header, SPF/DKIM/DMARC)
- Eine **autorisierte** Phishing-Simulation (GoPhish) planen und auswerten
- Vishing/Smishing/physische SE und ihre Abwehr einordnen
- Ein Awareness-Programm + technische Gegenmaßnahmen entwerfen

## Abgedeckte SY0-701-Domänen

- **2.0 Threats, Vulnerabilities & Mitigations** – Social Engineering (Phishing, Spear/Whaling, Vishing, Smishing, Pretexting, Tailgating, Baiting), Mitigations
- **5.0 Program Management** – Security-Awareness-Training, Policies
- **4.0 Security Operations** – E-Mail-Security, Reporting/Detection

## Übungen (Schwierigkeit 1 → 10)

| #  | Übung | Schwierigkeit |
|----|-------|---------------|
| 01 | SE-Grundlagen & Psychologie | 1/10 |
| 02 | OSINT & Pretext-Building | 2/10 |
| 03 | Phishing-Mail erkennen & analysieren (Header/SPF/DKIM/DMARC) | 3/10 |
| 04 | Phishing-Simulation mit GoPhish (Awareness) | 4/10 |
| 05 | Credential Harvesting mit SET (Lab) | 5/10 |
| 06 | Malicious Attachments & Payload-Delivery | 6/10 |
| 07 | Vishing & Smishing | 7/10 |
| 08 | Physical Social Engineering | 8/10 |
| 09 | Pretexting & vollständiges Szenario | 9/10 |
| 10 | Awareness-Programm & Abwehr + Report | 10/10 |

## Lab-Voraussetzungen

- **Kali Linux** – `setoolkit` (SET), `swaks` (Mail-Test), optional **GoPhish** (Phishing-Simulations-Server)
- **Eigene Test-Mailumgebung** – eigene Domain/Mailserver **oder** lokale Test-Postfächer; **nur eigene Test-Empfänger**
- **theHarvester** (aus `reconnaissance`) für OSINT/Pretext
- Für Credential-Harvesting (Übung 05): eigene Test-Login-Seite + eigene Test-Accounts (kein reales Portal/keine echten Zugangsdaten)

Reihenfolge: starte bei `01-se-basics/`. Pro Übung erst die `.md` lösen, dann `solution.md`.
