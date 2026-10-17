# shodan (CLI)

**Kategorie:** OSINT / Attack Surface · **API-Key nötig**

Kommandozeilen-Client für **Shodan** – die Suchmaschine für internetweit exponierte Geräte/Dienste. Die Abfrage ist passiv (du durchsuchst Shodans Index, nicht das Ziel). Zeigt offene Ports, Banner, Produkte, TLS-Zertifikate und bekannte CVEs.

```bash
shodan <command> [Optionen]
```

## Wichtigste Kommandos

| Kommando | Bedeutung |
|----------|-----------|
| `shodan init <key>` | API-Key hinterlegen (einmalig) |
| `shodan host <ip>` | Steckbrief einer IP (Ports, Banner, CVEs) |
| `shodan search <query>` | Suche; mit `--fields ip_str,port,org` |
| `shodan count <query>` | nur Trefferzahl |
| `shodan stats --facets <facet> <query>` | aggregierte Statistik (Länder, Orgs …) |
| `shodan scan submit <ip>` | aktiven Scan anstoßen (nur eigene Assets!) |
| `shodan myip` | eigene öffentliche IP |

## Such-Filter (query)

`hostname:` · `net:` · `org:` · `port:` · `product:` · `country:` · `city:` · `ssl.cert.subject.cn:` · `vuln:CVE-…` (Member)

## Beispiele

```bash
shodan init <API_KEY>
shodan host 93.184.215.14
shodan search --fields ip_str,port,org 'hostname:example.com'
shodan count port:3389 country:DE
shodan stats --facets country 'product:MySQL port:3306'
```

## Hinweise

- Abfragen passiv/ok; gelistete Fremd-IPs **nicht** selbst scannen. `scan submit` nur für eigene Assets.
- Installation: `pip install shodan` (ggf. `pipx`).

## Verwendet in

reconnaissance 09 (Shodan & Censys), 10 (OSINT-Report).
