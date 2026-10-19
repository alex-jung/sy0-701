# Übung 03 – MFA mit TOTP/HOTP

**Schwierigkeit: 3/10 · Dauer: ca. 60 Min.**

## Lernziele

- TOTP und HOTP verstehen und selbst erzeugen
- MFA (TOTP) für den SSH-/Konsolen-Login einrichten
- Grenzen von OTP-MFA (Phishing, MFA Fatigue) einordnen

## Theorie

**OTP (One-Time Password)** als „something you have":
- **HOTP (RFC 4226):** HMAC-basiert, **Zähler**-getrieben – jedes OTP gilt bis zur Nutzung.
- **TOTP (RFC 6238):** HOTP mit **Zeit** als Zähler (meist 30-s-Fenster) – das klassische „Authenticator-App"-Verfahren. Server und App teilen ein **gemeinsames Secret** (Base32, oft per QR/`otpauth://`-URI).

TOTP ist deutlich besser als SMS-OTP (kein SIM-Swap/SS7), aber **nicht phishing-resistent**: ein Fake-Login-Portal kann OTP in Echtzeit abgreifen und weiterreichen (real-time phishing). Dagegen hilft **FIDO2/WebAuthn** (Übung 09). Weitere Risiken: **MFA Fatigue/Push-Bombing** (bei Push-Apps), Secret-Diebstahl.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `oathtool` | HOTP/TOTP-Codes auf der CLI erzeugen |
| `libpam-google-authenticator` | TOTP-MFA für PAM/SSH |
| Authenticator-App | TOTP auf dem „have"-Gerät |

## Lab-Setup

- Linux-Host mit `oathtool`, `libpam-google-authenticator`; SSH-Dienst zum Testen.

## Aufgabe (selbst lösen)

1. Erzeuge mit `oathtool` einen **HOTP**- und einen **TOTP**-Code aus einem Base32-Secret und erkläre den Unterschied.
2. Richte mit `google-authenticator` + PAM **TOTP-MFA** für den lokalen/SSH-Login ein (Passwort **und** TOTP).
3. Teste den Login mit korrektem und mit falschem/abgelaufenem Code; prüfe das Log.
4. Beschreibe, wie ein **Real-time-Phishing**-Angriff TOTP umgeht und warum FIDO2 das verhindert.

**Ziel:** funktionierende TOTP-MFA am Login + Verständnis von OTP-Mechanik und -Grenzen.

## SY0-701 Prüfungsbezug

- **1.0** MFA, TOTP/HOTP, OTP tokens, authenticator apps; „have"-Faktor.
- **2.0** Angriffe: real-time phishing, MFA fatigue/push bombing, SIM-swap (SMS-OTP).
- Begriffe: *TOTP/HOTP*, *OTP*, *shared secret*, *authenticator app*, *MFA fatigue*, *phishing-resistant MFA*.
