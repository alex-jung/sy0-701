# Übung 06 – Account- & Authentifizierungs-Härtung

**Schwierigkeit: 6/10 · Dauer: ca. 60 Min.**

## Lernziele

- Benutzerkonten härten (Default/ungenutzte Konten, least privilege)
- Passwort-Policy und Account-Lockout durchsetzen (PAM)
- sudo-Rechte minimieren (schließt PrivEsc-Vektoren)
- MFA für Logins einführen

## Theorie

Konten/Auth sind das Ziel von Brute-Force, Spraying und PrivEsc. Härtung:

- **Konten aufräumen:** Default-/ungenutzte/Service-Konten entfernen oder sperren, keine gemeinsam genutzten Accounts, Login-Shells unnötiger Accounts auf `nologin`.
- **Passwort-Policy (PAM):** Mindestlänge/Komplexität bzw. besser **Länge/Passphrasen** + Abgleich gegen Leak-Listen (`pam_pwquality`), Ablauf/Historie maßvoll.
- **Account-Lockout:** nach X Fehlversuchen sperren (`pam_faillock`) → bremst Online-Brute-Force.
- **sudo minimieren:** keine `NOPASSWD: ALL`, keine shell-/escapefähigen Binaries pauschal (GTFOBins!), spezifische Befehle, `env_reset`.
- **MFA:** z. B. TOTP (`pam_google_authenticator`) für SSH/Login → gestohlenes Passwort allein nutzlos.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `useradd`/`usermod`/`chage` | Konten/Ablauf |
| PAM (`pam_pwquality`,`pam_faillock`) | Policy/Lockout |
| `visudo`/`sudo -l` | sudo-Rechte |
| `pam_google_authenticator` | TOTP-MFA |

## Lab-Setup

- Eine Linux-VM. **Snapshot** (PAM-Fehler können Login blockieren!).

## Aufgabe (selbst lösen)

1. Inventarisiere Konten (`/etc/passwd`): finde Default-/ungenutzte Konten und sperre/entferne sie bzw. setze `nologin`.
2. Setze eine **Passwort-Policy** (pwquality) und eine **Lockout-Policy** (faillock) und teste beide.
3. Auditiere `sudo -l`/`sudoers`: entferne gefährliche/zu weite Regeln (kein `NOPASSWD: ALL`, keine GTFOBins-Binaries).
4. Richte **TOTP-MFA** für SSH/Login ein und verifiziere den zweiten Faktor.
5. Belege, dass Brute-Force/Spraying (hydra) jetzt an Lockout/MFA scheitert.

**Ziel:** gehärtete Konten/Auth (bereinigt, Policy+Lockout, minimiertes sudo, MFA), gegen die Credential-Angriffe greifen.

## SY0-701 Prüfungsbezug

- **Account hardening**, **password policy**, **account lockout**, **least privilege (sudo)**, **MFA**.
- Gegenmaßnahmen zu Brute-Force/Spraying/PrivEsc; Default-Account-Entfernung.
- Begriffe: *password policy*, *account lockout (faillock)*, *least privilege*, *MFA/TOTP*, *default accounts*.
