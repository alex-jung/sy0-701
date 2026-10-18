# Übung 04 – SSH-Hardening

**Schwierigkeit: 4/10 · Dauer: ca. 55 Min.**

## Lernziele

- SSH als häufigstes Remote-Einfallstor absichern
- Key-basierte Authentifizierung erzwingen (Passwörter/root-Login aus)
- Zugriff einschränken (Allowlist, Rate-Limit, starke Crypto)
- Brute-Force-Schutz (fail2ban) einrichten

## Theorie

SSH (22) ist ein Top-Ziel für Brute-Force/Password-Spraying (`password-attacks`, `active-directory-attacks`). Härtung schließt genau diese Vektoren:

- **Key-only Auth:** `PasswordAuthentication no` + Public-Key → Brute-Force läuft ins Leere.
- **Kein root-Login:** `PermitRootLogin no` → Angreifer muss erst einen User kompromittieren, kann nicht direkt root.
- **Zugriff einschränken:** `AllowUsers`/`AllowGroups` (Allowlist), ggf. nur aus dem Management-Netz (Firewall).
- **Starke Crypto:** moderne KEX/Cipher/MAC, Protokoll 2.
- **Weitere:** `MaxAuthTries` niedrig, `LoginGraceTime` kurz, Idle-Timeout, 2FA (`AuthenticationMethods`), Banner.
- **fail2ban:** sperrt IPs nach X Fehlversuchen → bremst Online-Brute-Force zusätzlich.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `/etc/ssh/sshd_config` | SSH-Server-Härtung |
| `ssh-keygen` | Key-Paar |
| `fail2ban` | Brute-Force-Lockout |
| `ssh-audit` | SSH-Konfig/Crypto auditieren |

## Lab-Setup

- Eine Linux-VM mit SSH + ein Client. **Snapshot** (Fehlkonfig kann aussperren!). Zugang über Konsole als Notfall.

## Aufgabe (selbst lösen)

1. Richte **Key-Auth** ein (Key erzeugen, verteilen, Login testen) **bevor** du Passwort-Auth abschaltest.
2. Härte `sshd_config`: `PermitRootLogin no`, `PasswordAuthentication no`, `MaxAuthTries`, `AllowUsers`, Idle-Timeout.
3. Beschränke SSH per **Firewall** auf das Management-Netz.
4. Installiere **fail2ban** und verifiziere, dass wiederholte Fehlversuche die IP sperren.
5. Prüfe mit **ssh-audit** die Crypto/Konfig und vergleiche mit einem Brute-Force-Versuch (hydra) vorher/nachher.

**Ziel:** ein gehärteter SSH-Dienst (key-only, kein root, eingeschränkt, fail2ban), gegen den Brute-Force wirkungslos ist.

## SY0-701 Prüfungsbezug

- **Secure protocols / SSH-Hardening**, Key- statt Passwort-Auth, **MFA**, Zugriffsbeschränkung.
- **fail2ban / account lockout** gegen Brute-Force; starke Crypto.
- Begriffe: *SSH hardening*, *public key auth*, *PermitRootLogin*, *fail2ban*, *MFA*, *allowlist*.
