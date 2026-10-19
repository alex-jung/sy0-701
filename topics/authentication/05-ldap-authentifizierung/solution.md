# Lösung – Übung 05: LDAP-Authentifizierung

## 1. LDAP-Server (schnell via Container)

```bash
docker run -d --name ldap -p 389:389 -p 636:636 \
  -e LDAP_ORGANISATION="Lab" -e LDAP_DOMAIN="lab.local" \
  -e LDAP_ADMIN_PASSWORD="admin" osixia/openldap:stable
# Basis: dc=lab,dc=local ; Admin: cn=admin,dc=lab,dc=local
# Nutzer via ldapadd (LDIF) anlegen (uid=alex,ou=people,...)
```

## 2. Anonym vs. authentifiziert

```bash
ldapsearch -x -H ldap://localhost -b "dc=lab,dc=local" "(uid=alex)"      # anonym (evtl. wenig/nichts)
ldapsearch -x -H ldap://localhost -D "cn=admin,dc=lab,dc=local" -w admin \
  -b "dc=lab,dc=local" "(uid=alex)"                                      # authentifiziert (mehr Attribute)
```

## 3. Bind-Test

```bash
ldapwhoami -x -H ldap://localhost -D "uid=alex,ou=people,dc=lab,dc=local" -w richtig   # dn:uid=alex,...
ldapwhoami -x -H ldap://localhost -D "uid=alex,ou=people,dc=lab,dc=local" -w falsch    # Invalid credentials (49)
```

## 4. LDAP vs LDAPS/StartTLS

```bash
sudo tcpdump -i lo -A port 389 &        # unverschlüsselt -> Passwort im Klartext sichtbar
ldapwhoami -x -D "uid=alex,..." -w geheim -H ldap://localhost
# mit TLS -> nichts Lesbares:
ldapwhoami -x -ZZ -H ldap://localhost   # StartTLS, oder:
ldapsearch -x -H ldaps://localhost:636 -D ... -w ... -b "dc=lab,dc=local"
```
Ohne TLS ist Simple Bind ein Klartext-Passwort auf der Leitung → **LDAPS/StartTLS Pflicht** (Zertifikat aus eigener CA, `pki-certificates`).

## Hinweise / Troubleshooting

- Selbstsigniertes LDAPS-Zert → Client mit `TLS_CACERT`/`-o` auf CA zeigen (sonst Trust-Fehler).
- „Invalid credentials (49)" = falsches Passwort/DN; „No such object (32)" = falscher Base/DN.
- Für Login-Integration: SSSD/`pam_ldap` + `nss` statt direktem Bind.
