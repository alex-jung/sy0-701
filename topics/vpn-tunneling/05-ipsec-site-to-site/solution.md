# Lösung – Übung 05: IPsec Site-to-Site

## 1. IKEv2-Tunnel (OPNsense, je Gateway)

- VPN → IPsec → **Tunnel Settings** (oder Connections, neues GUI):
  - **Phase 1:** IKEv2, Remote-Gateway = WAN der Gegenseite, Auth = **PSK** (identisch) oder Zertifikat; Proposal: **AES-256-GCM**, SHA2-256, DH-Group **19/20** (ECP).
  - **Phase 2 (Child SA):** ESP, AES-256-GCM, **PFS Group 19**, Lifetime moderat.

## 2. Traffic Selectors + Firewall

- Phase 2 Local = LAN A `192.168.10.0/24`, Remote = LAN B `192.168.20.0/24` (auf Gateway B spiegelverkehrt).
- Firewall: **WAN** Regel „pass UDP 500 + 4500 + ESP" von der Gegenstelle; **IPsec**-Tab Regel „pass" für die LAN-zu-LAN-Netze.

## 3. SAs prüfen

```bash
# auf OPNsense-Shell / strongSwan:
ipsec statusall        # bzw. swanctl --list-sas
# INSTALLED, TUNNEL, ESP, Phase1 ESTABLISHED, Child-SA up, Bytes i/o steigen
ping -I 192.168.10.1 192.168.20.10   # Verkehr LAN A -> LAN B
```

## 4. ESP nachweisen

```bash
sudo tcpdump -ni <wan-if> esp or udp port 4500
# ESP-Pakete (bzw. UDP 4500 bei NAT-T) zwischen den WAN-IPs; kein Klartext-Inhalt
```

## Hinweise / Troubleshooting

- **Phase 1 up, Phase 2 nicht:** Traffic Selectors/Subnetze stimmen nicht überein (müssen spiegeln).
- **Proposal mismatch:** beide Seiten brauchen identische Algorithmen/DH-Gruppen.
- NAT zwischen den Gateways → **NAT-T (UDP 4500)** nötig.
- Immer **IKEv2** + PFS; IKEv1 Aggressive Mode vermeiden (Übung 09).
