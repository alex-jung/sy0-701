# Lösung – Übung 10: Zentrale Auth (Capstone)

Muster-Lösungspfad; viele Varianten korrekt. Entscheidend: zentrale Auth + erzwungene MFA + ein demonstrierter Angriff/Abwehr + Report.

## 1. Zentrale Auth (Keycloak + OIDC)
- Keycloak-Realm `lab`, OIDC-Client `demo` (Authorization Code + PKCE), optional **User Federation** gegen OpenLDAP (Übung 05).

## 2. MFA erzwingen
- Keycloak: Authentication → Required Actions „Configure OTP"/„WebAuthn Register"; Browser-Flow mit OTP/WebAuthn als conditional/required.
- Nachweis: Login verlangt Passwort **und** TOTP/Passkey; Event-Log zeigt `LOGIN` mit `otp`/`webauthn`.

## 3. Starke Verfahren
- SSH-Host: `PasswordAuthentication no`, Pubkey/Cert-Auth (Übung 04). Konzeptuell an zentrale Identität koppeln (gleiche Principals/SSSD).

## 4. Angriff & Abwehr (Beispiele)
- **Credential Stuffing:** `hydra -L users -P rockyou.txt` gegen einen eigenen Test-Login → ohne MFA/Lockout erfolgreich; **mit** MFA + Account-Lockout/Rate-Limit scheitert es (Faktor „have" fehlt dem Angreifer).
- **Real-time Phishing (AiTM):** TOTP abgreifbar → **FIDO2/WebAuthn** verhindert es (Origin-Binding, Übung 09).
- **Kerberoasting** (falls AD): SPN-Ticket cracken → Abwehr: lange/zufällige Service-Passwörter/gMSA, AES, Monitoring (Übung 07).

## 5. Report
`auth-assessment-template.md`: Architektur-Diagramm (IdP/Directory/App/SSH), Faktor-/MFA-Abdeckung pro System, Findings (z. B. „Dienst X ohne MFA"), Angriffe+Abwehr, Empfehlungen (phishing-resistant MFA überall, Deprovisioning-Prozess, Monitoring), IAM-Reifegrad.

## Bewertungs-Checkliste
- [ ] Zentraler IdP + App per OIDC/SAML angebunden
- [ ] MFA (TOTP und/oder WebAuthn) **erzwungen**, Login nachgewiesen
- [ ] Mind. ein starkes Verfahren (SSH-Key/Cert) ohne Passwort
- [ ] Ein Auth-Angriff demonstriert + wirksame Abwehr gezeigt
- [ ] Assessment-Template vollständig (inkl. Reifegrad)

## Häufige Fehler / Troubleshooting
- MFA „optional" gelassen → kein echter Schutz; Flow auf required stellen.
- TOTP als „phishing-resistent" verkauft → ist es nicht; FIDO2 nennen.
- Angriffe gegen fremde/echte Accounts → verboten; nur eigene Lab-Testkonten.
- Deprovisioning vergessen (verwaiste Accounts) = häufige reale Schwäche.
