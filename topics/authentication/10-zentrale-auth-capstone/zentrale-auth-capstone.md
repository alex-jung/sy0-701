# Übung 10 – Capstone: zentrale Auth mit MFA + Angriffe/Abwehr

**Schwierigkeit: 10/10 · Dauer: ca. 3–4 Std.**

## Lernziele

- Eine zentrale Identitäts-/Auth-Lösung mit MFA end-to-end aufbauen
- Realistische Angriffe gegen Auth durchspielen und abwehren
- Ein Identity-/Auth-Assessment schreiben

## Theorie

Dieses Capstone verbindet alles: eine **zentrale Identitätsquelle** (LDAP/IdP), **MFA** (TOTP und/oder FIDO2), **SSO** (OIDC/SAML) und **starke Verfahren** (Cert-/Key-Auth, Kerberos-Bezug), kombiniert mit einer **Angriffs-/Abwehr-Betrachtung** (Phishing, Credential Stuffing, MFA Fatigue, Kerberoasting). Du baust eine kleine, aber kohärente IAM-Umgebung, demonstrierst mindestens einen Auth-Angriff und die wirksame Gegenmaßnahme und dokumentierst das Ganze mit `auth-assessment-template.md`.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Keycloak / OpenLDAP | zentraler IdP / Directory |
| `oathtool`/pam / FIDO2 | MFA |
| FreeRADIUS (optional) | Netzwerk-AAA/802.1X |
| hydra / evilginx-Konzept / hashcat | Angriffsdemonstration (nur Lab) |

## Lab-Setup

- Keycloak (IdP) + eine Demo-App (OIDC); optional OpenLDAP als User-Federation, FreeRADIUS, ein Linux-Host mit SSH-MFA. Alles im isolierten Lab.

## Aufgabe (selbst lösen)

1. **Zentrale Auth:** Betreibe einen IdP (Keycloak), binde eine App per **OIDC** an und (optional) OpenLDAP als User-Quelle.
2. **MFA erzwingen:** aktiviere **TOTP** und/oder **WebAuthn** als zweiten Faktor für die Nutzer; weise erfolgreiche MFA-Logins nach.
3. **Starke Verfahren:** richte zusätzlich **SSH-Key-/Cert-Auth** (ohne Passwort) auf einem Host ein und binde ihn konzeptionell an die zentrale Identität.
4. **Angriff & Abwehr:** demonstriere mindestens **einen** Angriff im Lab – z. B. Credential Stuffing (hydra gegen einen eigenen Test-Login), MFA-Fatigue-Szenario, oder Kerberoasting (aus `active-directory-attacks`) – und zeige die **wirksame Gegenmaßnahme** (MFA/Lockout/FIDO2/starke Service-Passwörter, Monitoring).
5. **Report:** fülle `auth-assessment-template.md` aus (Architektur, Faktoren/MFA-Abdeckung, Findings, Angriffe/Abwehr, Empfehlungen, Reifegrad).

**Ziel:** eine funktionierende zentrale Auth mit erzwungener MFA, ein demonstrierter Angriff + wirksame Abwehr, und ein strukturiertes Assessment.

## SY0-701 Prüfungsbezug

- **1.0/2.0/4.0** kombiniert: AAA, MFA, federation/SSO, directory/RADIUS/Kerberos, IAM-Lifecycle; Auth-Angriffe und -Abwehr.
- Prüfungsnah: richtiges Verfahren je Szenario wählen, Phishing-Resistenz begründen, Schwächen erkennen.
- Begriffe: *IAM*, *MFA*, *SSO/federation*, *phishing-resistant*, *credential stuffing*, *MFA fatigue*, *least privilege*, *provisioning/deprovisioning*.
