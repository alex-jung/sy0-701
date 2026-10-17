# amass

**Kategorie:** Subdomain-/Attack-Surface-Enumeration · **Projekt:** OWASP

Umfassendes Mapping der externen Angriffsfläche. Kann **passiv** (OSINT-Aggregation) und **aktiv** (DNS-Brute-Force, Zonentransfer, Permutationen) arbeiten und Ergebnisse grafisch/als Datenbank verwalten.

```bash
amass <subcommand> [Optionen]
```

## Subcommands & Optionen

| Element | Bedeutung |
|---------|-----------|
| `enum` | Enumeration starten |
| `-passive` | nur passive Quellen (keine Anfragen ans Ziel) |
| `-active` | aktiv (DNS-Resolution, AXFR-Versuche) |
| `-brute` | DNS-Brute-Force |
| `-d <domain>` | Zieldomain |
| `-df <datei>` | Domain-Liste |
| `-silent` | nur Ergebnisse |
| `-o <datei>` | Ausgabe |
| `intel` | Org-/ASN-/Netzblock-Intel sammeln |

## Beispiele

```bash
amass enum -passive -d example.com -silent | sort -u
amass enum -active -brute -d example.com -o subs.txt   # nur autorisiert!
amass intel -org "Example Inc"
```

## Hinweis

`-active`/`-brute` erzeugen Traffic Richtung Ziel/DNS → nur eigene/freigegebene Domains. `-passive` ist unkritisch.

## Verwendet in

reconnaissance 05 (Subdomain-Enum).
