# nuclei

**Kategorie:** Web-/Infra-Scanner (template-basiert) · **Projekt:** ProjectDiscovery

Schneller, **template-basierter** Schwachstellenscanner. Prüft Ziele gegen eine große Community-DB aus YAML-Templates (CVEs, Misconfigurations, Exposures, Default-Logins, Takeovers). Sehr aktuell, ideal für Masse + gezielte Checks über beliebige HTTP-Ziele.

```bash
nuclei -u <url> [Optionen]        # oder: -l <url-liste>
```

## Wichtigste Optionen

| Option | Bedeutung |
|--------|-----------|
| `-u <url>` / `-l <datei>` | Einzelziel / Zielliste |
| `-t <pfad>` | bestimmte Templates (`http/cves/`) |
| `-tags <tags>` | nach Tags filtern (`cve`, `exposure`, `misconfig`) |
| `-severity <stufen>` | `low,medium,high,critical` |
| `-update-templates` | Template-DB aktualisieren |
| `-stats` | Fortschritt/Statistik |
| `-o <datei>` | Output · `-j` JSON |
| `-rl <n>` / `-c <n>` | Rate-Limit / Concurrency |

## Beispiele

```bash
nuclei -update-templates
nuclei -u http://<ZIEL>/ -severity high,critical
nuclei -u http://<ZIEL>/ -tags cve,exposure
nuclei -l targets.txt -t http/cves/ -o nuclei.txt
```

## Hinweis

Aktiv → nur autorisierte Ziele. Template-Aktualität entscheidet über Abdeckung (regelmäßig updaten). Installation: `sudo apt install nuclei` oder via ProjectDiscovery.

## Verwendet in

vulnerability-scanning 08 (Web-App-Scanning), 10.
