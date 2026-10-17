# curl

**Kategorie:** HTTP-/Netzwerk-Client

Universeller Client für HTTP(S) und viele weitere Protokolle. In der Recon genutzt, um **HTTP-Header**, `robots.txt`, Fehlerseiten und APIs (z. B. crt.sh) abzurufen.

```bash
curl [Optionen] <url>
```

## Wichtigste Optionen

| Option | Bedeutung |
|--------|-----------|
| `-I` | nur Response-Header (HEAD) |
| `-s` / `-sS` | silent / silent aber Fehler zeigen |
| `-L` | Redirects folgen |
| `-k` | TLS-Zertifikat nicht prüfen (Lab/Self-signed) |
| `-A <ua>` | User-Agent setzen |
| `-H '<header>'` | eigenen Request-Header senden |
| `-o <datei>` / `-O` | in Datei / unter Originalnamen speichern |
| `-X <METHODE>` | HTTP-Methode (GET/POST/…) |
| `-d <daten>` | Body für POST |

## Beispiele

```bash
curl -sSI http://192.168.56.100            # Header
curl -sS http://192.168.56.100/robots.txt
curl -sSIL https://example.com             # Header + Redirects folgen
curl -sS "https://crt.sh/?q=%25.example.com&output=json" | jq -r '.[].name_value'
```

## Verwendet in

reconnaissance 03 (Header/robots), 05 (crt.sh), 10 (Workflow).
