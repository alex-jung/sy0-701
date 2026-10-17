# Lösung – Übung 01: Host Discovery / Ping Sweep

## 1. Eigenes Subnetz ermitteln

```bash
ip -brief a          # kompakte Übersicht aller Interfaces + IPs
ip route             # Default-Route + lokale Netze
```

Beispiel-Ausgabe:
```
eth0  UP  192.168.56.101/24
```
→ Dein Netz ist `192.168.56.0/24`, Interface `eth0`. **Passe die folgenden Befehle an dein echtes Netz an.**

## 2. Ping Sweep über das Subnetz

### Mit nmap
```bash
sudo nmap -sn -n 192.168.56.0/24
```
- `-sn` = nur Host Discovery, keine Ports
- `-n` = keine DNS-Auflösung (schneller, keine Störanfragen)
- Als root sendet nmap im lokalen Subnetz automatisch **ARP-Requests** (`-PR`).

Beispiel-Ausgabe:
```
Nmap scan report for 192.168.56.1
Host is up (0.00040s latency).
MAC Address: 08:00:27:AA:BB:CC (Oracle VirtualBox virtual NIC)
Nmap scan report for 192.168.56.100
Host is up (0.00052s latency).
MAC Address: 08:00:27:11:22:33 ...
Nmap done: 256 IP addresses (3 hosts up) scanned in 2.05s
```

### Mit arp-scan
```bash
sudo arp-scan --localnet          # nutzt automatisch das Netz von eth0
# oder gezielt:
sudo arp-scan -I eth0 192.168.56.0/24
```
Ausgabe (IP + MAC + Hersteller):
```
192.168.56.1    08:00:27:aa:bb:cc   (Unknown)
192.168.56.100  08:00:27:11:22:33   PCS Systemtechnik GmbH
```

### Mit netdiscover
```bash
sudo netdiscover -r 192.168.56.0/24        # aktiv
sudo netdiscover -p                        # passiv (nur mithören, leiser)
```

## 3. Antworten

- **Metasploitable:** meist die VM mit auffällig vielen späteren offenen Ports; identifiziere sie über die MAC bzw. indem du in Übung 02 die offenen Ports siehst. Typisch im Beispiel: `192.168.56.100`.
- **Anzahl aktiver Hosts:** steht in der nmap-Zusammenfassung (`X hosts up`).

## 4. Warum ARP zuverlässiger ist als ICMP

- ARP arbeitet auf **Layer 2** und ist im selben Segment **zwingend** – ein Host *muss* antworten, um erreichbar zu sein. Firewalls/Host-Firewalls können ARP im lokalen Segment nicht sinnvoll unterdrücken.
- ICMP (Layer 3) wird von Host-Firewalls oder der Netz-Firewall häufig **gedroppt** → der Host erscheint fälschlich als „down".
- Konsequenz: **Im lokalen Subnetz immer ARP-Discovery bevorzugen.** Erst wenn man geroutet/über Segmente hinweg scannt (kein ARP möglich), muss man auf TCP/UDP/ICMP-Probes ausweichen (→ Übung 09).

## Häufige Fehler / Troubleshooting

- **„You requested a scan type which requires root privileges."** → `sudo` verwenden.
- **Alle Hosts erscheinen down:** falsches Interface/Netz. Prüfe `ip a`; ggf. `-e eth0` setzen.
- **DNS hängt / langsam:** `-n` nicht vergessen.
- **In Proxmox:** Wenn Kali und Ziel an verschiedenen Bridges/VLANs hängen, sind sie **nicht** im selben Broadcast-Segment → ARP findet nichts. Beide an dieselbe Bridge (z. B. `vmbr1`) hängen.
