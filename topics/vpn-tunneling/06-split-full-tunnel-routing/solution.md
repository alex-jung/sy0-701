# Lösung – Übung 06: Split/Full-Tunnel, Routing & DNS

## 1. Full vs Split (WireGuard-Client)

- **Full Tunnel:** `AllowedIPs = 0.0.0.0/0, ::/0` → Default-Route zeigt auf `wg0`.
- **Split Tunnel:** `AllowedIPs = 192.168.1.0/24, 10.10.0.0/24` → nur Lab-Netze übers VPN.
```bash
ip route                 # Full: default dev wg0 ; Split: nur Lab-Netze via wg0
traceroute 8.8.8.8       # Full: erster Hop = VPN-Gateway ; Split: lokaler Router
traceroute 192.168.1.10  # geht in beiden Fällen durchs VPN
```
(OpenVPN: Full = `redirect-gateway def1`; Split = nur `push "route ..."`.)

## 2. Internes DNS

- WireGuard: `DNS = 192.168.1.53` im `[Interface]`. OpenVPN: `push "dhcp-option DNS 192.168.1.53"`.
```bash
resolvectl status        # DNS des wg0/tun-Interfaces = interner Resolver
dig intern.lab.local     # löst internen Namen auf
```

## 3. DNS-Leak

```bash
# ohne gepushten DNS: Client nutzt alten Resolver
dig +short whoami.akamai.net     # zeigt genutzten Resolver / Leak-Test-Dienste
resolvectl query intern.lab.local  # scheitert -> interne Namen gehen nicht
```
Fix: internen DNS setzen (s. 2); bei Full-Tunnel zusätzlich sicherstellen, dass **kein** Resolver am Tunnel vorbei befragt wird (resolv.conf/systemd-resolved).

## 4. Wann was

- **Full:** sicherheitskritische/verwaltete Clients, zentrale Filterung/Monitoring, DLP.
- **Split:** Performance/Bandbreite, nur interner Zugriff nötig.
- **Risiko Split:** Client gleichzeitig im offenen Internet **und** intern → möglicher Pivot/Dual-homed; daher Endpoint-Hardening + Firewall-Regeln.

## Hinweise / Troubleshooting

- Full-Tunnel ohne korrektes NAT/Route am Gateway → kein Internet mehr (Client „offline").
- `systemd-resolved` kann trotz VPN einen anderen Resolver nutzen → per-link-DNS prüfen.
- Split + interner DNS: `AllowedIPs` muss auch die DNS-IP enthalten, sonst kein Routing zum Resolver.
