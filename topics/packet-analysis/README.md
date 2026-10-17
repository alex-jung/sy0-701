# Thema: Packet Analysis

Praxis-Übungen zur **Paket-/Netzwerkanalyse** mit **Wireshark** und **tshark/tcpdump** – die forensische Lupe des Blue Teams. Von Capture-Grundlagen über Display-Filter, TCP/UDP- und Protokoll-Analyse, Artefakt-Extraktion und Angriffserkennung bis zu verschlüsseltem Traffic, CLI-Analyse und einer vollständigen PCAP-Untersuchung. Ein **Blue-Team-/Defensive-Thema**, das auch die offensiven Themen „von unten" sichtbar macht.

> ⚠️ **Eigenes Lab.** Capturen/Analysieren nur im eigenen Netz/an eigenen Mitschnitten. Paket-Captures enthalten potenziell sensible Daten (Credentials im Klartext!) → verantwortungsvoll behandeln.

## Lernziele

- Traffic sauber capturen (Interfaces, Filter, Umfang)
- Wireshark effizient bedienen (Navigation, Display-Filter, Follow Stream)
- TCP/UDP- und Protokoll-Verhalten lesen (Handshake, DNS, HTTP, TLS)
- Artefakte extrahieren (Dateien, Credentials) und Angriffe im PCAP erkennen
- Verschlüsselten Traffic einordnen; CLI-Analyse mit tshark; eine PCAP-Investigation durchführen

## Abgedeckte SY0-701-Domänen

- **4.0 Security Operations** – Netzwerk-Analyse, Forensik, Erkennung, Monitoring
- **1.0 General Security Concepts** – Protokolle/Ports, OSI, Klartext vs. verschlüsselt
- **2.0 Threats, Vulnerabilities & Mitigations** – Angriffserkennung im Traffic, Klartext-Credentials

## Übungen (Schwierigkeit 1 → 10)

| #  | Übung | Schwierigkeit |
|----|-------|---------------|
| 01 | Capture-Grundlagen (Interfaces, Capture-Filter) | 1/10 |
| 02 | Wireshark-Navigation & Follow Stream | 2/10 |
| 03 | Display-Filter beherrschen | 3/10 |
| 04 | TCP/UDP-Analyse (Handshake, Retransmits, Ports) | 4/10 |
| 05 | Protokoll-Analyse (DNS, HTTP, DHCP, ARP) | 5/10 |
| 06 | Artefakte extrahieren (Dateien, Credentials) | 6/10 |
| 07 | Angriffe im Traffic erkennen (Scans/Exploits/C2) | 7/10 |
| 08 | Verschlüsselter Traffic (TLS, JA3, Metadaten) | 8/10 |
| 09 | CLI-Analyse mit tshark | 9/10 |
| 10 | Vollständige PCAP-Investigation + Report | 10/10 |

## Lab-Voraussetzungen

- **Kali/Analyse-Host** mit **Wireshark** + **tshark**/**tcpdump**
- Zugriff auf relevanten Traffic: eigenes Segment, ein **Mirror/Span**-Port oder selbst erzeugte Captures (Kali ↔ Ziel)
- **Beispiel-PCAPs:** eigene Mitschnitte der Angriffe aus den offensiven Themen (Scan/Exploit/C2) – ideal zum Üben
- Bezug: `network-scanning`, `exploitation-metasploit`, `post-exploitation-pivoting`, `ids-ips`

Reihenfolge: starte bei `01-capture-basics/`. Pro Übung erst die `.md` lösen, dann `solution.md`.
