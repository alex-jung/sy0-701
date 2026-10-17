# snmpwalk

**Kategorie:** Enumeration (SNMP) · **Teil von:** `snmp`

Läuft den SNMP-MIB-Baum eines Ziels ab (GETNEXT) und gibt alle lesbaren OIDs/Werte aus – System, Prozesse, Software, User, Netzwerk.

```bash
snmpwalk -v <version> -c <community> <ziel> [OID]
```

## Wichtigste Optionen

| Option | Bedeutung |
|--------|-----------|
| `-v 1\|2c\|3` | SNMP-Version |
| `-c <community>` | Community String (v1/v2c), z. B. `public` |
| `-On` | numerische OIDs ausgeben |
| `-Oa` | Strings als ASCII |
| `OID` | Teilbaum statt allem |

## Nützliche OIDs

| OID | Inhalt |
|-----|--------|
| `1.3.6.1.2.1.1.1` | sysDescr (OS/Kernel) |
| `1.3.6.1.2.1.1.5` | sysName (Hostname) |
| `1.3.6.1.2.1.25.4.2.1.2` | laufende Prozesse |
| `1.3.6.1.2.1.25.6.3.1.2` | installierte Software |
| `1.3.6.1.2.1.6.13.1.3` | lokale TCP-Ports |

## Beispiele

```bash
snmpwalk -v2c -c public <ZIEL>
snmpwalk -v2c -c public -On <ZIEL> 1.3.6.1.2.1.25.4.2.1.2
```

## Hinweis

Installation: `sudo apt install snmp`. SNMPv3 braucht `-u user -l authPriv -a/-x ...`.

## Verwendet in

enumeration 03 (SNMP Enumeration), 10.
