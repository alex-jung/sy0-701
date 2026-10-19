# Thema: VPN & Tunneling

Praxis-Übungen zu **VPNs und Tunneling**: WireGuard, OpenVPN und IPsec – Punkt-zu-Punkt, Remote-Access und Site-to-Site, inkl. OPNsense-Integration, Split/Full Tunnel, Traffic-Analyse, Härtung (PFS/Cipher) und typischen VPN-Schwächen. Aufbau auf `cryptography-basics` (Key Exchange/PFS, AEAD), `pki-certificates` (Zertifikate für OpenVPN/IPsec) und `firewall-opnsense`.

> ⚠️ **Nur im eigenen Lab / an eigenen VPN-Endpunkten.** Angriffs-/Analyseteile ausschließlich gegen **eigene** Tunnel. Keys/Zerts nie committen (`.gitignore`). Keine Umgehung fremder Netzsperren/Policies.

## Lernziele

- VPN-Typen und -Protokolle unterscheiden (Remote-Access vs. Site-to-Site, SSL/TLS- vs. IPsec-VPN)
- WireGuard, OpenVPN und IPsec praktisch aufsetzen – auch über OPNsense
- Split- vs. Full-Tunnel, Routing und DNS korrekt konfigurieren
- VPN-Traffic analysieren (was ist verschlüsselt, welche Metadaten bleiben)
- VPNs härten (PFS, moderne Cipher, Kill Switch) und Schwächen erkennen

## Abgedeckte SY0-701-Domänen

- **3.0 Security Architecture** – VPN, IPsec, TLS, tunneling, secure remote access, zero trust (Bezug)
- **4.0 Security Operations** – secure access, monitoring, remote access controls
- **1.0 General Security Concepts** – Verschlüsselung in-transit, Key Exchange/PFS (Bezug)

## Übungen (Schwierigkeit 1 → 10)

| #  | Übung | Schwierigkeit |
|----|-------|---------------|
| 01 | VPN-Grundlagen & Typen | 1/10 |
| 02 | WireGuard Punkt-zu-Punkt | 2/10 |
| 03 | WireGuard Remote-Access über OPNsense | 3/10 |
| 04 | OpenVPN Server/Client | 4/10 |
| 05 | IPsec Site-to-Site (IKEv2) | 5/10 |
| 06 | Split- vs. Full-Tunnel, Routing & DNS | 6/10 |
| 07 | VPN-Traffic analysieren | 7/10 |
| 08 | VPN-Härtung: PFS, Cipher, Kill Switch | 8/10 |
| 09 | VPN-Angriffe & Schwächen | 9/10 |
| 10 | Capstone: sicheres Remote-Access-VPN + Review | 10/10 |

## Lab-Voraussetzungen

- OPNsense (VPN-Gateway), Kali/Linux als Client/Analyse, ein „internes" Ziel hinter dem VPN
- Tools: `wireguard`/`wg`, `openvpn`, `strongswan`/`ipsec` (bzw. OPNsense-GUI), `tcpdump`/`wireshark`
- `openssl`/eigene CA (aus `pki-certificates`) für OpenVPN-/IPsec-Zertifikate
- Zwei Netze/Segmente für Site-to-Site (Übung 05) – in Proxmox simulierbar

Reihenfolge: starte bei `01-vpn-grundlagen-typen/`. Pro Übung erst die `.md` lösen, dann `solution.md`.
