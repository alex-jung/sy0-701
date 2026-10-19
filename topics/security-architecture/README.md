# Thema: Security Architecture

Analyse-/Design-Übungen zur **Security Architecture** (SY0-701-Domäne 3.0): Architektur-Modelle, Netz-Segmentierung/Zonen, Defense-in-Depth-Platzierung von Controls, **Zero Trust**, hochverfügbare/sichere Netz-Designs, Cloud-Architektur & Shared Responsibility, **SASE/SD-WAN**, sichere Protokolle und Resilience/Recovery. Du entwirfst und bewertest Architekturen – mit dem eigenen Lab (Proxmox/OPNsense/VLANs) als Spielwiese. Verbindet `firewall-opnsense`, `vpn-tunneling`, `security-controls` und `risk-management`.

> ℹ️ **Design/Architektur mit Lab-Bezug.** Fokus auf Diagramme, Zonen, Platzierung, Trade-offs. Praktische Teile (VLANs/Regeln) laufen nur im eigenen Lab.

## Lernziele

- Architektur-Modelle und Platzierung von Controls verstehen
- Netze segmentieren (VLAN/DMZ/Zonen) und Zero-Trust-Prinzipien anwenden
- Sichere, hochverfügbare Netz-Designs entwerfen (HA, redundanz, failure modes)
- Cloud-Architektur und Shared Responsibility einordnen
- SASE/SD-WAN und sichere Protokolle auswählen
- Resilience/Recovery (Backup, Redundanz, Standorte) architektonisch verankern

## Abgedeckte SY0-701-Domänen

- **3.0 Security Architecture** – architecture models, segmentation, zero trust, secure network design, cloud, SASE, resilience, secure protocols
- **1.0 General Security Concepts** – defense in depth, zero trust components (Bezug)
- **5.0/4.0** – resilience/continuity, control placement (Bezug)

## Übungen (Schwierigkeit 1 → 10)

| #  | Übung | Schwierigkeit |
|----|-------|---------------|
| 01 | Architektur-Modelle & Grundlagen | 1/10 |
| 02 | Netz-Segmentierung & Zonen (VLAN/DMZ) | 2/10 |
| 03 | Defense in Depth & Control-Platzierung | 3/10 |
| 04 | Zero Trust (ZTA) | 4/10 |
| 05 | Secure Network Designs & High Availability | 5/10 |
| 06 | Cloud-Architektur & Shared Responsibility | 6/10 |
| 07 | SASE, SD-WAN & Secure Access | 7/10 |
| 08 | Secure Protocols & Design-Entscheidungen | 8/10 |
| 09 | Resilience & Recovery-Architektur | 9/10 |
| 10 | Capstone: Architektur-Review & Zielbild | 10/10 |

## Lab-Voraussetzungen

- Dein Lab: Proxmox, OPNsense (VLANs/Zonen/HA/CARP), Kali, Ziel-VMs; Diagramm-Tool (draw.io/Markdown)
- Referenzen: **NIST SP 800-207 (Zero Trust)**, **CSA/Cloud Shared Responsibility**, **SASE/SD-WAN**, **NIST CSF**, Secure-Protocol-Listen
- Querbezug: `firewall-opnsense`, `vpn-tunneling`, `ids-ips`, `security-controls`

Reihenfolge: starte bei `01-architektur-modelle-grundlagen/`. Pro Übung erst die `.md` lösen, dann `solution.md`.
