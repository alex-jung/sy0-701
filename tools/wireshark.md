# wireshark

**Kategorie:** Packet Analysis (GUI)

Grafischer Protokoll-Analyzer. Dieselben Mitschnitte wie `tcpdump`, aber mit komfortablen **Display-Filtern**, Farbcodierung, Stream-Rekonstruktion und Protokoll-Dekodierung. In den Übungen zum visuellen Nachvollziehen von Handshakes, Fragmenten und Decoys.

```bash
wireshark                     # GUI starten
wireshark -r scan.pcap        # vorhandenen Mitschnitt öffnen
tshark -i eth0                # CLI-Variante von Wireshark
```

## Wichtige Display-Filter (≠ tcpdump/BPF-Syntax!)

| Filter | Zeigt |
|--------|-------|
| `ip.addr == 192.168.56.100` | Traffic zu/von Host |
| `tcp.port == 22` | TCP-Port 22 |
| `tcp.flags.syn == 1 && tcp.flags.ack == 1` | SYN/ACK → offene Ports |
| `tcp.flags.reset == 1` | RST → geschlossene Ports |
| `icmp` | ICMP (z. B. Port-Unreachable) |
| `ip.flags.mf == 1 || ip.frag_offset > 0` | IP-Fragmente (Evasion) |

## Nützliche Funktionen

- **Follow → TCP Stream:** rekonstruiert eine komplette Verbindung (z. B. Banner, HTTP).
- **Statistics → Conversations/Endpoints:** wer spricht mit wem (Decoys entlarven).
- **Capture-Filter** (vor dem Mitschnitt, BPF-Syntax wie tcpdump) vs. **Display-Filter** (nachträglich, eigene Syntax).

## Hinweis

Capture-Rechte: auf Kali meist eingerichtet; sonst als root starten oder `dumpcap`-Capabilities setzen.

## Verwendet in

Übungen 02, 03, 08 (Handshake-/Flag-/Fragment-/Decoy-Analyse).
