# onesixtyone

**Kategorie:** Enumeration (SNMP)

Sehr schneller SNMP-Community-String-Scanner. Testet eine Wortliste von Community-Strings gegen einen oder viele Hosts (UDP 161) und meldet gültige Treffer samt sysDescr.

```bash
onesixtyone [Optionen] <ziel> [community]
```

## Wichtigste Optionen

| Option | Bedeutung |
|--------|-----------|
| `-c <datei>` | Community-String-Wortliste |
| `-i <datei>` | Ziel-Liste (viele Hosts) |
| `-o <datei>` | Ausgabe speichern |
| `-w <ms>` | Wartezeit zwischen Paketen |

## Beispiele

```bash
onesixtyone -c /usr/share/seclists/Discovery/SNMP/common-snmp-community-strings.txt <ZIEL>
echo -e "public\nprivate" > comm.txt; onesixtyone -c comm.txt <ZIEL>
```

Treffer:
```
<ZIEL> [public] Linux metasploitable 2.6.24-16-server ...
```

## Hinweis

Installation: `sudo apt install onesixtyone`.

## Verwendet in

enumeration 03 (SNMP Enumeration).
