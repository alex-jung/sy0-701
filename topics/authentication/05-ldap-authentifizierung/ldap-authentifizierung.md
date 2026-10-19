# Übung 05 – LDAP-Authentifizierung

**Schwierigkeit: 5/10 · Dauer: ca. 75 Min.**

## Lernziele

- LDAP als zentralen Identitäts-/Verzeichnisdienst verstehen
- Gegen LDAP authentifizieren (Bind) und Einträge abfragen
- LDAP vs. LDAPS/StartTLS und die Simple-Bind-Gefahr einordnen

## Theorie

**LDAP (Lightweight Directory Access Protocol)** ist ein Verzeichnisdienst: eine hierarchische Baumstruktur (DIT) aus Einträgen mit **DN (Distinguished Name)**, z. B. `uid=alex,ou=people,dc=lab,dc=local`. Viele Systeme nutzen LDAP (OpenLDAP, Active Directory) als zentrale **Identitätsquelle** für Login.

**Authentifizierung = Bind:** Der Client bindet mit DN + Passwort. **Simple Bind über unverschlüsseltes LDAP (389)** sendet das Passwort **im Klartext** → immer **LDAPS (636)** oder **StartTLS** nutzen (knüpft an `pki-certificates`). Autorisierung erfolgt oft über **Gruppen**-Mitgliedschaften (`memberOf`). Ein typisches Login-Backend: PAM/SSSD/nss bindet gegen LDAP, um Nutzer zu authentisieren.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `slapd` (OpenLDAP) | LDAP-Server im Lab |
| `ldapsearch` | binden/abfragen |
| `ldapwhoami`/`ldapadd` | Bind-Test / Einträge anlegen |

## Lab-Setup

- Eine VM mit OpenLDAP (`slapd`, `ldap-utils`) oder ein Test-Container; Beispiel-Base `dc=lab,dc=local`.

## Aufgabe (selbst lösen)

1. Richte einen kleinen LDAP-Server (oder Container) mit einer Basis-OU und **mind. zwei** Benutzern ein.
2. Führe eine **anonyme** und eine **authentifizierte** Suche (`ldapsearch`) durch und vergleiche die sichtbaren Attribute.
3. Teste einen **Bind** mit korrektem und falschem Passwort (`ldapwhoami`) und finde das Ergebnis im Server-Log.
4. Zeige den Unterschied **LDAP vs. LDAPS/StartTLS** (z. B. per `tcpdump`: Passwort im Klartext bei Simple Bind ohne TLS) und begründe, warum TLS Pflicht ist.

**Ziel:** gegen LDAP authentifizieren/abfragen und den TLS-Zwang (Klartext-Bind) praktisch belegen.

## SY0-701 Prüfungsbezug

- **1.0/4.0** Directory services, LDAP(S), centralized authentication, groups/authorization.
- **2.0** Klartext-Credentials bei Simple Bind ohne TLS; LDAP injection (Grundidee).
- Begriffe: *LDAP/LDAPS*, *bind*, *DN/DIT*, *StartTLS*, *directory service*, *memberOf*.
