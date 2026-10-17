# Übung 10 – Vollständige PCAP-Investigation + Report

**Schwierigkeit: 10/10 · Dauer: ca. 2–3 Std.**

## Lernziele

- Eine vollständige, methodische PCAP-Untersuchung durchführen
- Vom Überblick zur Angriffskette (Timeline) und zu IoCs kommen
- Befunde belegen (Pakete/Streams) und reproduzierbar dokumentieren
- Ergebnisse mit IDS/SIEM/IR verknüpfen

## Theorie

Eine **PCAP-Investigation** folgt einem Prozess (nicht wildes Klicken):
1. **Überblick:** Zeitraum, Statistics (Protocol Hierarchy, Conversations, Endpoints) → was/wer dominiert?
2. **Scoping:** verdächtige Hosts/Flows eingrenzen (Display-Filter/tshark).
3. **Analyse je Phase:** Scan → Exploit → C2 → Exfil (Übung 07), Protokolle (Übung 05), TLS-Metadaten (Übung 08).
4. **Artefakte:** Dateien/Credentials extrahieren (Übung 06).
5. **Timeline + IoCs:** Angriffskette rekonstruieren, IoCs sammeln (IP/Domain/JA3/Hash).
6. **Report:** Befunde mit Paketnummern/Streams belegen, reproduzierbar (tshark-Befehle), Empfehlungen.

Das ist Netzwerk-Forensik: aus Ground-Truth-Traffic eine belastbare Geschichte machen – und sie an **IDS-Regeln** (`ids-ips`) / **SIEM** (`logging-siem`) / **IR** anschließen.

## Verwendete Tools

Kombination aus Übung 01–09: Wireshark (Statistics/Filter/Follow/Export), tshark, JA3/TLS + `pcap-investigation-template.md`.

## Lab-Setup

- Ein möglichst „reiches" PCAP: eigener Mitschnitt einer mehrstufigen Attacke (Scan → Exploit → Shell → C2/Exfil) aus den offensiven Themen. Wireshark + tshark.

## Aufgabe (selbst lösen)

Untersuche ein PCAP wie einen echten Vorfall.

1. **Überblick:** Zeitraum, Top-Protokolle, Top-Conversations/Endpoints – erste Hypothese.
2. **Scoping:** die verdächtigen Hosts/Flows eingrenzen.
3. **Analyse:** identifiziere die Angriffsphasen (Scan/Exploit/C2/Exfil) und belege sie mit Paketen/Streams.
4. **Artefakte & IoCs:** extrahiere Dateien/Credentials (falls Klartext), sammle IoCs (inkl. JA3/SNI bei TLS).
5. **Timeline + Report:** fülle `pcap-investigation-template.md` – Timeline der Kette, IoCs, Befunde mit Nachweis, Empfehlungen + abgeleitete Detection-Regeln.

**Ziel:** eine vollständige, belegte PCAP-Investigation mit Timeline, IoCs und einem reproduzierbaren Report – das Gesamtprodukt des Themas.

## SY0-701 Prüfungsbezug

- **Netzwerk-Forensik / Investigation**, Timeline, **IoCs**, Chain-of-Custody-Denke (reproduzierbar/belegt).
- Anbindung an **Detection (IDS/SIEM)** und **Incident Response**.
- Begriffe: *network forensics*, *timeline*, *IoC*, *evidence/reproducibility*, *detection engineering*.
