# Übung 03 – Display-Filter beherrschen

**Schwierigkeit: 3/10 · Dauer: ca. 50 Min.**

## Lernziele

- Die Wireshark-Display-Filter-Syntax sicher anwenden
- Nach IP, Port, Protokoll, Feldern und Flags filtern
- Operatoren und Verkettung nutzen (==, contains, matches, &&, ||)
- Große Captures schnell auf das Relevante reduzieren

## Theorie

**Display-Filter** (≠ BPF-Capture-Filter!) reduzieren die **Anzeige** eines geladenen Captures. Syntax ist feldbasiert:

| Filter | Bedeutung |
|--------|-----------|
| `ip.addr == 10.0.0.5` | Host (Quelle oder Ziel) |
| `ip.src == ... && tcp.dstport == 443` | Richtung + Port |
| `tcp.port == 80`, `udp.port == 53` | Port |
| `http`, `dns`, `tls`, `arp`, `icmp` | Protokoll |
| `http.request.method == "POST"` | Protokollfeld |
| `tcp.flags.syn==1 && tcp.flags.ack==0` | SYN (Scan) |
| `frame contains "password"` | Byte-Suche |
| `dns.qry.name matches "evil"` | Regex |

Operatoren: `== != > <`, `contains`, `matches` (Regex), Logik `&&`/`||`/`!`. Rechtsklick auf ein Feld → **Apply as Filter** baut Filter automatisch.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Wireshark Display-Filter-Zeile | Filtern |
| Apply as Filter / Prepare | Filter aus Feldern bauen |

## Lab-Setup

- Ein gemischtes PCAP (HTTP + DNS + TCP + evtl. Scan). Wireshark.

## Aufgabe (selbst lösen)

1. Filtere nur den Traffic **eines Hosts**, dann nur dessen **HTTP-POST**-Requests.
2. Finde alle **DNS-Anfragen** und filtere auf einen bestimmten Domainnamen (contains/matches).
3. Filtere **SYN-only**-Pakete (Scan-Indikator) und **TCP-RST** (Fehler/geschlossen).
4. Suche mit `frame contains "..."` nach einem Klartext-String (z. B. „password" oder einem User).
5. Verkette mehrere Bedingungen (`&&`/`||`) zu einem präzisen Filter und erkläre Capture- vs. Display-Filter erneut.

**Ziel:** sichere Beherrschung der Display-Filter, um große Captures gezielt auf relevante Pakete zu reduzieren.

## SY0-701 Prüfungsbezug

- **Traffic-Analyse/Filterung**, feldbasierte Suche, Scan-/Fehler-Indikatoren (SYN/RST).
- Effiziente Forensik in großen Captures.
- Begriffe: *display filter*, *protocol/field filter*, *TCP flags*, *regex match*.
