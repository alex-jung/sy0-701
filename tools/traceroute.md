# traceroute

**Kategorie:** Netzwerk-Diagnose

Zeigt den **Pfad (Hops)** zum Ziel, indem Pakete mit steigender TTL gesendet werden – jeder Router auf dem Weg meldet sich mit „TTL exceeded". In den Übungen genutzt, um die **OPNsense-Firewall als Zwischen-Hop** sichtbar zu machen.

```bash
traceroute [Optionen] <ziel>
```

## Wichtigste Optionen

| Option | Bedeutung |
|--------|-----------|
| `-n` | keine DNS-Auflösung (schneller) |
| `-I` | ICMP statt UDP verwenden |
| `-T` | TCP-SYN verwenden (`-p` setzt Port; durch Firewalls oft besser) |
| `-p <port>` | Zielport |
| `-m <n>` | maximale Hops (Default 30) |
| `-q <n>` | Anfragen pro Hop |
| `-w <sek>` | Timeout pro Hop |

## Beispiele

```bash
traceroute -n 192.168.20.50          # Standard (UDP)
sudo traceroute -T -p 80 192.168.20.50   # TCP/80, kommt oft durch FWs
```

## Verwandt

- `nmap --traceroute` integriert dasselbe in einen Scan.
- `mtr` kombiniert ping + traceroute live.

## Verwendet in

Übung 09 (Firewall als Hop zwischen Angreifer und Ziel sichtbar machen).
