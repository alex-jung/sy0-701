# Lösung – Übung 08: VPN-Härtung

## 1. Härtung (Beispiele)

- **WireGuard:** per Design schon gehärtet (Curve25519, ChaCha20-Poly1305, kein Downgrade) → Fokus auf `AllowedIPs`, PresharedKey (optional, PQ-Hygiene), Firewall.
- **OpenVPN:** `data-ciphers AES-256-GCM` (kein `BF-CBC`!), `auth SHA256`, `tls-version-min 1.2`, `tls-crypt`, `remote-cert-tls server/client`, `reneg-sec` moderat.
- **IPsec:** Phase1/2 nur **AES-256-GCM + SHA2 + DH 19/20**, **IKEv2**, **PFS on**; IKEv1/Aggressive/3DES/MD5/DH2 entfernen.
Dokumentiere vorher/nachher (welche schwachen Proposals raus).

## 2. PFS belegen

- IPsec: Phase-2-Proposal mit PFS-Gruppe → jede Child-SA nutzt frisches DH. `ipsec statusall` zeigt DH-Gruppe.
- WireGuard: Handshake erneuert Session-Keys regelmäßig (~alle 2 min) → alte Keys werfbar.
Nutzen: aufgezeichneter Verkehr bleibt sicher, selbst wenn später ein Langzeitschlüssel geleakt wird.

## 3. Kill Switch (Beispiel nftables, Full-Tunnel-Client)

```bash
# erlaube nur Verkehr übers VPN-Interface + den Handshake zum VPN-Endpoint, sonst drop
sudo nft add table inet killswitch
sudo nft add chain inet killswitch out '{ type filter hook output priority 0; policy drop; }'
sudo nft add rule inet killswitch out oifname "wg0" accept
sudo nft add rule inet killswitch out oifname "lo" accept
sudo nft add rule inet killswitch out ip daddr <vpn-endpoint-ip> udp dport 51820 accept
```
Fällt `wg0` aus, matcht nichts mehr → Verkehr wird gedroppt (fail-closed), kein Leak. (OPNsense: Policy-based Routing + „don't fall back to default route".)

## 4. Auth-Härtung

- Zertifikate statt PSK (OpenVPN/IPsec), `remote-cert-tls`, **CRL** aktiv (Übung 04).
- Remote-Access-Login zusätzlich mit **MFA** (RADIUS/TOTP, Anbindung `authentication`).
- Least-Privilege-Firewall am VPN-Interface.

## Hinweise / Troubleshooting

- Kill Switch zu strikt → auch DNS/Handshake blockiert; VPN-Endpoint + DNS gezielt erlauben.
- OpenVPN: alte `cipher`-Direktive vs. `data-ciphers` (NCP) beachten; keine `BF-CBC`-Fallbacks.
- Nach Härtung Interop testen (ältere Clients fallen evtl. raus – gewollt).
