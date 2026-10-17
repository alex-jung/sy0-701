# snmp-check

**Kategorie:** Enumeration (SNMP)

Fragt einen SNMP-Host ab und gibt die Informationen **menschenlesbar aufbereitet** aus: System-Info, Uptime, Netzwerk-Interfaces, Routing, lauschende Ports, Prozesse, teils Benutzer – ideal fürs Reporting (im Gegensatz zum rohen `snmpwalk`).

```bash
snmp-check <ziel> [-c community] [-v version]
```

## Wichtigste Optionen

| Option | Bedeutung |
|--------|-----------|
| `-c <community>` | Community String (Default `public`) |
| `-v <1\|2c>` | SNMP-Version |
| `-p <port>` | Port (Default 161) |
| `-w` | zeige auch Write-Zugriff an |

## Beispiel

```bash
snmp-check <ZIEL> -c public
```

## Hinweis

Gute Ergänzung zu `snmpwalk`: `snmpwalk` für gezielte OIDs/Scripting, `snmp-check` für den schnellen Gesamtüberblick. Installation: `sudo apt install snmp-check`.

## Verwendet in

enumeration 03 (SNMP Enumeration), 10.
