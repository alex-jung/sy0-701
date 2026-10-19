# Übung 05 – IPsec Site-to-Site (IKEv2)

**Schwierigkeit: 5/10 · Dauer: ca. 90 Min.**

## Lernziele

- IPsec-Grundlagen verstehen (IKE, ESP, Phase 1/2, Tunnel-Mode)
- Einen Site-to-Site-Tunnel zwischen zwei Gateways aufbauen
- SAs/Policies prüfen und den Tunnel verifizieren

## Theorie

**IPsec** sichert IP-Verkehr auf **Layer 3**. Bausteine:
- **IKE (Internet Key Exchange, v2):** authentisiert die Gateways (PSK oder Zertifikate) und handelt Schlüssel aus.
  - **Phase 1 (IKE SA):** sicherer Kanal zwischen den Gateways (DH → Shared Secret, Auth).
  - **Phase 2 (Child/IPsec SA):** die eigentlichen Daten-SAs (welche Netze, welche Krypto).
- **ESP (Encapsulating Security Payload):** verschlüsselt+authentisiert die Nutzdaten (AH nur Integrität, selten).
- **Tunnel-Mode** (ganzes IP-Paket gekapselt, Gateway-zu-Gateway) vs. **Transport-Mode** (nur Payload, Host-zu-Host).

Bei **Site-to-Site** verbinden zwei Gateways (OPNsense) ihre LANs: definiert über **Traffic Selectors** (lokales/entferntes Subnetz). Sicherheitsrelevant: **IKEv2** statt v1, **kein Aggressive Mode**, **PFS** (DH-Gruppe in Phase 2), starke Proposals (AES-GCM, SHA-2, DH 19/20/21).

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| OPNsense IPsec (strongSwan) | Tunnel per GUI |
| `swanctl`/`ipsec statusall` | SAs/Status prüfen |
| `tcpdump` | ESP/UDP4500 beobachten |

## Lab-Setup

- Zwei OPNsense-Instanzen (oder strongSwan-Hosts) als Gateways A/B, je ein LAN dahinter, über ein „WAN"-Segment verbunden (in Proxmox simulierbar).

## Aufgabe (selbst lösen)

1. Konfiguriere auf beiden Gateways einen **IKEv2**-Site-to-Site-Tunnel (PSK oder Zert), Phase 1 + Phase 2 mit starken Proposals und **PFS**.
2. Definiere die **Traffic Selectors** (LAN A ↔ LAN B) und setze die nötigen Firewall-Regeln für IPsec.
3. Erzeuge Verkehr von LAN A zu LAN B und prüfe die aufgebauten **SAs** (`ipsec statusall`/GUI).
4. Weise mit `tcpdump` nach, dass der Verkehr als **ESP/UDP 4500** (NAT-T) verschlüsselt läuft.

**Ziel:** ein funktionierender IKEv2-Site-to-Site-Tunnel mit aktiven Phase-1/2-SAs und nachgewiesener ESP-Verschlüsselung zwischen den LANs.

## SY0-701 Prüfungsbezug

- **3.0** IPsec, IKE(v2), ESP/AH, Phase 1/2, tunnel vs. transport mode, PFS; site-to-site VPN.
- Fallen: IKEv1 Aggressive Mode (schwach), AH ohne Verschlüsselung, fehlendes PFS.
- Begriffe: *IPsec*, *IKEv2*, *ESP/AH*, *SA*, *traffic selector*, *tunnel/transport mode*, *PFS*, *NAT-T (UDP4500)*.
