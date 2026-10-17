# sqlmap

**Kategorie:** SQL-Injection (automatisiert)

Automatisiert Erkennung und Ausnutzung von SQL Injection über viele DBMS und alle SQLi-Typen (UNION, error-, boolean-/time-based blind, stacked). Kann DB/Tabellen/Spalten dumpen, Hashes cracken, teils OS-Shell/Dateizugriff.

```bash
sqlmap -u "<url>" [Optionen]        # oder: sqlmap -r <request-datei>
```

## Wichtigste Optionen

| Option | Bedeutung |
|--------|-----------|
| `-u <url>` | Ziel-URL (mit Parameter) |
| `-r <datei>` | gespeicherten HTTP-Request nutzen (z. B. aus Burp) |
| `--cookie=` / `--data=` | Session-Cookie / POST-Body |
| `-p <param>` | gezielt diesen Parameter testen |
| `--dbs` / `-D <db> --tables` / `-T <t> --columns` | enumerieren |
| `--dump` | Daten extrahieren (`-C col1,col2`) |
| `--batch` | nicht nachfragen (Defaults) |
| `--level <1-5>` / `--risk <1-3>` | Testtiefe / Aggressivität |
| `--technique` | nur bestimmte SQLi-Typen (z. B. `U`) |
| `--tamper <script>` | Payloads verschleiern (WAF-Bypass) |
| `--os-shell` / `--sql-shell` | interaktive Shell (wenn möglich) |

## Beispiele

```bash
sqlmap -r request.txt -p id --batch --dbs
sqlmap -r request.txt -p id --batch -D dvwa -T users --dump
sqlmap -u "http://<ZIEL>/page?id=1" --cookie="PHPSESSID=..." --batch --dump
```

## Hinweis

Laut/intrusiv, kann Daten verändern (hoher `--risk`) → nur eigene Ziele. Funde mit manuellem Wissen (Thema 04) gegenprüfen. Vorinstalliert in Kali.

## Verwendet in

web-exploitation 05 (sqlmap), 10.
