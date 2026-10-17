# ffuf

**Kategorie:** Web-Fuzzing

„Fuzz Faster U Fool" – sehr schneller, flexibler Web-Fuzzer. Ersetzt den Platzhalter **`FUZZ`** in URL, Header oder Body durch Wortlisten-Einträge – für Directory-/File-Brute-Force, VHosts, Parameter und Werte. Starke Filter-/Match-Funktionen.

```bash
ffuf -u <url-mit-FUZZ> -w <wortliste> [Optionen]
```

## Wichtigste Optionen

| Option | Bedeutung |
|--------|-----------|
| `-u <url>` | Ziel-URL mit `FUZZ` |
| `-w <datei>` | Wortliste (`-w list:KEY` für benannte) |
| `-H '<header>'` | Header (z. B. `Host: FUZZ` für VHosts) |
| `-X` / `-d` | Methode / POST-Body |
| `-mc <codes>` | nur diese Statuscodes (match) |
| `-fc <codes>` | diese Statuscodes ausblenden (filter) |
| `-fs <größe>` | Responses dieser Größe ausblenden |
| `-fw`/`-fl` | nach Wort-/Zeilenzahl filtern |
| `-recursion` | gefundene Verzeichnisse weiter fuzzen |

## Beispiele

```bash
ffuf -u http://<ZIEL>/FUZZ -w <liste> -mc 200,301,302,401,403
ffuf -u http://<ZIEL>/FUZZ -w <liste> -fc 404 -fs 1234
ffuf -u http://<ZIEL>/ -H "Host: FUZZ.example.com" -w subs.txt -fs <größe>
ffuf -u 'http://<ZIEL>/page?FUZZ=1' -w params.txt   # Parameter-Fuzzing
```

## Hinweis

Laut → nur autorisierte Ziele. Installation: `sudo apt install ffuf`.

## Verwendet in

enumeration 09 (Web Content Enumeration).
