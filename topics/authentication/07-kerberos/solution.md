# Lösung – Übung 07: Kerberos

## 1. Realm + Principals

```bash
sudo apt install -y krb5-kdc krb5-admin-server krb5-user   # Realm: LAB.LOCAL
sudo krb5_newrealm
sudo kadmin.local -q "addprinc alex"
sudo kadmin.local -q "addprinc -randkey HTTP/web.lab.local"
sudo kadmin.local -q "ktadd -k /etc/web.keytab HTTP/web.lab.local"
```

## 2. TGT holen

```bash
kinit alex           # Passwort -> TGT
klist
# Default principal: alex@LAB.LOCAL
# krbtgt/LAB.LOCAL@LAB.LOCAL   (das TGT)  valid starting / expires / flags: FORWARDABLE ...
```

## 3. Ticketfluss

- `kinit` = **AS-REQ/REP** → TGT (`krbtgt/LAB.LOCAL`).
- Zugriff auf Dienst → **TGS-REQ/REP**: mit dem TGT ein **Service-Ticket** für `HTTP/web.lab.local` anfordern (erscheint nach Nutzung in `klist`).
- **AP-REQ:** Service-Ticket beim Dienst vorlegen; dieser entschlüsselt mit seinem Keytab-Key → Zugriff.

## 4. Angriffe & Abwehr

- **AS-REP Roasting:** Konten mit „don't require pre-auth" liefern einen mit dem User-Passwort-Hash verschlüsselten AS-REP-Teil → offline crackbar. Abwehr: **Pre-Auth erzwingen**, starke Passwörter.
- **Kerberoasting:** jeder authentisierte Nutzer kann Service-Tickets (für SPNs) anfordern; der Ticket-Teil ist mit dem **Service-Account-Passwort** verschlüsselt → offline cracken. Abwehr: **lange/zufällige Service-Passwörter** bzw. **gMSA**, **AES** statt RC4, Monitoring ungewöhnlicher TGS-Requests.
- (Golden Ticket: wer den `krbtgt`-Hash hat, fälscht beliebige TGTs → `krbtgt` doppelt rotieren bei Verdacht.)

## Hinweise / Troubleshooting

- **„Clock skew too great":** Zeit nicht synchron → NTP (Kerberos toleriert nur wenige Minuten).
- `kdestroy` leert den Ticket-Cache; `klist -e` zeigt Verschlüsselungstypen (RC4 = schwach).
- Reverse-DNS/FQDN müssen stimmen, sonst „Server not found in Kerberos database".
