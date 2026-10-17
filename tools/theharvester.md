# theHarvester

**Kategorie:** OSINT-Aggregation

Sammelt für eine Domain **E-Mail-Adressen, Subdomains, Hostnamen, IPs** (und teils Namen) aus vielen OSINT-Quellen in einem Durchlauf. Grundlage für Footprinting und Phishing-Namensschema-Analyse.

```bash
theHarvester -d <domain> -b <quelle(n)> [Optionen]
```

## Wichtigste Optionen

| Option | Bedeutung |
|--------|-----------|
| `-d <domain>` | Zieldomain |
| `-b <quelle>` | Datenquelle(n): `bing,duckduckgo,crtsh,certspotter,hackertarget,anubis,all` … |
| `-l <n>` | Limit der Ergebnisse |
| `-f <basis>` | Report speichern (HTML + JSON) |
| `-s` | Shodan-Integration (API-Key nötig) |
| `-n` | DNS-Reverse-Lookup der Hosts |
| `-c` | DNS-Brute-Force (aktiv) |

## Beispiele

```bash
theHarvester -d example.com -b bing,duckduckgo,crtsh -l 500
theHarvester -d example.com -b crtsh -f report      # report.html/.json
```

## Hinweise

- Viele Quellen brauchen **API-Keys** (`/etc/theHarvester/api-keys.yaml`); keyless: `bing`, `duckduckgo`, `crtsh`, `certspotter`, `hackertarget`.
- Gesammelte Mails sind personenbezogen (DSGVO) → nur autorisiert nutzen.
- Installation: `sudo apt install theharvester`.

## Verwendet in

reconnaissance 07 (OSINT-Aggregation), 10 (OSINT-Report).
