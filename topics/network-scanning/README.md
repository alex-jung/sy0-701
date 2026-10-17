# Thema: Network Scanning

Praxis-Übungen zu **Network Scanning / Reconnaissance** für die CompTIA Security+ SY0-701 und allgemeine Pentest-Praxis. Du arbeitest dich von einfachem Host Discovery bis zur vollständigen Netz-Enumeration durch eine segmentierte Firewall vor.

> ⚠️ **Nur im eigenen, isolierten Lab.** Alle Scans laufen ausschließlich gegen deine eigenen Lab-Ziele (Metasploitable, DVWA, OPNsense). Scanning fremder Netze ist illegal.

## Lernziele

- Host Discovery auf Layer 2 und Layer 3 verstehen und anwenden
- Die wichtigsten nmap-Scan-Typen und ihre Unterschiede kennen (Connect, SYN, UDP)
- Port-States interpretieren (`open`, `closed`, `filtered`)
- Service-/Version-Detection, OS-Fingerprinting und NSE einsetzen
- Firewall-/IDS-Evasion-Techniken verstehen (und ihre Grenzen)
- Durch eine segmentierte OPNsense-Firewall scannen und Ergebnisse dokumentieren

## Abgedeckte SY0-701-Domänen

- **1.0 General Security Concepts** – Ports/Protokolle, Begriffe
- **2.0 Threats, Vulnerabilities & Mitigations** – Reconnaissance/Scanning als Angriffsphase, Attack Surface
- **4.0 Security Operations** – Vulnerability-/Port-Scanning, Discovery, IDS/IPS, Log-/Alert-Erkennung von Scans

## Übungen (Schwierigkeit 1 → 10)

| #  | Übung | Schwierigkeit |
|----|-------|---------------|
| 01 | Host Discovery / Ping Sweep | 1/10 |
| 02 | TCP Connect Scan – Basics | 2/10 |
| 03 | SYN / Stealth Scan & Port States | 3/10 |
| 04 | Service- & Version-Detection | 4/10 |
| 05 | OS Fingerprinting | 5/10 |
| 06 | UDP Scanning | 6/10 |
| 07 | NSE – Nmap Scripting Engine | 7/10 |
| 08 | Firewall-/IDS-Evasion (Timing, Fragmentation, Decoys) | 8/10 |
| 09 | Scannen durch die OPNsense-Firewall / segmentierte Netze | 9/10 |
| 10 | Vollständige Netz-Enumeration mit Reporting | 10/10 |

## Lab-Voraussetzungen

- **Kali Linux** (Angreifer) – Tools: `nmap`, `netdiscover`, `arp-scan`, `masscan`, `tcpdump`/`wireshark`
- **Metasploitable 2/3** (Linux-Ziel, viele offene Ports/Dienste)
- **DVWA** (Web-Ziel; kann auf Metasploitable oder eigener VM laufen)
- **OPNsense** als Firewall/Router zwischen den Segmenten (spätestens ab Übung 09)
- Empfohlene Netz-Topologie: ein isoliertes Lab-Netz (z. B. `vmbr1` in Proxmox), Kali und Ziele im selben Segment für Übung 01–08; ab 09 Ziele hinter einem separaten OPNsense-Interface.

Starte mit `01-host-discovery/` und arbeite dich der Reihe nach vor. Pro Übung erst die `.md` lösen, dann `solution.md` öffnen.
