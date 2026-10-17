# ip

**Kategorie:** Netzwerk-Konfiguration · **Teil von:** `iproute2` (Standard auf Linux/Kali)

Zentrales Linux-Tool für Interfaces, IP-Adressen, Routen und ARP-/Nachbar-Tabelle. Ersetzt die alten `ifconfig`/`route`/`arp`. In den Übungen primär genutzt, um **das eigene Subnetz und das Gateway** zu ermitteln.

```bash
ip [Objekt] [Kommando]
```

## Wichtigste Kommandos

| Kommando | Bedeutung |
|----------|-----------|
| `ip a` / `ip addr` | alle Interfaces + IP-Adressen |
| `ip -brief a` | kompakte Übersicht (Interface, Status, IP/CIDR) |
| `ip link` | Interfaces (Layer 2, MAC, up/down) |
| `ip r` / `ip route` | Routing-Tabelle inkl. Default-Gateway |
| `ip neigh` | ARP-/Neighbor-Tabelle (bekannte MACs) |
| `ip -4 a` / `ip -6 a` | nur IPv4 bzw. IPv6 |

## Interface setzen (Lab)

```bash
sudo ip link set eth0 up                       # Interface aktivieren
sudo ip addr add 192.168.56.50/24 dev eth0     # IP vergeben
sudo ip route add default via 192.168.56.1     # Default-Gateway setzen
```

## Beispiel: eigenes Netz finden

```bash
ip -brief a          # -> eth0 UP 192.168.56.101/24  => Netz 192.168.56.0/24
ip route             # -> default via 192.168.56.1 dev eth0
```

## Verwendet in

Übung 01 (Subnetz ermitteln), 09 (Routing über die Firewall prüfen).
