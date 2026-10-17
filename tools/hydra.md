# hydra (THC-Hydra)

**Kategorie:** Online-Passwort-Brute-Force

Schneller Netzwerk-Login-Cracker für viele Protokolle (SSH, FTP, HTTP-Form, SMB, RDP, MySQL, …). Probiert User/Passwort-Kombinationen **online** gegen den Dienst (im Gegensatz zu offline-Hash-Cracking).

```bash
hydra [-l user|-L userliste] [-p pass|-P passliste] <ziel> <dienst> [modul-args]
```

## Wichtigste Optionen

| Option | Bedeutung |
|--------|-----------|
| `-l <user>` / `-L <datei>` | ein User / Userliste |
| `-p <pass>` / `-P <datei>` | ein Passwort / Passwortliste |
| `-t <n>` | parallele Tasks |
| `-f` | nach erstem Treffer stoppen |
| `-s <port>` | abweichender Port |
| `-V` / `-vV` | verbose (jeder Versuch) |
| `<dienst>` | `ssh`, `ftp`, `smb`, `rdp`, `mysql`, `http-get-form`, `http-post-form` … |

## HTTP-Form-Syntax

`"<pfad>:<body mit ^USER^/^PASS^>:<fail-string>[:H=Header]"`

## Beispiele

```bash
hydra -l admin -P rockyou.txt <ZIEL> ssh
hydra -L users.txt -P pass.txt <ZIEL> smb
hydra -l admin -P rockyou.txt <ZIEL> http-post-form \
  "/login:user=^USER^&pass=^PASS^:Invalid credentials:H=Cookie: PHPSESSID=..."
```

## Hinweis

Online-Brute-Force ist **laut** und löst Lockouts aus → nur eigene/freigegebene Ziele. Gegen Offline-Hashes stattdessen `hashcat`/`john` (Thema `password-attacks`). Vorinstalliert in Kali.

## Verwendet in

web-exploitation 09 (Login-Brute-Force); Bezug zu enumeration 05.
