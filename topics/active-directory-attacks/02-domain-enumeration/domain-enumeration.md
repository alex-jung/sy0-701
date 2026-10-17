# Übung 02 – Domain Enumeration

**Schwierigkeit: 2/10 · Dauer: ca. 55 Min.**

## Lernziele

- Die Domäne mit und ohne Credentials enumerieren
- User, Gruppen, Computer, Passwort-Policy und Shares erfassen
- LDAP/SMB/RPC als Enum-Quellen nutzen
- Interessante Ziele (Admins, SPNs, kein Preauth) identifizieren

## Theorie

Domain Enumeration sammelt die „Landkarte" des AD: **User/Gruppen** (wer ist Domain Admin?), **Computer**, **Passwort-/Lockout-Policy** (steuert Spraying, Übung 04), **Shares/GPO**, **SPNs** (Kerberoasting), **Accounts ohne Preauth** (AS-REP). Quellen: **LDAP** (389), **SMB** (445), **RPC**, **Kerberos** (88).

Mit gültigen (auch Low-Priv-) Credentials bekommt man sehr viel; teils geht Enum auch anonym/über Null-Session. **netexec** und **ldapdomaindump** sind die Arbeitspferde; **Impacket** liefert spezialisierte Tools.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `netexec` (nxc) | SMB/LDAP-Enum: `--users`, `--groups`, `--pass-pol`, `--shares` |
| `ldapdomaindump` | kompletter LDAP-Dump (HTML/JSON) |
| `ldapsearch` | gezielte LDAP-Queries |
| Impacket (`GetADUsers.py`, `lookupsid.py`) | User/SID-Enum |

## Lab-Setup

- Test-AD (Übung 01). Ein Low-Priv-Domänen-Account (`mmuster`). DC-IP.

## Aufgabe (selbst lösen)

1. Enumeriere mit **netexec** über SMB: **Passwort-Policy**, **User**, **Gruppen**, **Shares**.
2. Mache einen **kompletten LDAP-Dump** (ldapdomaindump) und sieh dir User/Gruppen/Computer an.
3. Finde die **Domain Admins** und andere privilegierte Gruppen.
4. Identifiziere Accounts mit **SPN** und solche **ohne Preauth** (Ziele für Übung 05/06).
5. Erstelle eine priorisierte Zielliste für die folgenden Angriffe.

**Ziel:** eine vollständige Domänen-Übersicht (User/Gruppen/Policy/Computer) mit markierten Angriffszielen.

## SY0-701 Prüfungsbezug

- **AD-Enumeration**; LDAP/SMB als Quellen; **Passwort-Policy** als Angriffsfaktor.
- **Attack surface** der Domäne; privilegierte Gruppen.
- Begriffe: *domain enumeration*, *LDAP*, *password policy*, *privileged groups*, *SPN*, *pre-authentication*.
