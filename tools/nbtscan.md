# nbtscan

**Kategorie:** Enumeration (NetBIOS)

Scannt Netze/Hosts nach **NetBIOS-Namensinformationen**: NetBIOS-Name, Workgroup/Domäne, angemeldeter User, Dienst-Suffixe und MAC-Adresse.

```bash
nbtscan [Optionen] <ip|range>
```

## Wichtigste Optionen

| Option | Bedeutung |
|--------|-----------|
| `nbtscan 192.168.56.0/24` | ganzes Netz |
| `-v` | ausführlich (alle Namen/Suffixe) |
| `-f <datei>` | Ziele aus Datei |
| `-m` | kompaktes Format |
| `-r` | Quellport 137 nutzen (manche Ziele nötig) |

## Beispiele

```bash
nbtscan 192.168.56.0/24
nbtscan -v <ZIEL>
```

## Verwandt

- `nmblookup -A <ziel>` – Samba-Pendant (NetBIOS-Namenstabelle + MAC).
- `nmap -sU -p137 --script nbstat <ziel>` – NSE-Variante.

## Hinweis

Installation: `sudo apt install nbtscan`.

## Verwendet in

enumeration 05 (NetBIOS/RPC).
