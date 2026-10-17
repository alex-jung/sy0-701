# wafw00f

**Kategorie:** Web-Footprinting / WAF-Erkennung

Erkennt, ob und welche **Web Application Firewall (WAF)** vor einer Website steht (Cloudflare, AWS WAF, ModSecurity, Akamai …). Sendet harmlose und bewusst „verdächtige" Requests und wertet die Reaktionen/Fingerprints aus.

```bash
wafw00f [Optionen] <url>
```

## Wichtigste Optionen

| Option | Bedeutung |
|--------|-----------|
| `-a` | alle WAFs testen (nicht nach erstem Treffer stoppen) |
| `-v` / `-vv` | verbose |
| `-l` | alle erkennbaren WAFs auflisten |
| `-i <datei>` | Ziel-Liste aus Datei |
| `-o <datei>` | Ausgabe speichern · `-f json/csv` Format |
| `-p <proxy>` | über Proxy |

## Beispiele

```bash
wafw00f http://192.168.56.100
wafw00f -a -v https://example.com
wafw00f -l                       # unterstützte WAFs anzeigen
```

## Hinweis

Sendet aktive Requests ans Ziel → nur gegen eigene/freigegebene Systeme.

## Verwendet in

reconnaissance 03 (Web-Footprinting).
