# Lösung – Übung 07: Vishing & Smishing

> Nur autorisierte Awareness-Tests gegen eigene, informierte Teilnehmer. Keine echten Dritten.

## 1. Vishing-Skript (autorisierte Awareness)

```
Ziel:    Prüfen, ob Mitarbeiter sensible Infos am Telefon preisgeben
Pretext: "Hier IT-Service-Desk, wir sehen ungewöhnliche Anmeldungen an Ihrem Konto"
Hebel:   Authority (IT) + Urgency (Konto gefährdet)
Verlauf: Begrüßung -> Problem schildern -> "zur Verifizierung bitte ..."
         -> ZIEL: fordert z.B. Passwort/OTP (= Awareness-Fehler, wird NICHT real erfasst)
Exit:    Aufklärung am Ende: "Dies war ein Awareness-Test."
```
Erfolg misst man an „hätte der Mitarbeiter Daten/OTP herausgegeben", nicht an echten Credentials.

## 2. Smishing-Beispiel-SMS

```
"DHL: Ihr Paket konnte nicht zugestellt werden. Zollgebühr 2,99€:
 http://dhl-paket-verify.top/pay  - innerhalb 24h, sonst Rücksendung"
```
Indikatoren: **Lookalike-Domain**, **Urgency**, kleine Zahlung (senkt Hemmschwelle), unerwartet.

## 3. Caller-ID-Spoofing

Die angezeigte Rufnummer ist **trivial fälschbar** (VoIP) → eine „bekannte"/offizielle Nummer ist **kein** Echtheitsbeweis. Vertrauen darf nicht an der Anzeige hängen → **Rückruf an die offiziell bekannte Nummer**.

## 4. OTP-/MFA-Abgriff & FIDO2

Szenario: Angreifer löst einen Login aus, ruft an „zur Verifizierung lesen Sie mir den SMS-Code vor" → mit dem OTP übernimmt er die Session. **SMS/TOTP-OTP sind phishbar** (Mensch gibt sie weiter / Real-time-Proxy). **FIDO2/Passkeys** sind an die **echte Origin** gebunden und nicht „vorlesbar" → phishing-resistent.

## 5. Abwehr & Meldewege

- **Nie** Passwörter/OTP am Telefon/per SMS weitergeben; IT fragt das nie.
- **Rückruf über offizielle Nummer**, Identität über zweiten Kanal verifizieren.
- **Phishing-resistente MFA (FIDO2)**, Callback-Nummern blockieren/melden, Awareness + klarer Meldeweg.

## Häufige Fehler / Troubleshooting

- **Echte Dritte angerufen/getextet:** verboten – nur autorisierte, informierte Teilnehmer.
- **OTP = sicher?** Nein, phishbar → FIDO2 bevorzugen.
- **Nummer vertraut:** Spoofing ignoriert – immer Rückruf über offizielle Quelle.
