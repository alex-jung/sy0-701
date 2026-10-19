# Thema: Authentication

Praxis-Übungen zu **Authentifizierung & Identität**: AAA, Authentifizierungs-Faktoren/MFA, sichere Passwort-Policies, TOTP/HOTP, SSH-Key-/Cert-Auth, LDAP, RADIUS/802.1X, Kerberos, SSO (SAML/OAuth2/OIDC) und FIDO2/WebAuthn/Passwordless. Aufbau auf `cryptography-basics` (Hashing/KDF, Signaturen) und `pki-certificates` (Zertifikate), Querbezug zu `active-directory-attacks` (Kerberos-Angriffe) und `password-attacks`.

> ⚠️ **Nur im eigenen, isolierten Lab.** Angriffsteile (z. B. Kerberos-/Hash-Angriffe) ausschließlich gegen **eigene** Test-Accounts/Dienste. Keine echten Firmen-Identitäten/-Tokens verwenden; Secrets/Keys nie committen (`.gitignore`).

## Lernziele

- AAA und die drei Faktor-Arten (something you know/have/are) sauber unterscheiden
- MFA praktisch umsetzen (TOTP/HOTP, FIDO2) und ihre Phishing-Resistenz bewerten
- Zentrale Authentifizierung aufbauen (LDAP, RADIUS/802.1X, Kerberos)
- Federation/SSO (SAML, OAuth2, OIDC) verstehen und abgrenzen
- Passwortlose/zertifikatsbasierte Verfahren einordnen und Angriffe/Abwehr kennen

## Abgedeckte SY0-701-Domänen

- **1.0 General Security Concepts** – AAA, authentication/authorization, MFA factors, password concepts
- **4.0 Security Operations** – IAM, provisioning, access control, federation, SSO
- **2.0 Threats, Vulnerabilities & Mitigations** – Angriffe auf Auth (phishing, replay, Kerberos, MFA fatigue)

## Übungen (Schwierigkeit 1 → 10)

| #  | Übung | Schwierigkeit |
|----|-------|---------------|
| 01 | AAA & Authentifizierungs-Faktoren | 1/10 |
| 02 | Passwort-Policies & sichere Speicherung | 2/10 |
| 03 | MFA mit TOTP/HOTP | 3/10 |
| 04 | SSH Key-based & Certificate-based Auth | 4/10 |
| 05 | LDAP-Authentifizierung | 5/10 |
| 06 | RADIUS & 802.1X | 6/10 |
| 07 | Kerberos (KDC, TGT, Tickets) | 7/10 |
| 08 | SSO: SAML / OAuth2 / OIDC | 8/10 |
| 09 | FIDO2/WebAuthn & Passwordless | 9/10 |
| 10 | Capstone: zentrale Auth mit MFA + Angriffe/Abwehr | 10/10 |

## Lab-Voraussetzungen

- Kali/Linux; `openssl`, `ssh`/`ssh-keygen`, `oathtool`, `libpam-google-authenticator`
- Für zentrale Auth: OpenLDAP (`slapd`/`ldapsearch`), FreeRADIUS, MIT Kerberos (`krb5-kdc`/`kinit`)
- Für SSO/FIDO2: ein Test-IdP (z. B. Keycloak-Container) und ein WebAuthn-fähiger Browser/Authenticator (oder Software-Authenticator)
- Optional Windows/AD-VM (aus `active-directory-attacks`) für Kerberos-Querbezug

Reihenfolge: starte bei `01-aaa-faktoren/`. Pro Übung erst die `.md` lösen, dann `solution.md`.
