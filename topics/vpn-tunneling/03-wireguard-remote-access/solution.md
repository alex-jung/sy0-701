# Lösung – Übung 03: WireGuard Remote-Access (OPNsense)

## 1. Server-Instance (OPNsense)

- Plugin installieren: System → Firmware → `os-wireguard`.
- VPN → WireGuard → **Instances**: Tunnel-Address `10.10.0.1/24`, Listen Port `51820`, Keypair generieren.

## 2. Client-Peer

- VPN → WireGuard → **Peers**: Public Key des Clients, **Allowed IPs** `10.10.0.2/32`.
- Client-Config (Beispiel):
```ini
[Interface]
PrivateKey = <client-priv>
Address = 10.10.0.2/32
DNS = <opnsense-lan-ip>
[Peer]
PublicKey = <opnsense-pub>
Endpoint = <wan-ip-or-ddns>:51820
AllowedIPs = 192.168.1.0/24, 10.10.0.0/24   # Split-Tunnel: nur Lab-Netze
PersistentKeepalive = 25
```
- WireGuard auf OPNsense **enable**; Interface zuweisen (Interfaces → Assignments) für Firewall-Regeln.

## 3. Firewall/NAT

- **WAN:** Regel „pass UDP to WireGuard port 51820".
- **WireGuard-Interface:** pass von `10.10.0.0/24` **nur** zum erlaubten LAN-Ziel (Least Privilege), Rest block.
- Outbound-NAT i. d. R. automatisch; bei Bedarf Route/NAT fürs Tunnel-Netz prüfen.

## 4. Test

```bash
sudo wg-quick up client   # bzw. App/QR
ping 192.168.1.10         # LAN-Ziel durch den Tunnel
```
OPNsense: VPN → WireGuard → Handshakes zeigt „latest handshake" + Transfer.

## Hinweise / Troubleshooting

- **Handshake ok, aber kein LAN:** Firewall-Regel am WG-Interface fehlt oder Routing/NAT.
- **Kein Handshake:** WAN-Regel/Port? DynDNS/Endpoint korrekt? Doppel-NAT beim ISP?
- `DNS =` am Client setzen, sonst DNS-Leak/Namensauflösung über falschen Resolver (Übung 06/09).
