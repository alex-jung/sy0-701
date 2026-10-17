# nslookup

**Kategorie:** DNS / Recon

Klassisches DNS-Tool, auf praktisch allen Betriebssystemen (auch Windows) verfügbar. Kann einmalige Abfragen oder einen interaktiven Modus. Weniger scriptfreundlich als `dig`, aber überall vorhanden.

```bash
nslookup [-option] <name|ip> [server]
```

## Wichtigste Optionen

| Option | Bedeutung |
|--------|-----------|
| `-type=<typ>` / `-query=<typ>` | Record-Typ (`-type=MX`, `=NS`, `=TXT`, `=SOA`) |
| `nslookup <ip>` | Reverse-Lookup |
| `nslookup name server` | bestimmten Server fragen |
| interaktiv: `server <ns>`, `set type=<typ>` | im Dialog umschalten |

## Beispiele

```bash
nslookup example.com
nslookup -type=MX example.com
nslookup -type=TXT example.com 1.1.1.1
nslookup 93.184.215.14           # Reverse
```

Interaktiv:
```
nslookup
> set type=NS
> example.com
> exit
```

## Hinweis

Für Linux-Automatisierung ist `dig +short` meist die bessere Wahl; `nslookup` glänzt auf Windows/heterogenen Umgebungen.

## Verwendet in

reconnaissance 02 (DNS-Records).
