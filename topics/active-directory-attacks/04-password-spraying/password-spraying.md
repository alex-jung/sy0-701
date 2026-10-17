# Übung 04 – Password Spraying & User-Enum (kerbrute)

**Schwierigkeit: 4/10 · Dauer: ca. 50 Min.**

## Lernziele

- Gültige Domänen-User über Kerberos enumerieren (ohne Lockout-Gefahr)
- Password Spraying gegen AD durchführen (lockout-bewusst)
- Die Passwort-/Lockout-Policy als Angriffsfaktor berücksichtigen
- Detection (Event-IDs) und Härtung kennen

## Theorie

Ohne gültige Credentials ist der Einstieg oft **User-Enumeration + Password Spraying**:
- **kerbrute userenum:** prüft über Kerberos (AS-REQ) **ohne** Fehllogins zu erzeugen, welche Usernamen existieren (der DC antwortet unterschiedlich für existente/nicht-existente User). Leise.
- **Password Spraying:** **ein** häufiges Passwort gegen **viele** User, mit Pausen → bleibt unter der **Lockout-Schwelle** (anders als Brute-Force gegen einen User). Beliebt: `Saison+Jahr!`, `Firmenname1`, `Welcome1`.

Kritisch ist die **Lockout-Policy** (Übung 02): bei z. B. 5/30 min spraye höchstens 4 Versuche pro Fenster. Detection: viele **4625** (failed logon) / **4768/4771** (Kerberos preauth failed).

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `kerbrute` | User-Enum + Spraying über Kerberos |
| `netexec` | Spraying über SMB (`--continue-on-success`) |

## Lab-Setup

- Test-AD. Userliste (aus Enum/OSINT). Lockout-Policy bekannt. Snapshots.

## Aufgabe (selbst lösen)

1. Enumeriere mit **kerbrute userenum** gültige Domänen-User aus einer Namensliste – ohne Logins zu „verbrennen".
2. Lies die **Lockout-Policy** und bestimme ein sicheres Spraying-Fenster.
3. Führe ein **Password Spraying** (kerbrute passwordspray oder netexec) mit einem plausiblen Passwort durch.
4. Prüfe gefundene Credentials gegen SMB/LDAP.
5. Beschreibe die **Event-IDs**, an denen ein Verteidiger das Spraying erkennt, + Härtung.

**Ziel:** gültige User leise enumeriert und über Spraying mindestens einen Account kompromittiert – lockout-bewusst.

## SY0-701 Prüfungsbezug

- **Password spraying** vs. brute force; **account lockout** als Gegenmaßnahme.
- **User enumeration** über Kerberos; **MFA** entwertet Spraying.
- **Detection:** Event-IDs 4625/4768/4771; SIEM-Alerts.
- Begriffe: *password spraying*, *account lockout*, *user enumeration*, *MFA*, *Kerberos preauth*.
