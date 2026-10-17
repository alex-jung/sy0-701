# tshark

**Kategorie:** Packet Analysis (CLI) · Teil von Wireshark

Die Kommandozeilen-Version von Wireshark – für **skriptbare/automatisierte** PCAP-Analyse, große Captures und Server ohne GUI. Nutzt dieselben Dissectors/Display-Filter wie Wireshark.

```bash
tshark -r <datei.pcap> [-Y "<display-filter>"] [-T fields -e <feld> ...]
tshark -i <iface> -f "<BPF>"        # live capture
```

## Wichtigste Optionen

| Option | Bedeutung |
|--------|-----------|
| `-r <pcap>` | Capture aus Datei lesen |
| `-i <iface>` / `-D` | live capturen / Interfaces listen |
| `-f "<BPF>"` | Capture-Filter (wie tcpdump) |
| `-Y "<filter>"` | **Display**-Filter (Wireshark-Syntax) |
| `-T fields -e <feld>` | bestimmte Felder ausgeben (pipebar) |
| `-q -z <stat>` | Statistik (`io,phs`, `conv,ip`, `http,tree`) |
| `-c <n>` / `-w <datei>` | n Pakete / in Datei schreiben |

## Beispiele

```bash
tshark -r cap.pcap -Y 'dns.flags.response==0' -T fields -e dns.qry.name | sort | uniq -c | sort -rn
tshark -r cap.pcap -q -z conv,ip
tshark -r cap.pcap -Y 'tcp.flags.syn==1 && tcp.flags.ack==0' -T fields -e ip.src | sort | uniq -c
```

## Hinweise

- `-Y` (Display) ≠ `-f` (BPF-Capture). Feldnamen via `tshark -G fields`.
- Mit `sort`/`uniq`/`awk` kombinieren (wie `zeek-cut`). Nur eigene Captures.

## Verwendet in

packet-analysis 01, 09, 10; Bezug ids-ips/logging-siem.
