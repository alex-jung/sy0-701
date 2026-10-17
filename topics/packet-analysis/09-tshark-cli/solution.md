# Lösung – Übung 09: tshark-CLI

`cap.pcap` = das zu analysierende Capture.

## 1. DNS-Queries (Top 10)

```bash
tshark -r cap.pcap -Y dns.flags.response==0 -T fields -e dns.qry.name \
  | sort | uniq -c | sort -rn | head
```

## 2. HTTP-Hosts + URIs

```bash
tshark -r cap.pcap -Y http.request -T fields -e http.host -e http.request.uri \
  | sort | uniq -c | sort -rn | head -20
```
Verdächtig: ungewöhnliche Hosts, `/admin`, Scanner-Pfade.

## 3. Top-Talker

```bash
tshark -r cap.pcap -q -z conv,ip | head -20
# oder feldbasiert nach Quell-IP:
tshark -r cap.pcap -T fields -e ip.src | sort | uniq -c | sort -rn | head
```

## 4. SYN-only pro Quelle (Scan)

```bash
tshark -r cap.pcap -Y "tcp.flags.syn==1 && tcp.flags.ack==0" -T fields -e ip.src \
  | sort | uniq -c | sort -rn
```
Eine Quelle mit sehr vielen SYN = Scan-Verdacht.

## 5. Wiederverwendbarer Einzeiler/Skript

```bash
#!/usr/bin/env bash
P="$1"
echo "== Top DNS =="; tshark -r "$P" -Y 'dns.flags.response==0' -T fields -e dns.qry.name | sort | uniq -c | sort -rn | head
echo "== Top HTTP Hosts =="; tshark -r "$P" -Y http.request -T fields -e http.host | sort | uniq -c | sort -rn | head
echo "== SYN-Scanner =="; tshark -r "$P" -Y 'tcp.flags.syn==1 && tcp.flags.ack==0' -T fields -e ip.src | sort | uniq -c | sort -rn | head
```
→ schnelle IoC-Übersicht pro PCAP, batch-fähig über viele Dateien.

## Nützliche Statistiken

```bash
tshark -r cap.pcap -q -z io,phs        # Protocol Hierarchy
tshark -r cap.pcap -q -z http,tree     # HTTP-Statistik
tshark -r cap.pcap -q -z conv,tcp      # TCP-Conversations
```

## Häufige Fehler / Troubleshooting

- **Feld leer:** falscher Feldname → `tshark -G fields | grep <proto>` zum Nachschlagen.
- **`-Y` vs `-f`:** `-Y` = Display-Filter (Analyse), `-f` = Capture-Filter (BPF beim Mitschnitt).
- **Langsam bei großem PCAP:** zuerst mit `-Y` grob filtern, ggf. `editcap` zum Splitten.
- **Keine Rechte beim Live-Capture:** für `-r` (Datei) nicht nötig; Live braucht Capture-Rechte.
