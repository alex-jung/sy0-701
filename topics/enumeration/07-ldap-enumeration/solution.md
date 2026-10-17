# Lösung – Übung 07: LDAP Enumeration

`<ZIEL>` = IP der LDAP-VM. Base DN im Beispiel: `dc=lab,dc=local`.

## 0. (Setup) Test-Einträge per LDIF

`users.ldif`:
```ldif
dn: ou=people,dc=lab,dc=local
objectClass: organizationalUnit
ou: people

dn: uid=jdoe,ou=people,dc=lab,dc=local
objectClass: inetOrgPerson
cn: John Doe
sn: Doe
uid: jdoe
userPassword: Sommer2024!

dn: cn=admins,dc=lab,dc=local
objectClass: groupOfNames
cn: admins
member: uid=jdoe,ou=people,dc=lab,dc=local
```
```bash
ldapadd -x -D "cn=admin,dc=lab,dc=local" -W -f users.ldif
```

## 1. Base DN über RootDSE finden

```bash
ldapsearch -x -H ldap://<ZIEL> -s base -b "" namingContexts
```
```
namingContexts: dc=lab,dc=local
```
→ Base DN ermittelt, ohne ihn vorher zu kennen. NSE: `nmap -p389 --script ldap-rootdse <ZIEL>`.

## 2. Anonymer Bind: alles auflisten

```bash
ldapsearch -x -H ldap://<ZIEL> -b "dc=lab,dc=local"
```
`-x` = simple auth; ohne `-D/-w` = **anonymous**. Gibt alle lesbaren Objekte aus.

## 3. User & Gruppen gezielt

```bash
# Benutzer
ldapsearch -x -H ldap://<ZIEL> -b "dc=lab,dc=local" "(objectClass=inetOrgPerson)" cn uid sn
# Gruppen + Mitglieder
ldapsearch -x -H ldap://<ZIEL> -b "dc=lab,dc=local" "(objectClass=groupOfNames)" cn member
```

## 4. Sensible Attribute

```bash
ldapsearch -x -H ldap://<ZIEL> -b "dc=lab,dc=local" "(userPassword=*)" userPassword description
```
Bei schwacher Konfiguration ist `userPassword` lesbar (Klartext oder Hash) – kritischer Fund. Auch `description`-Felder enthalten real oft Passwörter/Hinweise.

## 5. Gefahr & Härtung

- **Anonymer Lesezugriff** legt die komplette Identitätsstruktur offen (User → Login-/Phishing-Ziele, Gruppen → Rechte, teils Credentials).
- Härtung:
  - **Anonymous Bind deaktivieren** (slapd: `olcDisallows: bind_anon`; AD: „anonymous" einschränken).
  - **ACLs:** `userPassword` nie lesbar machen; least-privilege-Lesezugriff.
  - **LDAPS/StartTLS** erzwingen → keine Klartext-Credentials auf dem Draht.

## Häufige Fehler / Troubleshooting

- **`ldapsearch` fehlt:** `sudo apt install ldap-utils`.
- **„Operations error"/leer bei AD:** Windows-AD erlaubt meist keinen anonymen Bind → mit Credentials: `-D "user@domain" -w '<pw>'` oder `ldapdomaindump`.
- **StartTLS-Fehler:** `-ZZ` erzwingt StartTLS; ohne Zertifikat `LDAPTLS_REQCERT=never` setzen (nur im Lab).
- **Falscher Base DN:** immer zuerst `namingContexts` abfragen.
