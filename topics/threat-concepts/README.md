# Thema: Threat Concepts

Analyse-/Konzept-Übungen zu **Bedrohungen** (SY0-701-Domäne 2.0): Threat Actors & Motivationen, Attack Surface & Threat Vectors, Social Engineering, Malware-Typen, Vulnerability-Typen, Indicators of Compromise, MITRE ATT&CK/TTPs, Threat Intelligence, Threat Hunting & Pyramid of Pain. Dies ist das **konzeptionelle Dach** über den offensiven Themen (`reconnaissance` … `malware-analysis`) – hier werden die Begriffe geordnet, modelliert und in Threat Intelligence/Detection überführt.

> ℹ️ **Konzept/Analyse mit Lab-Bezug.** Praktische Nachweise (IOCs, ATT&CK-Mapping, Hunts) nutzen deine bestehenden Lab-Daten (Honeypot, SIEM, Captures) und richten sich nur gegen **eigene** Systeme.

## Lernziele

- Threat Actors nach Typ/Attributen/Motivation unterscheiden
- Attack Surface und Threat Vectors systematisch erfassen
- Malware- und Vulnerability-Typen sicher einordnen
- IOCs erkennen und von TTPs abgrenzen
- MITRE ATT&CK, Threat Intelligence und Threat Hunting anwenden (Pyramid of Pain)

## Abgedeckte SY0-701-Domänen

- **2.0 Threats, Vulnerabilities & Mitigations** – threat actors, vectors, attack surface, malware, vulnerabilities, indicators
- **4.0 Security Operations** – threat intelligence, hunting, IOC/TTP, MITRE ATT&CK
- **1.0 General Security Concepts** – Bezug zu Controls/Mitigations

## Übungen (Schwierigkeit 1 → 10)

| #  | Übung | Schwierigkeit |
|----|-------|---------------|
| 01 | Threat Actors & Motivationen | 1/10 |
| 02 | Attack Surface & Threat Vectors | 2/10 |
| 03 | Social Engineering & Human Vectors | 3/10 |
| 04 | Malware-Threat-Typen | 4/10 |
| 05 | Vulnerability-Typen | 5/10 |
| 06 | Indicators of Compromise (IOCs) | 6/10 |
| 07 | MITRE ATT&CK & TTPs | 7/10 |
| 08 | Threat Intelligence & Sources | 8/10 |
| 09 | Threat Hunting & Pyramid of Pain | 9/10 |
| 10 | Capstone: Threat Assessment / Threat Model | 10/10 |

## Lab-Voraussetzungen

- Keine neuen Tools. Genutzt werden vorhandene Daten/Tools: Honeypot-/SIEM-/PCAP-Daten (`honeypots`/`logging-siem`/`packet-analysis`), `suricata`/`wazuh`/`yara`, `jq`
- Referenzen: **MITRE ATT&CK**, **Cyber Kill Chain (Lockheed Martin)**, **Diamond Model**, **STIX/TAXII**, **Pyramid of Pain**, **CVE/CVSS**, **CISA/OSINT-Feeds**
- Als Kontext dient dein Lab (Assets/Angriffsflächen) sowie Daten aus den offensiven/Blue-Team-Themen

Reihenfolge: starte bei `01-threat-actors-motivationen/`. Pro Übung erst die `.md` lösen, dann `solution.md`.
