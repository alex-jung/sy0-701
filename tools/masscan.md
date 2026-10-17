# masscan

**Kategorie:** Port Scanning · **Benötigt root:** ja

Asynchroner Massen-Port-Scanner – scannt das Internet-weite oder /24-Portspektrum in Sekunden (eigener TCP/IP-Stack, Syntax an nmap angelehnt). Ideal für die **Breiten-Phase**: erst masscan findet offene Ports, dann macht nmap gezielt die Tiefe.

```bash
sudo masscan <ziele> -p <ports> --rate <pps> [Optionen]
```

## Wichtigste Optionen

| Option | Bedeutung |
|--------|-----------|
| `-p 1-65535` / `-p80,443,U:53` | Ports (TCP, `U:` für UDP) |
| `--rate <n>` | Pakete pro Sekunde (im Lab moderat, z. B. 1000) |
| `-iL <datei>` | Ziel-Liste aus Datei |
| `--range 192.168.56.0/24` | Zielbereich |
| `-e <iface>` | Interface |
| `--router-ip <ip>` | Gateway bei Routing-Problemen setzen |
| `--retries <n>` | Wiederholungen (gegen Paketverlust) |
| `-oL/-oJ/-oX <datei>` | Output: List / JSON / XML |
| `--exclude <ip>` | Hosts ausnehmen (z. B. Gateway) |

## Beispiele

```bash
sudo masscan 192.168.56.0/24 -p1-65535 --rate 1000 -oL masscan.txt
# offene Ports als ip:port extrahieren:
awk '/^open/{print $4":"$3}' masscan.txt | sort -u
```

## Hinweise

- **Nicht** gleichzeitig mit nmap auf dasselbe Ziel (verfälscht States).
- Zu hohe `--rate` → Paketverlust → Ports werden übersehen. Im Lab mit kleinen VMs moderat bleiben.

## Verwendet in

Übung 10 (vollständige Enumeration, Breiten-Phase).
