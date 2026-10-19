# Übung 09 – FIDO2/WebAuthn & Passwordless

**Schwierigkeit: 9/10 · Dauer: ca. 85 Min.**

## Lernziele

- FIDO2/WebAuthn verstehen (Challenge-Response, Origin-Binding)
- Passkeys/Passwordless einordnen und ausprobieren
- Begründen, warum FIDO2 phishing-resistent ist (vs. TOTP/OTP)

## Theorie

**FIDO2** (= **WebAuthn** Browser-API + **CTAP** für Authenticatoren) ist asymmetrische, challenge-response-basierte Authentifizierung:

- **Registration:** Der Authenticator (Hardware-Key/TPM/Phone) erzeugt ein **Schlüsselpaar pro Dienst (Origin)**; der **Public Key** geht an den Server, der **Private Key** verlässt das Gerät **nie**.
- **Authentication:** Server schickt eine **Challenge**; der Authenticator **signiert** sie (nach User-Gesture/Biometrie/PIN). Entscheidend: die Signatur ist an die **Origin (Domain)** gebunden.

Damit ist FIDO2 **phishing-resistent**: eine Fake-Domain erhält **keine** gültige Signatur (falsche Origin) – im Gegensatz zu TOTP/OTP, die man auf einer Phishing-Seite abgreifen kann. **Passkeys** sind FIDO2-Credentials, oft **synchronisiert** (Cloud) oder **device-bound**; sie ermöglichen **passwordless** (kein Passwort mehr) oder MFA. Weitere Begriffe: **attestation**, **resident key/discoverable credential**, **user verification**.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| WebAuthn-fähiger Browser | Registration/Login |
| Hardware-Key (YubiKey) oder Software-Authenticator | FIDO2-Authenticator |
| Demo-Site (z. B. webauthn.io) / Keycloak | WebAuthn ausprobieren |
| `libpam-u2f` | FIDO2 für Linux-Login (optional) |

## Lab-Setup

- Browser mit WebAuthn; ein FIDO2-Key **oder** ein virtueller Authenticator (Chrome DevTools → WebAuthn-Tab) oder Plattform-Authenticator. Optional `pam_u2f` am Linux-Host.

## Aufgabe (selbst lösen)

1. Registriere und nutze einen WebAuthn-Credential auf einer Demo-Seite (z. B. webauthn.io) **oder** in Keycloak – mit Hardware-Key oder virtuellem Authenticator (DevTools).
2. Beobachte im Flow (DevTools): Challenge, Origin/RP-ID, keine Passwortübertragung; beschreibe Registration vs. Authentication.
3. Erkläre konkret, warum ein AiTM-/Phishing-Proxy (Evilginx) bei FIDO2 **scheitert**, bei TOTP aber **nicht**.
4. (Optional) Richte `pam_u2f` für den Linux-Login ein und teste passwordless/2FA.

**Ziel:** eine funktionierende WebAuthn-Registrierung+Login + fundierte Begründung der Phishing-Resistenz (Origin-Binding).

## SY0-701 Prüfungsbezug

- **1.0** FIDO2/WebAuthn, passkeys, passwordless, phishing-resistant MFA; „something you have/are".
- **2.0** warum FIDO2 Real-time-Phishing/AiTM besiegt (Origin-Binding) – anders als OTP.
- Begriffe: *FIDO2/WebAuthn/CTAP*, *passkey*, *passwordless*, *phishing-resistant*, *attestation*, *resident key*, *origin binding*.
