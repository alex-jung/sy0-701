# dnsenum

**Kategorie:** DNS-Enumeration · **Benötigt root:** nein (manche Features ja)

All-in-one-DNS-Recon: Standard-Records, Name-Server, MX, versucht **Zonentransfer (AXFR)**, macht optional Subdomain-**Brute-Force** und Reverse-Lookups über Netzblöcke.

```bash
dnsenum [Optionen] <domain>
```

## Wichtigste Optionen

| Option | Bedeutung |
|--------|-----------|
| `--dnsserver <ip>` | bestimmten DNS-Server verwenden |
| `-f <wortliste>` | Subdomain-Brute-Force mit Wortliste |
| `--enum` | Shortcut für gängige Enum-Optionen |
| `-r` | rekursiv weiter enumerieren |
| `-p <n>` / `-s <n>` | Seiten/Scraping-Limits (Suchmaschinen) |
| `-o <datei>` | XML-Ausgabe |
| `--threads <n>` | Parallelität |

## Beispiele

```bash
dnsenum --dnsserver 192.168.56.60 lab.local          # inkl. AXFR-Versuch
dnsenum -f subdomains.txt --dnsserver 8.8.8.8 example.com
```

## Hinweis

AXFR-/Brute-Force-Teile sind **aktiv** → nur gegen eigene/freigegebene Ziele.

## Verwendet in

reconnaissance 04 (Zonentransfer), 05 (Subdomain-Enum).
