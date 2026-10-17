# Übung 07 – Vishing & Smishing

**Schwierigkeit: 7/10 · Dauer: ca. 50 Min.**

## Lernziele

- Vishing (Voice) und Smishing (SMS) als SE-Kanäle verstehen
- Caller-ID-Spoofing und typische Telefon-/SMS-Pretexte einordnen
- Ein Vishing-Skript für eine **autorisierte** Awareness-Übung entwerfen
- Abwehr und Meldewege kennen

## Theorie

**Vishing** nutzt das **Telefon** (oft mit **Caller-ID-Spoofing**, damit eine vertraute Nummer erscheint) und den Live-Druck eines Gesprächs: „IT-Support", „Bank-Sicherheitsabteilung", „Chef in Eile". **Smishing** nutzt **SMS** mit Link/Rückrufnummer (Paket, Bank, MFA-Code-Abfrage). Beide umgehen E-Mail-Filter und wirken durch **Unmittelbarkeit**.

Gefährliche Muster: **MFA-Fatigue/OTP-Abgriff** („Lesen Sie mir den SMS-Code vor"), **Callback-Phishing** (SMS/Mail bittet um Rückruf an eine betrügerische Hotline).

**In diesem Kurs:** Übungen sind **Skript-/Analyse-basiert** und nur gegen **eigene, informierte** Teilnehmer in einem autorisierten Awareness-Programm – **keine** echten Dritten anrufen/texten.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| — / VoIP-Testumgebung | konzeptionell/autorisierte Awareness-Calls |
| Skript-Vorlage | strukturierter Gesprächsleitfaden |

## Lab-Setup

- Keine Angriffsinfrastruktur gegen Dritte. Für autorisierte Awareness-Tests: definierter Scope, informierte Teilnehmer, VoIP-Testumgebung.

## Aufgabe (selbst lösen)

1. Entwirf ein **Vishing-Skript** für einen autorisierten Awareness-Test (Pretext, Hebel, Eskalation, Ziel – z. B. „Verifizierung durch Rückruf an offizielle Nummer").
2. Schreibe eine **Smishing-Beispiel-SMS** und markiere die Indikatoren (Link, Dringlichkeit, Nummer).
3. Erkläre **Caller-ID-Spoofing** und warum eine „bekannte" Nummer kein Vertrauensbeweis ist.
4. Beschreibe ein **OTP-/MFA-Abgriff**-Szenario per Vishing – und warum FIDO2/Passkeys resistenter sind.
5. Leite Abwehr + Meldewege ab (Rückruf über offizielle Nummer, nie Codes weitergeben).

**Ziel:** ein durchdachtes Vishing-Skript + Smishing-Beispiel (für autorisierte Awareness) plus die zugehörige Abwehr.

## SY0-701 Prüfungsbezug

- **Vishing, Smishing**, **Caller-ID-Spoofing**, Callback-Phishing, **MFA-Fatigue/OTP-Phishing**.
- **Mitigation:** Verifikation über offizielle Kanäle, keine OTP-Weitergabe, **phishing-resistente MFA (FIDO2)**, Awareness.
- Begriffe: *vishing/smishing*, *caller ID spoofing*, *MFA fatigue*, *OTP phishing*, *FIDO2/passkeys*.
