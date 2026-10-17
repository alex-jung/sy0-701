# smbclient

**Kategorie:** Enumeration (SMB) · **Teil von:** `smbclient`

FTP-ähnlicher Client für SMB/CIFS-Freigaben. Listet Shares, verbindet sich (auch anonym = Null Session) und lädt Dateien hoch/herunter.

```bash
smbclient -L //<ziel>/ [-N | -U user]        # Shares auflisten
smbclient //<ziel>/<share> [-N | -U user]    # auf Share zugreifen
```

## Wichtigste Optionen

| Option | Bedeutung |
|--------|-----------|
| `-L //<ziel>` | verfügbare Shares auflisten |
| `-N` | kein Passwort (anonym / Null Session) |
| `-U user%pass` | mit Credentials |
| `-c '<cmds>'` | Kommandos nicht-interaktiv ausführen |
| `--option='client min protocol=NT1'` | SMBv1 erlauben (alte Ziele) |

## Interaktive Kommandos

`ls` · `cd` · `get <datei>` · `put <datei>` · `mget *` · `exit`

## Beispiele

```bash
smbclient -L //<ZIEL>/ -N
smbclient //<ZIEL>/tmp -N -c 'ls; get secret.txt'
smbclient //<ZIEL>/share -U msfadmin%msfadmin
```

## Verwendet in

enumeration 02 (SMB Basics), 06, 10.
