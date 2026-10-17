# whois

**Kategorie:** OSINT / Passive Recon

Fragt öffentliche Registrierungsdaten ab – für **Domains** (Registrar, Name-Server, Daten, Kontakte) und **IP-Bereiche** (zuständige Organisation/RIR, Netzblock). Rein passiv: du liest öffentliche Register, nicht das Ziel.

```bash
whois [Optionen] <domain|ip>
```

## Wichtigste Optionen

| Option | Bedeutung |
|--------|-----------|
| `whois <domain>` | Domain-WHOIS |
| `whois <ip>` | IP-WHOIS (RIR-Daten, Netzblock) |
| `-h <server>` | bestimmten WHOIS-Server abfragen (z. B. `whois.ripe.net`) |
| `-H` | rechtliche Disclaimer ausblenden |

## Beispiele

```bash
whois example.com
whois 93.184.215.14
whois -h whois.ripe.net 93.184.215.14
```

## Hinweise

- DSGVO/GDPR: persönliche Kontakte oft „REDACTED FOR PRIVACY".
- TLD-spezifische Server; `whois` folgt Referrals meist automatisch.
- Nicht installiert: `sudo apt install whois`.

## Verwendet in

reconnaissance 01 (WHOIS), 10 (OSINT-Report).
