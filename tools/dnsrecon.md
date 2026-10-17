# dnsrecon

**Kategorie:** DNS-Enumeration

Vielseitiges DNS-Recon-Tool: Standard-Enum, **Zonentransfer**, Subdomain-**Brute-Force**, Reverse-Lookups, Cache-Snooping, Google-/SRV-Enum. Flexibler bei den Enum-Typen als `dnsenum`.

```bash
dnsrecon -d <domain> [-t <typ>] [Optionen]
```

## Wichtigste Optionen

| Option | Bedeutung |
|--------|-----------|
| `-d <domain>` | Zieldomain |
| `-n <ns>` | zu verwendender Name-Server |
| `-t <typ>` | Enum-Typ: `std`, `axfr`, `brt` (brute), `rvl`, `srv`, `goo` |
| `-D <wortliste>` | Wortliste für `-t brt` |
| `-r <range>` | Reverse-Lookup über IP-Range (`-t rvl`) |
| `-x <datei>` | XML-Ausgabe · `-c <datei>` CSV · `-j <datei>` JSON |

## Beispiele

```bash
dnsrecon -d lab.local -n 192.168.56.60 -t axfr
dnsrecon -d example.com -t brt -D /usr/share/seclists/Discovery/DNS/subdomains-top1million-5000.txt
dnsrecon -r 192.168.56.0/24 -t rvl
```

## Hinweis

`axfr`/`brt` sind **aktiv** → nur eigene/freigegebene Ziele.

## Verwendet in

reconnaissance 04 (Zonentransfer), 05 (Subdomain-Brute-Force).
