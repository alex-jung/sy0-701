# Lösung – Übung 01: Capture-Grundlagen

## 1. Interfaces

```bash
ip -brief a
tshark -D            # nummerierte Capture-Interfaces
tcpdump -D
```
Das Interface wählen, das den Ziel-Traffic sieht (z. B. `eth0`).

## 2. Fokussierter Capture (BPF)

```bash
sudo tcpdump -ni eth0 'host 192.168.56.100 and tcp port 80' -w web.pcap
# -n keine Auflösung, -i Interface, -w Datei, in '' der BPF-Filter
```

## 3. Traffic erzeugen + prüfen

```bash
curl -s http://192.168.56.100/ >/dev/null     # in anderem Terminal
# Capture stoppen (Ctrl+C), prüfen:
tcpdump -nr web.pcap | head
```
Die HTTP-Pakete sind im PCAP.

## 4. Capture- vs. Display-Filter

- **Capture-Filter (BPF):** entscheidet **vor** dem Schreiben, was mitgeschnitten wird → kleinere Dateien, aber Verworfenes ist **weg**. Syntax: `host`, `port`, `tcp`, `udp`, `net`.
- **Display-Filter (Wireshark):** filtert **nachträglich** nur die **Anzeige** eines vorhandenen Captures (alles bleibt gespeichert). Eigene Syntax (`http`, `ip.addr==`, Übung 03).

## 5. Geswitchtes Netz

Ein Switch leitet Unicast nur an den Ziel-Port → deine NIC sieht standardmäßig nur **eigenen** Traffic + Broadcast/Multicast. Für fremden Traffic: **SPAN/Mirror-Port**, **Tap**, oder eine MITM-Position (ARP-Spoofing – nur autorisiert). Promiscuous Mode allein reicht im Switch nicht.

## Häufige Fehler / Troubleshooting

- **Nichts gecaptured:** falsches Interface / zu enger BPF; ohne `-n` hängt es an DNS.
- **Riesige Datei:** BPF zu weit → eingrenzen (`host`/`port`).
- **Keine Rechte:** `sudo` bzw. Capture-Capabilities.
- **Fremder Traffic fehlt:** geswitchtes Netz → Mirror/Tap nötig.
