# proxychains

**Kategorie:** Pivoting / Tunneling

Zwingt beliebige TCP-Tools durch einen oder mehrere **Proxys** (SOCKS4/5, HTTP). In den Übungen genutzt, um nach einem SSH-SOCKS-Proxy ein Zielsegment „von innen" zu scannen (Lateral Movement / Pivoting).

> Auf Kali meist `proxychains4` / `proxychains-ng`. Konfiguration: `/etc/proxychains4.conf` (oder `/etc/proxychains.conf`).

```bash
proxychains <befehl>        # z. B. proxychains nmap -sT -Pn 192.168.20.0/24
```

## Konfiguration (Auszug `/etc/proxychains4.conf`)

```
# Ketten-Modus (einen wählen):
strict_chain        # alle Proxys in Reihenfolge
dynamic_chain       # überspringt tote Proxys
# random_chain

proxy_dns           # DNS über den Proxy (verhindert DNS-Leak)

[ProxyList]
socks5  127.0.0.1 1080      # z. B. SSH -D 1080
```

## Wichtige Punkte

| Thema | Hinweis |
|-------|---------|
| Nur **TCP** | SOCKS kann kein ICMP/Raw → nur `nmap -sT` + `-Pn` |
| Discovery | kein ARP/Ping über Proxy → immer `-Pn`, besser Ports direkt |
| DNS | `proxy_dns` aktivieren **oder** nmap mit `-n` betreiben |
| Geschwindigkeit | deutlich langsamer; Portauswahl eingrenzen |

## Beispiel-Workflow (mit SSH-Pivot)

```bash
ssh -D 1080 -N user@192.168.20.10          # SOCKS-Proxy im Zielsegment
# proxychains4.conf: socks5 127.0.0.1 1080
proxychains nmap -sT -Pn -n -p 1-1000 192.168.20.0/24
```

## Verwendet in

Übung 09 (Scannen durch die Firewall via Pivot).
