# rpcclient

**Kategorie:** Enumeration (MSRPC/Samba) · **Teil von:** `smbclient`-Paket

Client für MSRPC-Schnittstellen. Erlaubt (oft per Null Session) detaillierte Abfragen zu Server, Benutzern, Gruppen, RIDs und Passwort-Policy – ideal, um SMB-Enumeration manuell nachzuvollziehen.

```bash
rpcclient -U "" -N <ziel>          # Null Session
rpcclient -U user%pass <ziel>      # mit Credentials
```

## Wichtige interaktive Kommandos

| Kommando | Bedeutung |
|----------|-----------|
| `srvinfo` | Server-/OS-Info |
| `enumdomusers` | Domänen-/lokale Benutzer |
| `enumdomgroups` | Gruppen |
| `queryuser <rid>` | Details zu einem User (per RID) |
| `querygroupmem <rid>` | Gruppenmitglieder |
| `getdompwinfo` | Passwort-Policy |
| `lookupnames <name>` | Name → SID/RID |
| `lookupsids <sid>` | SID → Name (RID-Cycling) |
| `querydominfo` | Domäne/Workgroup |

## Beispiele

```bash
rpcclient -U "" -N <ZIEL> -c 'enumdomusers'
rpcclient -U "" -N <ZIEL> -c 'getdompwinfo'
for r in 500 501 1000 1001; do rpcclient -U "" -N <ZIEL> -c "queryuser $r"; done
```

## Verwendet in

enumeration 05 (NetBIOS/RPC), 06 (SMB Deep).
