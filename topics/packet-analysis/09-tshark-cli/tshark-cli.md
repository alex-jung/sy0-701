# Übung 09 – CLI-Analyse mit tshark

**Schwierigkeit: 9/10 · Dauer: ca. 60 Min.**

## Lernziele

- tshark für skriptbare/automatisierte PCAP-Analyse nutzen
- Felder gezielt extrahieren und mit Unix-Tools auswerten
- Große Captures effizient verarbeiten (ohne GUI)
- Wiederverwendbare Analyse-Einzeiler bauen

## Theorie

**tshark** ist Wireshark für die Kommandozeile – ideal für **Automatisierung**, große Captures und Server ohne GUI. Es nutzt dieselben **Display-Filter** (`-Y`) und kann einzelne **Felder** ausgeben (`-T fields -e ...`), die man dann mit `sort`/`uniq`/`awk` auswertet (wie `zeek-cut`, `ids-ips` 09).

Typische Muster:
- Filtern + Felder extrahieren + aggregieren (Top-Talker, DNS-Queries, HTTP-Hosts).
- Statistiken (`-q -z ...`): conv, io,phs, http,tree.
- Batch über viele PCAPs.

CLI-Analyse ist in SOC/Forensik Alltag (reproduzierbar, pipebar, serverfähig).

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `tshark` | CLI-Capture/-Analyse |
| `-Y` / `-T fields -e` / `-z` | Filter / Feldausgabe / Statistik |
| `sort`/`uniq`/`awk` | Aggregation |

## Lab-Setup

- Ein PCAP (z. B. aus Übung 01/07). tshark installiert.

## Aufgabe (selbst lösen)

1. Gib mit tshark alle **DNS-Queries** eines PCAPs aus und bestimme die **häufigsten** (Top 10).
2. Extrahiere **HTTP-Hosts + URIs** und finde verdächtige Zugriffe.
3. Baue eine **Top-Talker**-Auswertung (Quell-IP nach Paket-/Byte-Zahl) via `-z conv` oder Feld-Extraktion.
4. Zähle **SYN-only**-Pakete pro Quelle (Scan-Erkennung) mit einem Einzeiler.
5. Schreibe einen wiederverwendbaren **Einzeiler/Skript**, das ein PCAP auf IoCs (DNS/HTTP/Scan) zusammenfasst.

**Ziel:** mehrere skriptbare tshark-Auswertungen (DNS, HTTP, Top-Talker, Scan) + ein wiederverwendbarer Analyse-Einzeiler.

## SY0-701 Prüfungsbezug

- **Automatisierte/CLI-Netzwerkanalyse**, reproduzierbare Forensik, Server-/SOC-Einsatz.
- Feld-Extraktion/Aggregation als Analyse-Technik (analog Zeek).
- Begriffe: *tshark*, *display filter*, *field extraction*, *traffic statistics*, *IoC*.
