# Übung 09 – Scannen durch die OPNsense-Firewall / segmentierte Netze

**Schwierigkeit: 9/10 · Dauer: ca. 90 Min.**

## Lernziele

- Den Unterschied zwischen Scannen **im selben Segment** und **über eine geroutete/gefilterte Grenze** verstehen
- Firewall-Regeln auf OPNsense aus Scan-Sicht lesen (welche Ports „kommen durch")
- Erkennen, wo **Network Segmentation** die Angriffsfläche begrenzt
- Mit einem kompromittierten Host **weiterscannen** (Pivoting-Grundidee)

## Theorie

Sobald zwischen Kali und Ziel eine **geroutete, gefilterte Grenze** liegt (OPNsense trennt z. B. ein LAN-Segment von einem „DMZ"-/Server-Segment), ändert sich alles:

- **Kein ARP mehr** über die Grenze → Layer-2-Discovery (Übung 01) funktioniert nicht. Man braucht Layer-3-/TCP-Discovery (`-PS`, `-PA`, `-PE`).
- Die Firewall erlaubt per **Regelwerk** nur bestimmte Ports → viele Ports erscheinen `filtered`. Was `open`/`closed` zurückkommt, verrät die **erlaubten** Dienste.
- **Stateful Firewall:** Antworten kommen nur zu Verbindungen, die die Regeln zulassen. `-sA` (ACK-Scan) hilft zu unterscheiden, ob **überhaupt gefiltert** wird (stateful vs. stateless).
- **Pivoting:** Erreicht man ein Segment nicht direkt, scannt man es **von einem bereits kompromittierten Host im Zielsegment aus** – konzeptionell hier über eine zweite VM / SSH-Proxy nachgestellt.

## Verwendete Tools

| Tool | Zweck | Wichtige Optionen |
|------|-------|-------------------|
| `nmap` | Scan über Grenzen | `-Pn` (Discovery überspringen), `-PS`/`-PA`/`-PU` (TCP/UDP-Ping), `-sA` (ACK-Scan), `--traceroute` |
| OPNsense | Regelwerk + Segmente | Firewall → Rules; Interfaces/VLANs |
| `proxychains` + SSH | Pivoting nachstellen | `ssh -D`, `proxychains nmap -sT` |
| `traceroute` | Pfad/Hops sehen | — |

## Lab-Setup

**Topologie (Beispiel):**
```
Kali (LAN-Segment)  ──►  OPNsense  ──►  Server-Segment (Metasploitable/DVWA)
   192.168.10.0/24         (FW)            192.168.20.0/24
```
- Zwei Proxmox-Bridges/VLANs, OPNsense mit je einem Interface pro Segment, Firewall-Regeln dazwischen (z. B. nur 80/443 vom LAN in die „DMZ" erlaubt).
- Optional ein „Pivot"-Host im Server-Segment, auf den du dich per SSH verbindest.

## Aufgabe (selbst lösen)

1. Scanne vom LAN aus ein Ziel im Server-Segment. Warum findet `-sn` (ARP) hier nichts, und wie bekommst du trotzdem Host-Discovery hin?
2. Ermittle, **welche Ports die OPNsense durchlässt** (open/closed) und welche sie **blockt** (filtered). Leite daraus das grobe Regelwerk ab.
3. Setze einen **ACK-Scan** (`-sA`) ein und bestimme, ob die Firewall **stateful** filtert (States: `unfiltered` vs. `filtered`).
4. Nutze `--traceroute`, um die OPNsense als **Hop** zwischen dir und dem Ziel sichtbar zu machen.
5. **Pivoting:** Verbinde dich per SSH auf einen Host im Server-Segment, baue einen SOCKS-Proxy (`ssh -D`) und scanne das Server-Segment **durch den Pivot** mit `proxychains nmap -sT`. Vergleiche die Sicht mit dem direkten Scan vom LAN.
6. Beschreibe, wie **Segmentierung** hier als Schutzmaßnahme wirkt.

**Ziel:** Du scannst erfolgreich über eine Firewall-Grenze, liest das Regelwerk aus den Port-States und verstehst Pivoting als Weg um Segmentierung herum.

## SY0-701 Prüfungsbezug

- **Network Segmentation / Zero Trust / DMZ / Screened Subnet** (3.0 Security Architecture) – warum man Segmente trennt und wie das die Angriffsfläche reduziert.
- **Stateful vs. stateless firewall**, **ACL**, **implicit deny** – aus Scan-Sicht genau das, was `filtered`/`unfiltered` zeigt.
- **Lateral Movement / Pivoting** (2.0/4.0) – Angreifer bewegen sich über kompromittierte Hosts in andere Segmente; Gegenmaßnahme = Mikrosegmentierung, Monitoring.
- Begriffe: *segmentation*, *DMZ/screened subnet*, *stateful firewall*, *implicit deny*, *pivoting/lateral movement*, *east-west vs. north-south traffic*.
