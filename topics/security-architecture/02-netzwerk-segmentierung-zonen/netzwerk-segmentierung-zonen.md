# Übung 02 – Netz-Segmentierung & Zonen (VLAN/DMZ)

**Schwierigkeit: 2/10 · Dauer: ca. 60 Min.**

## Lernziele

- Netz-Segmentierung und Sicherheitszonen verstehen und entwerfen
- DMZ, Screened Subnet und interne Zonen korrekt platzieren
- Ost-West- vs. Nord-Süd-Verkehr und Mikrosegmentierung einordnen

## Theorie

**Segmentierung** teilt ein Netz in **Zonen** mit kontrollierten Übergängen → begrenzt **Lateral Movement** und Schadensradius (blast radius). Klassische Zonen:

- **Untrusted/WAN** (Internet) ↔ **DMZ / Screened Subnet** (öffentlich erreichbare Dienste) ↔ **Trusted/Internal** (LAN) ↔ **Management** ↔ **Restricted** (sensible Systeme).
- **VLANs** trennen auf Layer 2; Übergänge nur über **Firewall** mit Regeln (Default-Deny).

Begriffe (SY0-701): **Nord-Süd** (Verkehr rein/raus durch den Perimeter) vs. **Ost-West** (Verkehr zwischen internen Systemen). Klassische Firewalls sehen v. a. Nord-Süd; **Mikrosegmentierung** (Zero Trust, Übung 04) kontrolliert auch Ost-West. Weitere: **air gap** (physisch getrennt), **jump host/bastion**, **isolation**. Bezug: `firewall-opnsense` (Umsetzung), `honeypots` (isoliertes VLAN).

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| OPNsense (VLAN/Regeln) | Zonen umsetzen |
| Diagramm | Zonen-Design |

## Lab-Setup

- OPNsense mit mehreren VLANs (LAN, DMZ, Management, Lab/isoliert).

## Aufgabe (selbst lösen)

1. Entwirf ein **Zonen-Modell** für dein Lab (WAN/DMZ/LAN/Management/Restricted) als Diagramm mit erlaubten Übergängen.
2. Platziere 6 Beispiel-Systeme in die richtige Zone (z. B. öffentlicher Webserver, interne DB, OPNsense-Mgmt, Honeypot, Kali, Metasploitable).
3. Definiere die **Firewall-Regeln** zwischen den Zonen (Default-Deny + nur nötige Flüsse).
4. Erkläre Nord-Süd vs. Ost-West und warum ein Jump Host/Bastion fürs Management sinnvoll ist.

**Ziel:** ein durchdachtes Zonen-/Segmentierungsdesign mit begründeten Übergängen und Management-Isolation.

## SY0-701 Prüfungsbezug

- **3.0** segmentation, VLAN, DMZ/screened subnet, zones, east-west/north-south, microsegmentation, jump host, air gap.
- Begriffe: *segmentation/zones*, *DMZ/screened subnet*, *east-west vs. north-south*, *microsegmentation*, *jump host/bastion*, *blast radius*.
