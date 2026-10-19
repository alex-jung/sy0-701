# Übung 01 – VPN-Grundlagen & Typen

**Schwierigkeit: 1/10 · Dauer: ca. 40 Min.**

## Lernziele

- Zweck und Grundprinzip eines VPN verstehen (Vertraulichkeit/Integrität in-transit)
- VPN-Typen unterscheiden: Remote-Access vs. Site-to-Site
- Protokollfamilien einordnen: IPsec vs. SSL/TLS-VPN vs. WireGuard

## Theorie

Ein **VPN (Virtual Private Network)** baut über ein unsicheres Netz (Internet) einen **verschlüsselten Tunnel** auf → Vertraulichkeit, Integrität und Authentizität des Verkehrs (in-transit), plus „virtuelle" Netz-Zugehörigkeit.

Typen nach Einsatz:
- **Remote-Access VPN:** einzelner Client → Firmen-/Lab-Netz (Home-Office).
- **Site-to-Site VPN:** zwei Netze/Standorte dauerhaft verbunden (Gateway-zu-Gateway).

Protokollfamilien:
- **IPsec** (Layer 3): AH/ESP, IKE (IKEv1/IKEv2) für Key Exchange; Transport- vs. Tunnel-Mode. Standard für Site-to-Site.
- **SSL/TLS-VPN** (z. B. **OpenVPN**): nutzt TLS, oft über UDP/TCP 1194/443 → firewall-freundlich, zertifikatsbasiert.
- **WireGuard:** modernes, schlankes Protokoll (fixe moderne Krypto, Public-Key-basiert, UDP) → einfach, schnell, wenig Code.

Querbegriffe: **Split Tunnel** (nur bestimmter Verkehr durchs VPN) vs. **Full Tunnel** (aller Verkehr), **PFS**, **Kill Switch**.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| (konzeptionell) | Einordnung; später wg/openvpn/ipsec |

## Lab-Setup

- Keines. Optional: Skizze deines Lab-Netzes (OPNsense + Segmente).

## Aufgabe (selbst lösen)

1. Erkläre in eigenen Worten, welche **drei** Schutzziele ein VPN liefert und welche **nicht** (z. B. Endpoint-Sicherheit).
2. Ordne fünf Szenarien als **Remote-Access** oder **Site-to-Site** ein (z. B. Home-Office-Laptop, zwei Rechenzentren, Admin von unterwegs, Zweigstelle, Handy-App).
3. Vergleiche **IPsec**, **OpenVPN** und **WireGuard** in einer Tabelle (Layer, Auth, Firewall-Freundlichkeit, Komplexität).
4. Entscheide begründet, welches Protokoll du im Lab für (a) Remote-Access und (b) Site-to-Site wählst.

**Ziel:** VPN-Typen/Protokolle sicher einordnen und eine begründete Protokollwahl treffen.

## SY0-701 Prüfungsbezug

- **3.0** VPN types, IPsec vs. SSL/TLS VPN, remote access vs. site-to-site, tunnel vs. transport mode.
- Begriffe: *remote-access/site-to-site*, *IPsec (AH/ESP, IKE)*, *SSL/TLS VPN*, *WireGuard*, *split/full tunnel*, *PFS*.
