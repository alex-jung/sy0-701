# Lösung – Übung 02: Domain Enumeration

`<DC>` = DC-IP, Creds `lab.local\mmuster:Passwort`.

## 1. netexec (SMB)

```bash
netexec smb <DC> -u mmuster -p 'Passwort' --pass-pol
netexec smb <DC> -u mmuster -p 'Passwort' --users
netexec smb <DC> -u mmuster -p 'Passwort' --groups
netexec smb <DC> -u mmuster -p 'Passwort' --shares
# LDAP-Signing/Infos:
netexec ldap <DC> -u mmuster -p 'Passwort' --users
```

## 2. LDAP-Dump

```bash
ldapdomaindump -u 'lab.local\mmuster' -p 'Passwort' <DC> -o ad_dump
# erzeugt HTML/JSON: domain_users, domain_groups, domain_computers, ...
firefox ad_dump/domain_users.html
```

## 3. Domain Admins

```bash
netexec ldap <DC> -u mmuster -p 'Passwort' --query "(memberOf=CN=Domain Admins,CN=Users,DC=lab,DC=local)" ""
# oder in ldapdomaindump: domain_groups.html -> "Domain Admins" -> Mitglieder
```

## 4. SPNs & kein Preauth

```bash
# Accounts mit SPN (Kerberoasting-Ziele):
netexec ldap <DC> -u mmuster -p 'Passwort' --query "(servicePrincipalName=*)" "sAMAccountName servicePrincipalName"
# Accounts ohne Preauth (AS-REP):
netexec ldap <DC> -u mmuster -p 'Passwort' --query "(userAccountControl:1.2.840.113556.1.4.803:=4194304)" "sAMAccountName"
```
(Impacket: `GetADUsers.py`, `GetUserSPNs.py -request` in Übung 06.)

## 5. Zielliste

```
[AS-REP]       mmuster (kein Preauth)       -> Übung 05
[Kerberoast]   svc_sql (SPN MSSQLSvc)       -> Übung 06
[Ziel]         Domain Admins: <Mitglieder>  -> finale Eskalation
[Policy]       Lockout 5/30min -> Spraying vorsichtig (Übung 04)
```

## Härtung

- LDAP-Signing/Channel Binding, anonyme/Null-Session-Enum unterbinden, least privilege bei Gruppen, SPNs minimieren, Monitoring von Massen-LDAP-Queries.

## Häufige Fehler / Troubleshooting

- **LDAP-Query-Syntax:** netexec `--query "<ldap-filter>" "<attribute>"`.
- **Kein Zugriff:** Account/Passwort falsch, Domänenname (`lab.local\user` oder `user@lab.local`).
- **ldapdomaindump leer:** Credentials/DC-Erreichbarkeit prüfen; `-o` Ausgabeordner.
- **Kerberos-Clock-Skew:** Zeit zwischen Kali und DC synchron halten (`ntpdate`/`timedatectl`).
