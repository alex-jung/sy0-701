# Thema: Firewall mit OPNsense

Praxis-Übungen zur **Firewall- und Netzwerk-Perimeter-Sicherheit** mit **OPNsense** – deiner Lab-Firewall. Von der sicheren Erstkonfiguration über stateful Regelwerke, NAT und Segmentierung bis zu Logging, GeoIP/Blocklists, High Availability und einem Regelwerk-Review. Dies ist ein **Blue-Team-/Defensive-Thema** – die „Gegenseite" zu den offensiven Themen (`network-scanning`, `post-exploitation-pivoting`).

> ⚠️ **Eigenes Lab.** Alle Änderungen an der Firewall-Konfiguration am eigenen OPNsense-Lab durchführen. Fehlkonfigurationen können dich **aussperren** → Konfig vorher sichern (Übung 09) und die Anti-Lockout-Regel kennen.

## Lernziele

- OPNsense sicher einrichten und das stateful Firewall-Modell verstehen
- Strukturierte Regelwerke bauen (default-deny, Aliases, Reihenfolge)
- NAT (Port Forward, Outbound) korrekt konfigurieren
- Netze segmentieren (VLANs, DMZ/IoT/Guest) und Inter-VLAN-Regeln setzen
- Logging/GeoIP/Blocklists/DNS-Filtering nutzen und das Regelwerk auditieren

## Abgedeckte SY0-701-Domänen

- **3.0 Security Architecture** – Firewalls, Segmentierung, Zonen/DMZ, Secure Network Design, HA
- **4.0 Security Operations** – Firewall-Regeln/ACLs, Logging/Monitoring, Hardening
- **1.0 General Security Concepts** – stateful vs. stateless, Ports/Protokolle

## Übungen (Schwierigkeit 1 → 10)

| #  | Übung | Schwierigkeit |
|----|-------|---------------|
| 01 | OPNsense-Grundlagen & sichere Erstkonfiguration | 1/10 |
| 02 | Stateful Firewall-Regeln (default-deny, Reihenfolge) | 2/10 |
| 03 | Aliases & strukturiertes Regelwerk | 3/10 |
| 04 | NAT: Port Forwarding & Outbound NAT | 4/10 |
| 05 | Netzwerk-Segmentierung (VLANs, DMZ/IoT/Guest) | 5/10 |
| 06 | Firewall-Logging & Traffic-Analyse | 6/10 |
| 07 | Floating Rules, Schedules & Traffic Shaping | 7/10 |
| 08 | GeoIP, Blocklists & DNS-Filtering (Unbound) | 8/10 |
| 09 | High Availability (CARP) & Config-Backup/Hardening | 9/10 |
| 10 | Firewall-Assessment & Rule-Review + Report | 10/10 |

## Lab-Voraussetzungen

- **OPNsense-VM** in Proxmox mit mindestens zwei Interfaces (WAN + LAN); für Segmentierung zusätzliche (V)LAN-Interfaces
- **Kali** (zum Testen der Regeln von „außen"/anderen Segmenten – `nmap`, `tcpdump`)
- Ein paar **interne Test-Hosts** (Metasploitable/eigene VMs) in verschiedenen Segmenten
- Zugriff auf die OPNsense-Weboberfläche; **Konfig-Backup** vor Änderungen
- Bezug: `network-scanning` (Übung 09, Scannen durch die Firewall) und `post-exploitation-pivoting`

Reihenfolge: starte bei `01-opnsense-basics/`. Pro Übung erst die `.md` lösen, dann `solution.md`.
