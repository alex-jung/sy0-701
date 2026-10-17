# Lösung – Übung 09: Scannen durch die OPNsense-Firewall

Annahme: Kali in `192.168.10.0/24`, Ziel `192.168.20.50` hinter OPNsense; FW erlaubt vom LAN nur 80/443 in die DMZ.

## 1. Discovery über die Grenze

`-sn`/ARP scheitert, weil **ARP nicht geroutet** wird – es gilt nur im lokalen Broadcast-Segment. Über die Firewall hinweg hilft nur Layer-3/4:

```bash
# ICMP wird oft geblockt -> Discovery ganz überspringen:
sudo nmap -Pn 192.168.20.50

# Oder TCP-Ping auf wahrscheinlich erlaubte Ports:
sudo nmap -PS80,443 -PA80 192.168.20.50
```
`-Pn` behandelt den Host als „up" und scannt direkt – richtig, wenn Discovery-Probes gefiltert werden.

## 2. Regelwerk aus Port-States ableiten

```bash
sudo nmap -Pn -sS -p 1-1000 192.168.20.50
```
```
PORT    STATE    SERVICE
80/tcp  open     http
443/tcp closed   https          # durchgelassen, aber kein Dienst
22/tcp  filtered ssh            # von FW geblockt
445/tcp filtered microsoft-ds   # geblockt
```
Interpretation:
- `open`/`closed` = **Firewall lässt diesen Port durch** (Antwort erreicht dich).
- `filtered` = **Firewall blockt** (keine Antwort).
→ Regelwerk: „vom LAN nur 80/443 in die DMZ erlaubt, Rest default-deny". Das deckt sich mit dem OPNsense-Ruleset.

## 3. ACK-Scan: stateful?

```bash
sudo nmap -Pn -sA -p 22,80 192.168.20.50
```
- `unfiltered` → Pakete kommen durch (stateless/keine Regel).
- `filtered` → **stateful** Firewall blockt unaufgeforderte ACKs.
Bei OPNsense (stateful, default-deny) erwartet man für geblockte Ports `filtered`, für erlaubte ggf. `unfiltered`. Der ACK-Scan sagt **nicht** open/closed, sondern **ob gefiltert wird** – ideal, um Firewall-Verhalten zu kartieren.

## 4. Traceroute / Firewall als Hop

```bash
sudo nmap -Pn --traceroute -p 80 192.168.20.50
```
```
HOP  RTT      ADDRESS
1    0.5 ms   192.168.10.1   (OPNsense LAN-IF)
2    0.8 ms   192.168.20.50  (Ziel)
```
Die OPNsense taucht als Hop 1 auf → Beleg, dass du geroutet/über die FW scannst, nicht im selben Segment.

## 5. Pivoting durch einen kompromittierten Host

Angenommen, du hast SSH-Zugang zu einem Host `192.168.20.10` im Server-Segment:
```bash
# 1) SOCKS-Proxy über SSH aufbauen (dynamic port forwarding)
ssh -D 1080 -N user@192.168.20.10

# 2) proxychains konfigurieren: /etc/proxychains4.conf -> socks5 127.0.0.1 1080

# 3) durch den Pivot scannen (nur TCP connect geht über SOCKS):
proxychains nmap -sT -Pn -p 1-1000 192.168.20.0/24
```
Jetzt siehst du das Server-Segment **aus dessen Innensicht** – Ports, die die OPNsense vom LAN aus blockt (z. B. 22, 445, 3306), sind intern erreichbar. Das ist der Kern von **Lateral Movement**.
> Hinweis: Über SOCKS funktioniert nur `-sT` (kein Raw-Socket/SYN, kein ICMP-Discovery → `-Pn`).

## 6. Segmentierung als Schutz

- Die Firewall reduziert die vom LAN erreichbare **Angriffsfläche** auf 80/443 – alle anderen Dienste sind unerreichbar, obwohl sie laufen.
- Ein Angreifer im LAN „sieht" den verwundbaren MySQL/SMB **nicht**. Erst ein **Pivot** (kompromittierter DMZ-Host) öffnet den internen Blick.
- Gegenmaßnahmen: strengere **east-west**-Regeln (Mikrosegmentierung), Monitoring/IDS auf Inter-Segment-Traffic, least privilege bei FW-Regeln.

## Häufige Fehler / Troubleshooting

- **Alles `filtered`, auch 80:** FW-Regel fehlt/falsches Interface, oder Default-Gateway auf Kali zeigt nicht auf OPNsense. Routing prüfen (`ip route`), OPNsense-Rules prüfen.
- **`-Pn` vergessen:** Scan bricht ab, weil Host „down" (Discovery geblockt). Über Grenzen fast immer `-Pn`.
- **proxychains hängt/leckt DNS:** `proxy_dns` in der conf; nur TCP-Scans; `-n` bei nmap.
- **Proxmox-Segmente doch verbunden:** wenn beide VMs an derselben Bridge hängen, gibt es keine echte Grenze – getrennte Bridges/VLANs + OPNsense dazwischen sind Voraussetzung.
