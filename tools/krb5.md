# Kerberos (MIT krb5)

**Kategorie:** Authentifizierung (ticketbasiertes SSO)

MIT-Kerberos-Implementierung: **KDC** (`krb5-kdc`) + Admin-Server (`krb5-admin-server`) und Client-Tools (`krb5-user`). Basis von Active-Directory-Auth; erteilt **TGT**/Service-Tickets, sodass sich Nutzer einmal authentisieren und ohne erneute Passworteingabe auf Dienste zugreifen.

## Wichtige Tools

| Tool | Zweck |
|------|-------|
| `kinit` | TGT holen (authentisieren) |
| `klist [-e]` | Tickets/Verschlüsselungstypen anzeigen |
| `kdestroy` | Ticket-Cache leeren |
| `kadmin.local` | Principals/Keytabs verwalten (`addprinc`, `ktadd`) |
| `krb5_newrealm` | Realm initialisieren |
| `/etc/krb5.conf` | Realm-/KDC-Konfiguration |

## Hinweise

Zeit muss synchron sein (NTP) – sonst „clock skew too great". FQDN/Reverse-DNS korrekt halten. RC4-Tickets = schwach → AES erzwingen. Angriffe (nur eigenes Lab): AS-REP/Kerberoasting, Pass-the-Ticket, Golden Ticket (`krbtgt`) → siehe `active-directory-attacks`.

## Verwendet in

authentication 07 (Kerberos), 10; Querbezug active-directory-attacks.
