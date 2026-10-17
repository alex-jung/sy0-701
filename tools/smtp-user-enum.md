# smtp-user-enum

**Kategorie:** Enumeration (SMTP)

Automatisiert die Ermittlung gültiger Benutzerkonten an einem SMTP-Server über `VRFY`, `EXPN` oder `RCPT TO`.

```bash
smtp-user-enum -M <methode> -U <userliste> -t <ziel>
```

## Wichtigste Optionen

| Option | Bedeutung |
|--------|-----------|
| `-M <VRFY\|EXPN\|RCPT>` | Enumeration-Methode |
| `-U <datei>` | Liste der Benutzernamen |
| `-u <user>` | einzelner Benutzer |
| `-t <ziel>` | Ziel-Host (`-T <datei>` für mehrere) |
| `-p <port>` | Port (Default 25) |
| `-D <domain>` | Domain an Usernamen anhängen |

## Beispiele

```bash
smtp-user-enum -M VRFY -U /usr/share/seclists/Usernames/top-usernames-shortlist.txt -t <ZIEL>
smtp-user-enum -M RCPT -U users.txt -D example.com -t <ZIEL>
```

## Hinweis

`VRFY`/`EXPN` sind auf gehärteten Servern deaktiviert → `RCPT`-Methode probieren. Installation: `sudo apt install smtp-user-enum`.

## Verwendet in

enumeration 01 (SMTP User Enumeration), 10.
