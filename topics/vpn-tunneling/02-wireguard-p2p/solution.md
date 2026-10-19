# Lösung – Übung 02: WireGuard P2P

## 1. Keys

```bash
sudo apt install -y wireguard-tools
wg genkey | tee priv.key | wg pubkey > pub.key     # auf A und B je einmal
```

## 2. Config

Host A `/etc/wireguard/wg0.conf`:
```ini
[Interface]
Address = 10.10.0.1/24
ListenPort = 51820
PrivateKey = <A-priv>

[Peer]
PublicKey = <B-pub>
Endpoint = <B-real-ip>:51820
AllowedIPs = 10.10.0.2/32
PersistentKeepalive = 25
```
Host B analog (Address `10.10.0.2/24`, Peer = A-pub, Endpoint = A, AllowedIPs `10.10.0.1/32`).

## 3. Up + Handshake

```bash
sudo wg-quick up wg0
sudo wg show         # "latest handshake" + transfer rx/tx
ping 10.10.0.2       # von A -> B (Tunnel-IP)
```

## 4. Traffic prüfen

```bash
sudo tcpdump -ni eth0 udp port 51820    # nur UDP-WireGuard-Pakete, verschlüsselt
# der ICMP-Inhalt ist NICHT im Klartext sichtbar (nur auf wg0 intern)
sudo tcpdump -ni wg0 icmp               # hier sieht man den entschlüsselten Ping
```

## Hinweise / Troubleshooting

- **Kein Handshake:** Endpoint/Port erreichbar? UDP 51820 in Firewall offen? Keys vertauscht?
- `AllowedIPs` zu eng/weit → kein Routing bzw. unerwartetes Routing.
- `PersistentKeepalive` nötig, wenn ein Peer hinter NAT sitzt.
- Keys mit `chmod 600`; niemals den PrivateKey committen.
