# WireGuard (wg / wg-quick)

**Kategorie:** VPN (modern, Public-Key-basiert)

Schlankes, schnelles VPN mit fester moderner Krypto (**Curve25519**, **ChaCha20-Poly1305**, BLAKE2s) – keine Cipher-Verhandlung (kein Downgrade). Jeder Peer hat ein Keypair; `AllowedIPs` dient zugleich als Routing und Crypto-Routing.

```bash
wg genkey | tee priv.key | wg pubkey > pub.key
wg-quick up wg0 ; wg show ; wg-quick down wg0
```

## Wichtige Config/Befehle

| Feld/Befehl | Zweck |
|-------------|-------|
| `[Interface]` PrivateKey/Address/ListenPort | eigener Endpunkt |
| `[Peer]` PublicKey/Endpoint/AllowedIPs | Gegenstelle + Routing |
| `PresharedKey` | zusätzlicher symmetrischer Schutz |
| `PersistentKeepalive` | NAT-Keepalive |
| `wg show` | Handshake/Transfer |

## Hinweise

`AllowedIPs 0.0.0.0/0` = Full-Tunnel, konkrete Subnetze = Split. Kein Handshake → UDP-Port/Endpoint/Keys prüfen. `DNS=` setzen (DNS-Leak). PrivateKey `chmod 600`, nie committen. OPNsense-Plugin `os-wireguard`.

## Verwendet in

vpn-tunneling 02 (P2P), 03 (Remote-Access), 06, 07, 08, 10.
