# dig

**Kategorie:** DNS / Recon · **Teil von:** `dnsutils`/`bind9-dnsutils`

Das mächtigste DNS-Abfragetool. Fragt beliebige Record-Typen, einen bestimmten Name-Server, Reverse-Lookups und Zonentransfers (AXFR) ab.

```bash
dig [@server] [name] [typ] [+optionen]
```

## Wichtigste Optionen

| Option | Bedeutung |
|--------|-----------|
| `A/AAAA/NS/MX/TXT/SOA/CNAME/PTR` | Record-Typ |
| `@<server>` | bestimmten Resolver/NS fragen (z. B. `@8.8.8.8`) |
| `+short` | nur die Werte (ideal fürs Scripting) |
| `+noall +answer` | nur den Answer-Abschnitt |
| `-x <ip>` | Reverse-Lookup (PTR) |
| `AXFR <zone>` | kompletter Zonentransfer |
| `+trace` | Auflösung von der Root an verfolgen |
| `+dnssec` | DNSSEC-Records mit abfragen |

## Beispiele

```bash
dig +short example.com A
dig example.com MX +noall +answer
dig -x 93.184.215.14 +short
dig AXFR lab.local @192.168.56.60        # Zonentransfer (nur autorisiert)
for t in A NS MX TXT SOA; do echo "== $t =="; dig +short example.com $t; done
```

## Verwendet in

reconnaissance 02 (DNS-Records), 04 (Zonentransfer), 05 (Verifizieren), 10.
