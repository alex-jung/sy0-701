# tcpdump

**Kategorie:** Packet Capture · **Benötigt root:** ja

Kommandozeilen-Sniffer. In den Übungen genutzt, um den **TCP-Handshake**, SYN/RST-Flags, ICMP-Unreachables und Fragmente direkt zu sehen – der schnellste Weg, Scan-Verhalten zu belegen.

```bash
sudo tcpdump [Optionen] [Filter-Ausdruck]
```

## Wichtigste Optionen

| Option | Bedeutung |
|--------|-----------|
| `-i <iface>` | Interface (`-i any` für alle) |
| `-n` | keine DNS-Auflösung |
| `-nn` | auch Ports nicht auflösen |
| `-v` / `-vv` | mehr Details (TTL, Flags) |
| `-c <n>` | nach n Paketen stoppen |
| `-w <datei>` | Rohmitschnitt in `.pcap` schreiben (→ Wireshark) |
| `-r <datei>` | `.pcap` wieder einlesen |
| `-X` | Hex + ASCII des Payloads |
| `-e` | Ethernet-Header (MACs) zeigen |

## Filter (BPF)

```bash
host 192.168.56.100            # nur dieser Host
tcp port 22                    # nur TCP/22
icmp                           # nur ICMP
tcp[tcpflags] & tcp-syn != 0   # Pakete mit SYN-Flag
```

## Beispiele

```bash
sudo tcpdump -ni eth0 host 192.168.56.100 and tcp port 22   # Handshake sehen
sudo tcpdump -ni eth0 icmp                                  # Port-Unreachable (UDP-Scan)
sudo tcpdump -ni eth0 -w scan.pcap host 192.168.56.100      # für Wireshark sichern
```

## Flag-Kürzel in der Ausgabe

`[S]`=SYN · `[S.]`=SYN/ACK · `[.]`=ACK · `[R]`/`[R.]`=RST · `[P.]`=PSH/ACK · `[F.]`=FIN/ACK

## Verwendet in

Übungen 02, 03, 06, 08 (Handshake, States, ICMP, Fragmente).
