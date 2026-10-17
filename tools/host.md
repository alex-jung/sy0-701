# host

**Kategorie:** DNS / Recon · **Teil von:** `dnsutils`/`bind9-dnsutils`

Kompaktes DNS-Abfragetool für schnelle, einzeilige Antworten. Weniger Optionen als `dig`, dafür knappe Ausgabe – gut für Forward- und Reverse-Lookups.

```bash
host [Optionen] <name|ip> [server]
```

## Wichtigste Optionen

| Option | Bedeutung |
|--------|-----------|
| `-t <typ>` | Record-Typ (`-t MX`, `-t NS`, `-t TXT`) |
| `-a` | „all" – viele Record-Typen auf einmal |
| `host <ip>` | automatischer Reverse-Lookup (PTR) |
| `-v` | verbose |
| `host name <server>` | bestimmten Name-Server fragen |

## Beispiele

```bash
host example.com
host -t MX example.com
host 93.184.215.14               # Reverse
host -a example.com
host www.example.com 8.8.8.8
```

## Verwendet in

reconnaissance 02 (DNS-Records).
