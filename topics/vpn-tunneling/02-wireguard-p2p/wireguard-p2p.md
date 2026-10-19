# Übung 02 – WireGuard Punkt-zu-Punkt

**Schwierigkeit: 2/10 · Dauer: ca. 55 Min.**

## Lernziele

- Ein WireGuard-Schlüsselpaar erzeugen und einen P2P-Tunnel aufbauen
- Die WireGuard-Konfiguration (Interface/Peer) verstehen
- Den Tunnel prüfen (Handshake, Ping, Traffic)

## Theorie

**WireGuard** ist bewusst minimal: feste moderne Krypto (**Curve25519** für Key Exchange, **ChaCha20-Poly1305** AEAD, BLAKE2s), keine Cipher-Verhandlung → kein Downgrade. Jeder Peer hat ein **Schlüsselpaar**; man trägt gegenseitig den **Public Key** + erlaubte IPs (`AllowedIPs`) ein. Ein Peer „existiert" erst nach dem ersten **Handshake**; danach ist der Tunnel ein normales Netzwerk-Interface (`wg0`) mit einer Tunnel-IP.

Kernfelder: `[Interface]` (eigener PrivateKey, Address, ListenPort) und `[Peer]` (dessen PublicKey, Endpoint, AllowedIPs, optional PresharedKey, PersistentKeepalive). `AllowedIPs` ist zugleich **Routing** (welche Ziele durch den Tunnel) **und** Crypto-Routing (welche Quell-IPs ein Peer senden darf).

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `wg` / `wg-quick` | Keys, Config, Tunnel up/down |
| `ip`/`ping` | Interface/Erreichbarkeit prüfen |

## Lab-Setup

- Zwei Linux-Hosts/VMs (A und B) mit `wireguard-tools`, gegenseitig per IP erreichbar.

## Aufgabe (selbst lösen)

1. Erzeuge auf **beiden** Hosts ein WireGuard-Keypair (`wg genkey`/`pubkey`).
2. Konfiguriere `wg0` auf A (`10.10.0.1/24`) und B (`10.10.0.2/24`) mit jeweils dem Public Key + Endpoint der Gegenseite und passenden `AllowedIPs`.
3. Bringe den Tunnel hoch (`wg-quick up`), prüfe mit `wg show` den **Handshake** und pinge die Tunnel-IP der Gegenseite.
4. Weise mit `tcpdump` nach, dass der Verkehr zwischen den realen IPs **UDP/verschlüsselt** ist (nicht der Klartext-Ping).

**Ziel:** ein funktionierender WireGuard-P2P-Tunnel mit bestätigtem Handshake und Erreichbarkeit über die Tunnel-IPs.

## SY0-701 Prüfungsbezug

- **3.0** moderne VPN-Protokolle, Public-Key-basiert, AEAD, kein Cipher-Downgrade.
- Begriffe: *WireGuard*, *Curve25519/ChaCha20-Poly1305*, *AllowedIPs*, *handshake*, *tunnel interface*.
