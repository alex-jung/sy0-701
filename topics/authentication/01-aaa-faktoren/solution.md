# Lösung – Übung 01: AAA & Faktoren

## 1. Zuordnung (Beispiele)

- **Know:** Passwort, PIN, Security-Question/Passphrase.
- **Have:** TOTP-App/Token, Smartcard, FIDO2-Key, SMS-OTP (schwach).
- **Are:** Fingerabdruck, Gesichts-/Iris-Scan, Stimme.

## 2. Echtes MFA?

| Kombination | MFA? | Begründung |
|-------------|------|-----------|
| Passwort + PIN | ❌ | beide „know" |
| Passwort + TOTP | ✅ | know + have |
| Fingerprint + Gesicht | ❌ | beide „are" |
| Smartcard + PIN | ✅ | have + know |
| Passwort + Security-Question | ❌ | beide „know" |

## 3. Login-Ablauf (SSH-Beispiel)

- **Identification:** Nutzer gibt Username `alex` an.
- **Authentication:** beweist Identität (Passwort **und** TOTP, oder SSH-Key).
- **Authorization:** Server prüft, welche Rechte `alex` hat (sudo? welche Verzeichnisse?).
- **Accounting:** Login-Zeit, Quelle, Befehle werden geloggt (auth.log/SIEM).

## 4. Biometrie

- **Vorteil:** bequem, nicht „vergessbar", schwer weiterzugeben.
- **Nachteil:** nicht änderbar bei Kompromittierung (man kann keinen neuen Fingerabdruck „ausstellen"); FAR/FRR-Fehlerraten; Spoofing; Datenschutz.

## Hinweise / Troubleshooting

- SMS-OTP ist „have", aber durch SIM-Swap/SS7 schwach → TOTP/FIDO2 bevorzugen.
- „Step-up Authentication": zusätzlicher Faktor nur bei riskanten Aktionen.
- FAR (False Accept Rate) vs. FRR (False Reject Rate): Trade-off über den Schwellenwert; CER = Crossover Error Rate.
