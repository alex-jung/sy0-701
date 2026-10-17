# Übung 05 – Netzwerk-Segmentierung (VLANs, DMZ/IoT/Guest)

**Schwierigkeit: 5/10 · Dauer: ca. 75 Min.**

## Lernziele

- Netzwerk-Segmentierung und ihren Sicherheitsnutzen verstehen
- VLANs/Interfaces in OPNsense anlegen (DMZ, IoT, Guest)
- Inter-VLAN-Regeln nach least-privilege gestalten
- East-West- vs. North-South-Traffic kontrollieren

## Theorie

**Segmentierung** teilt das Netz in getrennte Zonen mit kontrolliertem Übergang → begrenzt **Lateral Movement** (vgl. `post-exploitation-pivoting`) und die **Blast Radius** einer Kompromittierung. Typische Zonen:

- **LAN** (vertrauenswürdige Clients), **DMZ** (von außen erreichbare Server), **IoT** (unsichere Geräte isolieren), **Guest** (nur Internet, kein LAN-Zugriff), **Management**.
- **VLANs** trennen Segmente logisch über einen Trunk (802.1Q); jedes VLAN-Interface bekommt eigene Regeln.

Prinzipien:
- **Default: kein Inter-VLAN-Traffic** – nur explizit erlaubte Flows.
- **Guest/IoT dürfen nicht ins LAN**, IoT oft nur definierte Ziele.
- **East-West** (zwischen Segmenten) bewusst kontrollieren, nicht nur **North-South** (rein/raus).

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Interfaces → Other Types → VLAN | VLANs anlegen |
| Interfaces → Assignments | VLAN als Interface zuweisen |
| Firewall → Rules (je Interface) | Inter-VLAN-Regeln |
| `nmap`/`ping` | Isolation testen |

## Lab-Setup

- OPNsense mit VLAN-fähigem Trunk (bzw. mehrere virtuelle NICs in Proxmox). Test-Hosts in LAN, DMZ/IoT/Guest. Backup.

## Aufgabe (selbst lösen)

1. Lege (mind.) zwei zusätzliche Segmente an (z. B. **IoT** und **Guest**) als VLAN/Interface mit eigenem Subnetz + DHCP.
2. Setze Regeln so, dass **Guest** nur ins Internet darf (kein Zugriff auf LAN/andere Segmente).
3. Erlaube **IoT** nur definierte Flows (z. B. DNS zur Firewall, sonst nichts Richtung LAN).
4. **Teste die Isolation:** von einem Guest/IoT-Host versuche, einen LAN-Host zu erreichen (`ping`/`nmap`) – muss scheitern; Internet muss gehen.
5. Erkläre, wie Segmentierung Lateral Movement begrenzt (Bezug zu Pivoting).

**Ziel:** mehrere isolierte Segmente mit least-privilege-Inter-VLAN-Regeln, deren Isolation du praktisch verifizierst.

## SY0-701 Prüfungsbezug

- **Network segmentation**, **VLANs**, **DMZ/screened subnet**, **Guest/IoT-Isolation**, **Zero Trust**.
- **East-west vs. north-south**; Segmentierung gegen **Lateral Movement**.
- Begriffe: *segmentation/microsegmentation*, *VLAN*, *DMZ*, *east-west traffic*, *least privilege*, *Zero Trust*.
