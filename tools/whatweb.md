# whatweb

**Kategorie:** Web-Footprinting / Fingerprinting

Erkennt die hinter einer Website eingesetzten Technologien: Webserver + Version, CMS (WordPress/Joomla), Frameworks, JS-Libraries, Analytics, CDN/WAF, E-Mail-Adressen im Quelltext u. v. m.

```bash
whatweb [Optionen] <url|ziel>
```

## Wichtigste Optionen

| Option | Bedeutung |
|--------|-----------|
| `-a <0-4>` | Aggression: 1 passiv (nur Startseite) … 3/4 aktiver (mehr Requests) |
| `-v` | verbose (Details je Plugin) |
| `--log-verbose <datei>` | ausführliches Log |
| `--log-json <datei>` | JSON-Ausgabe |
| `-i <datei>` | Ziel-Liste aus Datei |
| `-U <ua>` | User-Agent setzen |

## Beispiele

```bash
whatweb http://192.168.56.100/dvwa/
whatweb -a 3 -v http://scanme.nmap.org
whatweb -i urls.txt --log-json out.json
```

## Hinweis

`-a 3/4` sendet mehr Requests (aktiver/lauter) → gegen Fremdziele nur mit Erlaubnis.

## Verwendet in

reconnaissance 03 (Web-Footprinting), 10 (OSINT-Report).
