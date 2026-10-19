# Lösung – Übung 01: VPN-Grundlagen & Typen

## 1. Schutzziele

VPN liefert für den **Verkehr im Tunnel**: **Confidentiality** (Verschlüsselung), **Integrity** (Manipulationsschutz/MAC) und **Authentication** (der Endpunkte). **Nicht** gelöst: Sicherheit der Endgeräte selbst (kompromittierter Client sendet weiter), Anwendungssicherheit, Zugriffs-Autorisierung im Zielnetz (dafür Firewall/NAC/Zero Trust), Schutz der Metadaten (dass/wie viel kommuniziert wird).

## 2. Szenarien

| Szenario | Typ |
|----------|-----|
| Home-Office-Laptop ins Firmennetz | Remote-Access |
| Zwei Rechenzentren dauerhaft verbunden | Site-to-Site |
| Admin von unterwegs auf Server | Remote-Access |
| Zweigstelle ↔ Zentrale | Site-to-Site |
| Handy-VPN-App ins Lab | Remote-Access |

## 3. Vergleich

| | IPsec | OpenVPN | WireGuard |
|---|-------|---------|-----------|
| Layer | 3 (ESP/AH) | TLS (über UDP/TCP) | über UDP |
| Auth | PSK oder Zertifikate (IKE) | Zertifikate (PKI) | Public Keys |
| Firewall-freundlich | mittel (ESP/UDP500/4500) | hoch (443/UDP/TCP) | hoch (1 UDP-Port) |
| Komplexität | hoch | mittel | niedrig |
| Einsatz | Site-to-Site, Standard | Remote-Access | beides, modern/schnell |

## 4. Wahl (Beispiel)

- **Remote-Access:** **WireGuard** (einfach, schnell, mobil) oder OpenVPN (443, sehr firewall-freundlich).
- **Site-to-Site:** **IPsec/IKEv2** (interoperabel, Standard zwischen Gateways) – im reinen Linux-Lab auch WireGuard.

## Hinweise / Troubleshooting

- „VPN = anonym" ist ein Mythos: der VPN-Betreiber sieht den Verkehr am Austritt; VPN ≠ Tor.
- Tunnel-Mode (ganzes Paket) vs. Transport-Mode (nur Payload) ist ein klassisches IPsec-Prüfungsdetail.
