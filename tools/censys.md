# censys (CLI)

**Kategorie:** OSINT / Attack Surface · **API-Credentials nötig**

Alternative zu Shodan: **Censys** scannt ebenfalls internetweit und indexiert Hosts, Dienste und TLS-Zertifikate. Oft stärker bei **Zertifikaten** und strukturierten Feldern. Abfrage ist passiv (Index-Suche).

```bash
censys <subcommand> [Optionen]
```

## Wichtigste Kommandos

| Kommando | Bedeutung |
|----------|-----------|
| `censys config` | API-ID/Secret hinterlegen |
| `censys search '<query>'` | Hosts suchen (Censys Query Language) |
| `censys view <ip>` | Detailprofil einer IP |
| `--index-type hosts/certs` | Hosts oder Zertifikate durchsuchen |
| `-f <felder>` | Ausgabefelder begrenzen |
| `-o <datei>` | Ausgabe speichern |

## Query-Beispiele

```bash
censys search 'services.service_name: RDP and location.country: Germany'
censys search 'services.port: 3306'
censys view 93.184.215.14
# Zertifikate:
censys search --index-type certs 'names: example.com'
```

## Hinweise

- Credentials aus dem Censys-Account (`censys config`).
- Passiv/ok; gelistete Fremd-IPs nicht selbst scannen.
- Installation: `pip install censys`.

## Verwendet in

reconnaissance 09 (Shodan & Censys).
