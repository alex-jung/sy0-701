# Übung 04 – TCP/UDP-Analyse

**Schwierigkeit: 4/10 · Dauer: ca. 55 Min.**

## Lernziele

- Den TCP-3-Way-Handshake und Verbindungsabbau im Capture lesen
- TCP-Flags, Sequenznummern und Ports interpretieren
- TCP-Probleme erkennen (Retransmissions, RST, Dup-ACK, Zero Window)
- UDP (verbindungslos) von TCP abgrenzen (DNS/DHCP-Beispiele)

## Theorie

**TCP** ist verbindungsorientiert: **3-Way-Handshake** (SYN → SYN/ACK → ACK), Datenaustausch mit **Seq/Ack**-Nummern, Abbau (FIN/ACK bzw. RST). Flags: **SYN, ACK, FIN, RST, PSH, URG**.

Auffälligkeiten (Wireshark markiert sie, Expert Info):
- **Retransmission / Dup ACK:** Paketverlust/Latenz.
- **RST:** abrupter Abbruch (geschlossener Port/Reset).
- **Zero Window:** Empfänger überlastet.
- **SYN ohne Folge:** Scan (Übung 07).

**UDP** ist verbindungslos (kein Handshake) – man sieht einzelne Request/Response (DNS, DHCP, NTP). Das Verständnis ist Basis für Scan-/Problem-/Angriffserkennung.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Wireshark | Flags/Seq/Expert Info |
| Statistics → TCP Stream Graphs / Expert Info | Probleme sichtbar machen |

## Lab-Setup

- Ein PCAP mit normalem TCP-Verkehr + optional einem Scan/Problemfall. Wireshark.

## Aufgabe (selbst lösen)

1. Finde einen **3-Way-Handshake** und beschrifte die drei Pakete (Flags/Seq/Ack).
2. Finde den **Verbindungsabbau** (FIN/ACK oder RST) derselben Verbindung.
3. Nutze **Expert Info** / Filter, um **Retransmissions** und **RST** zu finden – was bedeuten sie?
4. Vergleiche eine **UDP-DNS**-Transaktion (Query/Response) mit TCP – wo ist der Unterschied sichtbar?
5. Erkläre, wie man einen **Portscan** schon an den TCP-Flags erkennt (Übung 07-Vorbereitung).

**Ziel:** TCP-Handshake/-Abbau und typische TCP-Probleme sicher im Capture lesen und UDP davon abgrenzen.

## SY0-701 Prüfungsbezug

- **TCP/UDP**, 3-Way-Handshake, Flags, verbindungsorientiert vs. verbindungslos.
- Fehler-/Scan-Indikatoren (RST/Retransmit/SYN-only).
- Begriffe: *TCP handshake*, *flags (SYN/ACK/RST/FIN)*, *retransmission*, *connectionless (UDP)*.
