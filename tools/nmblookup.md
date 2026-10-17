# nmblookup

**Kategorie:** Enumeration (NetBIOS) · **Teil von:** `samba-common-bin`

Samba-Werkzeug für NetBIOS-Namensabfragen. Löst NetBIOS-Namen auf und liefert die **Namenstabelle** eines Hosts (Rollen-Suffixe) inkl. MAC.

```bash
nmblookup [Optionen] <name|-A ip>
```

## Wichtigste Optionen

| Option | Bedeutung |
|--------|-----------|
| `-A <ip>` | Node-Status: Namenstabelle + MAC des Hosts |
| `<name>` | NetBIOS-Name → IP auflösen |
| `-S` | zusätzlich Node-Status |
| `-U <wins>` | gegen WINS-Server fragen |

## Beispiel

```bash
nmblookup -A <ZIEL>
```
```
METASPLOITABLE  <00> -  ...   (Workstation)
WORKGROUP       <00> - <GROUP>  ...
MAC Address = 00:0C:29:xx:xx:xx
```

## Verwendet in

enumeration 05 (NetBIOS/RPC).
