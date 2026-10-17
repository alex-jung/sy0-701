# Übung 01 – Capture-Grundlagen

**Schwierigkeit: 1/10 · Dauer: ca. 40 Min.**

## Lernziele

- Sauber capturen: Interface wählen, Umfang begrenzen, speichern
- Capture-Filter (BPF) vs. Display-Filter unterscheiden
- Promiscuous Mode und die Grenzen in geswitchten Netzen verstehen
- Ein PCAP für spätere Analyse erzeugen

## Theorie

**Packet Capturing** liest Pakete von einem Interface. Wichtig von Anfang an:
- **Interface** korrekt wählen (das richtige sieht den relevanten Traffic).
- **Capture-Filter (BPF):** begrenzen **vor** dem Mitschnitt, was gespeichert wird (`host`, `port`, `tcp`) → kleinere, fokussierte Captures. **Anders** als Display-Filter (filtern **nachträglich** die Anzeige, Übung 03).
- **Promiscuous Mode:** die NIC nimmt auch fremde Pakete an – aber in **geswitchten** Netzen sieht man standardmäßig nur eigenen + Broadcast/Multicast-Traffic. Für fremden Traffic braucht man **Mirror/Span-Port**, Tap oder ARP-Position.
- **In .pcap speichern** für Analyse/Weitergabe (Vorsicht: enthält ggf. Klartext-Credentials).

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `tcpdump` | CLI-Capture mit BPF |
| `dumpcap`/Wireshark | GUI-Capture |
| `ip`/`tshark -D` | Interfaces auflisten |

## Lab-Setup

- Kali + ein Ziel zum Traffic-Erzeugen. Für fremden Traffic: Mirror-Port/ARP – im Lab meist eigener Traffic.

## Aufgabe (selbst lösen)

1. Liste die verfügbaren Capture-Interfaces und wähle das richtige.
2. Capture mit **tcpdump** gezielt nur den Traffic zu/von einem Host + Port (BPF-Filter) und speichere in eine `.pcap`.
3. Erzeuge definierten Traffic (z. B. `curl`/`ping`/kleiner Scan) und verifiziere, dass er im Capture ist.
4. Erkläre den Unterschied **Capture-Filter (BPF)** vs. **Display-Filter**.
5. Erkläre, warum du in einem geswitchten Netz standardmäßig **nicht** fremden Traffic siehst.

**Ziel:** ein fokussiertes, gespeichertes PCAP + Verständnis von Interface-Wahl, BPF und den Sichtbarkeitsgrenzen.

## SY0-701 Prüfungsbezug

- **Packet capture**, **BPF-Capture-Filter**, promiscuous mode, **port mirroring/SPAN/tap**.
- Sichtbarkeit in geswitchten Netzen; Captures als sensible Daten.
- Begriffe: *packet capture*, *BPF*, *promiscuous mode*, *SPAN/mirror/tap*, *pcap*.
