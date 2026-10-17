# subfinder

**Kategorie:** Subdomain-Enumeration (passiv) · **Projekt:** ProjectDiscovery

Schneller, rein **passiver** Subdomain-Finder. Aggregiert viele OSINT-Quellen (Certificate Transparency, Suchmaschinen, Threat-Intel-APIs), ohne das Ziel selbst zu kontaktieren.

```bash
subfinder -d <domain> [Optionen]
```

## Wichtigste Optionen

| Option | Bedeutung |
|--------|-----------|
| `-d <domain>` | Zieldomain (`-dL <datei>` für mehrere) |
| `-all` | alle Quellen nutzen (auch langsamere) |
| `-silent` | nur Ergebnisse (gut fürs Pipen) |
| `-o <datei>` | Ausgabe speichern |
| `-oJ` | JSON-Ausgabe |
| `-recursive` | rekursiv weitersuchen |
| `-config` / provider-keys | API-Keys für mehr Quellen |

## Beispiele

```bash
subfinder -d example.com -all -silent | sort -u
subfinder -d example.com -o subs.txt
subfinder -dL domains.txt -silent
```

## Hinweis

Passiv → unkritisch; die Treffer anschließend verifizieren (`dig`/`httpx`). Installation: Kali-Paket oder `go install` von ProjectDiscovery.

## Verwendet in

reconnaissance 05 (Subdomain-Enum), 10 (OSINT-Report/Workflow).
