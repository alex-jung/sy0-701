# Übung 07 – LDAP Enumeration

**Schwierigkeit: 7/10 · Dauer: ca. 60 Min. (inkl. Setup)**

## Lernziele

- LDAP, Directory-Struktur (DN, Base DN, Attribute) und Binds verstehen
- Einen **anonymen Bind** erkennen und ausnutzen
- Benutzer, Gruppen und Organisationsstruktur per `ldapsearch` extrahieren
- Den Bezug zu Active Directory (LDAP als AD-Protokoll) herstellen

## Theorie

**LDAP** (Lightweight Directory Access Protocol, Port **389**, LDAPS **636**) ist das Verzeichnis-Protokoll hinter AD, OpenLDAP u. a. Es speichert Objekte (User, Gruppen, Computer) in einem Baum, adressiert über **Distinguished Names (DN)**, z. B. `cn=admin,dc=lab,dc=local`.

Zum Abfragen „bindet" man sich:
- **Anonymous Bind:** ohne Credentials – ist er erlaubt, kann man oft die halbe Struktur lesen (Information Disclosure).
- **Authenticated Bind:** mit DN + Passwort.

Man braucht den **Base DN** (Wurzel, z. B. `dc=lab,dc=local`). Ihn findet man über den *RootDSE* (`namingContexts`). LDAP ist zentral für **Active-Directory-Enumeration** – dieselben Techniken greifen dort (Vollausbau im späteren AD-Thema).

## Verwendete Tools

| Tool | Zweck | Wichtige Optionen |
|------|-------|-------------------|
| `ldapsearch` | LDAP abfragen | `-x` (simple auth), `-H ldap://<ziel>`, `-b <baseDN>`, `-s base`, `-D/-w` (Bind-DN/PW) |
| `nmap` NSE | LDAP-Infos | `--script ldap-rootdse,ldap-search` |
| `ldapdomaindump` (opt.) | AD-Dump (bei AD) | `ldapdomaindump <ziel> -u ... -p ...` |

## Lab-Setup

Metasploitable hat **kein** LDAP → eigenes Ziel. Schnelle **OpenLDAP-VM** (Debian/Ubuntu):
```bash
sudo apt install slapd ldap-utils
sudo dpkg-reconfigure slapd          # Base DN z.B. dc=lab,dc=local setzen
```
Ein paar Test-Einträge (User/Gruppen) per LDIF hinzufügen (Beispiel in `solution.md`). Anonymous Read ist bei slapd je nach Version teils erlaubt – zum Üben bewusst aktivieren.

## Aufgabe (selbst lösen)

1. Finde über den **RootDSE** den **Base DN (namingContexts)** des Ziels – ohne ihn vorher zu kennen.
2. Führe einen **anonymen Bind** durch und liste alle Objekte unter dem Base DN auf.
3. Extrahiere gezielt **Benutzer** (`objectClass=person`/`inetOrgPerson`) und **Gruppen** mit ihren Mitgliedern.
4. Suche nach Attributen, die **Passwörter/Hashes** oder sensible Infos enthalten (`userPassword`, Beschreibung).
5. Erkläre, warum anonymer LDAP-Lesezugriff gefährlich ist und wie man ihn einschränkt.

**Ziel:** Base DN selbst ermittelt, per anonymem Bind User/Gruppen/Struktur ausgelesen.

## SY0-701 Prüfungsbezug

- **LDAP (389) / LDAPS (636)** als Directory-/AD-Protokoll; **anonymous bind** = Misconfiguration/Information Disclosure.
- **Directory Services / Active Directory** als zentrale Identitätsquelle (1.0/3.0).
- **LDAP over TLS (LDAPS/StartTLS)** gegen Klartext-Credentials.
- Begriffe: *LDAP/LDAPS*, *distinguished name (DN)*, *anonymous bind*, *directory service*, *Active Directory*, *information disclosure*.
