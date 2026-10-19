# OpenVPN

**Kategorie:** VPN (SSL/TLS, zertifikatsbasiert)

Verbreitetes TLS-VPN: Tunnel über TLS, Auth meist via **PKI** (eigene CA → Server-/Client-Zerts), optional `tls-crypt` + User/Passwort/MFA. Läuft über UDP (performant) oder **TCP 443** (firewall-/proxy-freundlich). TUN (L3) vs. TAP (L2).

```bash
sudo openvpn --config client.ovpn
sudo systemctl start openvpn-server@server
```

## Wichtige Direktiven

| Direktive | Zweck |
|-----------|-------|
| `ca`/`cert`/`key`/`dh` | PKI-Material |
| `data-ciphers AES-256-GCM` | AEAD-Cipher |
| `tls-crypt ta.key` | Kontroll-Kanal schützen (Anti-Scan/DoS) |
| `remote-cert-tls server/client` | Zert-Zweck erzwingen |
| `crl-verify crl.pem` | Widerruf prüfen |
| `redirect-gateway def1` | Full-Tunnel |
| `push "dhcp-option DNS ..."` | DNS an Client |

## Hinweise

PKI mit `easy-rsa`/`openssl` (→ `pki-certificates`). Schwache Fallbacks (`BF-CBC`, TLS1.0) entfernen. `crl-verify` für Revocation nötig. IP-Forwarding + NAT fürs LAN. OPNsense bietet OpenVPN per GUI.

## Verwendet in

vpn-tunneling 04 (Server/Client), 06, 07, 08, 09, 10.
