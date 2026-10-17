# Lösung – Übung 03: SYN / Stealth Scan & Port States

## 1. SYN-Scan vs. Connect-Scan

```bash
sudo nmap -sS -p- <ZIEL>        # SYN / half-open (root nötig)
```
Die **Liste offener Ports ist identisch** zu `-sT` aus Übung 02 – beide finden dieselben lauschenden Dienste. Unterschied ist *wie* gescannt wird (Handshake vollendet vs. abgebrochen), nicht *was* gefunden wird.

## 2. Nachweis im Mitschnitt

Terminal 1:
```bash
sudo tcpdump -ni eth0 host <ZIEL> and tcp port 22
```
Terminal 2:
```bash
sudo nmap -sS -p 22 <ZIEL>
```
Erwartet:
```
Kali > ZIEL  Flags [S]     (SYN)
ZIEL > Kali  Flags [S.]    (SYN, ACK)
Kali > ZIEL  Flags [R]     (RST)        ← kein ACK! Handshake wird abgebrochen
```
Vergleich mit `-sT` (Übung 02): dort kam zusätzlich `Flags [.]` (ACK) → voller Handshake. Das fehlende ACK ist der Kern von „half-open".

## 3. Filtered-Port erzeugen

Auf **Metasploitable** (Ziel):
```bash
sudo iptables -A INPUT -p tcp --dport 8888 -j DROP
```
Von **Kali**:
```bash
sudo nmap -sS -p 8888 --reason <ZIEL>
```
Ausgabe:
```
PORT     STATE    SERVICE  REASON
8888/tcp filtered unknown  no-response
```
`--reason` zeigt `no-response` → nmap bekam gar nichts zurück → `filtered`.

Zum Vergleich ein **closed** Port (nicht geblockt, kein Dienst):
```
PORT   STATE  SERVICE REASON
1/tcp  closed tcpmux  reset        ← RST kam zurück
```

Regel wieder entfernen:
```bash
sudo iptables -D INPUT -p tcp --dport 8888 -j DROP
```

## 4. closed vs. filtered

- **closed:** Host ist erreichbar und antwortet mit **RST** – der Port ist nur ohne Dienst. Du weißt: Host lebt, Port zu.
- **filtered:** Es kommt **keine Antwort** (Paket wird von einer Firewall/ACL still gedroppt). Du weißt *nicht*, ob der Port offen oder zu ist – nur dass gefiltert wird.
- **Warum interessant:** `filtered` verrät indirekt, dass dort eine **Firewall** steht und wo Segmentgrenzen liegen. Für den Verteidiger heißt „viele filtered" meist: Firewall macht ihren Job (default-deny).

## Häufige Fehler / Troubleshooting

- **`-sS` liefert gleiche Warnung wie fehlendes root:** als `sudo`/root ausführen.
- **Alles „filtered":** du scannst evtl. schon durch eine Firewall (Proxmox-Bridge-Isolation, OPNsense) – gewollt erst ab Übung 09.
- **iptables-Regel wirkt nicht:** Reihenfolge der Regeln beachten; mit `sudo iptables -L -n --line-numbers` prüfen. Bei Metasploitable 3 ggf. `ufw`/andere Firewall.
- **`--reason` zeigt `host-unreach`/`admin-prohibited`:** auch das ist `filtered`, aber hier antwortet eine Firewall aktiv mit ICMP statt still zu droppen.
