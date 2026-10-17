# feroxbuster

**Kategorie:** Web-Enumeration (rekursiv)

Schneller Content-Scanner in Rust mit **automatischer Rekursion**: gefundene Verzeichnisse werden selbstständig weiter durchsucht. Gut, um tief verschachtelte Strukturen in einem Lauf zu erfassen.

```bash
feroxbuster -u <url> -w <wortliste> [Optionen]
```

## Wichtigste Optionen

| Option | Bedeutung |
|--------|-----------|
| `-u <url>` | Ziel-URL |
| `-w <datei>` | Wortliste |
| `-x php,txt,bak` | Datei-Extensions |
| `-d <n>` | maximale Rekursionstiefe |
| `-t <n>` | Threads |
| `-s <codes>` | nur diese Statuscodes |
| `-C <codes>` | Statuscodes ausblenden (filter) |
| `-k` | TLS nicht prüfen · `-o <datei>` Output |
| `--dont-scan <regex>` | Pfade von Rekursion ausnehmen |

## Beispiele

```bash
feroxbuster -u http://<ZIEL>/ -w /usr/share/seclists/Discovery/Web-Content/raft-medium-directories.txt -x php,txt -d 2
feroxbuster -u http://<ZIEL>/ -w <liste> -s 200,301,403 -t 40
```

## Hinweis

Rekursion kann viele Requests erzeugen → Tiefe/Threads begrenzen, nur autorisierte Ziele. Installation: `sudo apt install feroxbuster`.

## Verwendet in

enumeration 09 (Web Content Enumeration).
