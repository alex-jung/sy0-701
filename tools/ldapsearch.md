# ldapsearch

**Kategorie:** Enumeration (LDAP) · **Teil von:** `ldap-utils`

Universelles LDAP-Abfragetool. Findet den Base DN (RootDSE), führt anonyme oder authentifizierte Binds durch und filtert Objekte/Attribute (User, Gruppen, Struktur). Auch für Active Directory nutzbar.

```bash
ldapsearch -x -H ldap://<ziel> -b <baseDN> ["<filter>"] [attribute…]
```

## Wichtigste Optionen

| Option | Bedeutung |
|--------|-----------|
| `-x` | simple authentication |
| `-H ldap://<ziel>` | LDAP-URI (`ldaps://` für TLS) |
| `-b <baseDN>` | Suchbasis (z. B. `dc=lab,dc=local`) |
| `-s base\|one\|sub` | Suchtiefe |
| `-D <bindDN>` `-w <pw>` | authentifizierter Bind |
| `-W` | Passwort interaktiv abfragen |
| `-ZZ` | StartTLS erzwingen |

## Base DN finden (RootDSE)

```bash
ldapsearch -x -H ldap://<ZIEL> -s base -b "" namingContexts
```

## Beispiele

```bash
# alles unter Base (anonym)
ldapsearch -x -H ldap://<ZIEL> -b "dc=lab,dc=local"
# nur Benutzer
ldapsearch -x -H ldap://<ZIEL> -b "dc=lab,dc=local" "(objectClass=inetOrgPerson)" cn uid
# AD mit Creds
ldapsearch -x -H ldap://<ZIEL> -D "user@domain" -w 'pw' -b "dc=domain,dc=com" "(objectClass=user)"
```

## Hinweis

Installation: `sudo apt install ldap-utils`. Für Self-signed TLS im Lab: `LDAPTLS_REQCERT=never`.

## Verwendet in

enumeration 07 (LDAP), 10.
