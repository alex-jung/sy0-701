# Lösung – Übung 05: Segmentierung (VLANs)

Beispiel: IoT `192.168.40.0/24`, Guest `192.168.50.0/24`, LAN `192.168.1.0/24`.

## 1. VLANs/Interfaces anlegen

- **Interfaces → Other Types → VLAN:** Parent-NIC + VLAN-Tag (z. B. 40, 50).
- **Interfaces → Assignments:** VLANs zuweisen → als `IOT`/`GUEST` aktivieren, statische IP (`.1/24`), **Services → DHCPv4** je Interface aktivieren.

## 2. Guest: nur Internet

**Firewall → Rules → GUEST** (Reihenfolge beachten):
```
1) Block  GUEST net -> LAN net        (und andere interne Netze / RFC1918-Alias)
2) Pass   GUEST net -> GUEST address : 53  (DNS zur Firewall, optional)
3) Pass   GUEST net -> any            (Internet)
```
Alternativ eleganter: Alias `Private_Nets` (alle RFC1918) → `Block GUEST -> Private_Nets` oben, dann `Pass GUEST -> any`.

## 3. IoT: nur definierte Flows

```
Block IoT net -> Private_Nets
Pass  IoT net -> IoT address : 53        (DNS)
Pass  IoT net -> <Update-Server/Alias>   (falls nötig)
(kein generelles -> any, wenn IoT nicht frei ins Internet soll)
```

## 4. Isolation testen

Von einem **Guest**-Host:
```bash
ping 192.168.1.10        # LAN-Host -> muss scheitern (Block)
nmap -Pn 192.168.1.0/24  # -> alles filtered
curl -I https://example.com   # Internet -> muss gehen
```
Von **IoT** analog: LAN unerreichbar, nur erlaubte Flows gehen.

## 5. Segmentierung vs. Lateral Movement

Ein kompromittierter Guest/IoT-Host **kann nicht** ins LAN pivoten, weil die Firewall den East-West-Traffic blockt – genau der Pivot-Weg aus `post-exploitation-pivoting` ist versperrt. Segmentierung begrenzt so den **Blast Radius**: eine Kompromittierung bleibt in ihrer Zone.

## Häufige Fehler / Troubleshooting

- **VLANs funktionieren nicht:** Proxmox-Bridge muss VLAN-aware sein bzw. Trunk zum Switch korrekt getaggt; Parent-NIC richtig.
- **Guest kommt doch ins LAN:** Block-Regel steht **unter** einer breiten Pass-Regel (first match) → nach oben; `Private_Nets`-Alias nutzen.
- **Kein DHCP im Segment:** DHCP-Dienst je Interface aktivieren, Range im Subnetz.
- **Inter-VLAN „any any" vergessen zu entfernen:** Default-Allow kopiert → bewusst verschärfen.
