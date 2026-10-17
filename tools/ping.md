# ping

**Kategorie:** Netzwerk-Diagnose

Sendet ICMP Echo Requests und misst Erreichbarkeit + Latenz. In den Übungen zusätzlich wichtig, um die **TTL** abzulesen (grober OS-Hinweis).

```bash
ping [Optionen] <ziel>
```

## Wichtigste Optionen

| Option | Bedeutung |
|--------|-----------|
| `-c <n>` | nur n Pakete senden (z. B. `-c1`) |
| `-i <sek>` | Intervall zwischen Paketen |
| `-W <sek>` | Timeout pro Antwort |
| `-s <bytes>` | Payload-Größe (z. B. Fragmentierung testen) |
| `-t <ttl>` | ausgehende TTL setzen |
| `-D` | Zeitstempel ausgeben |
| `-f` | Flood (nur root; Lab/DoS-Test – vorsichtig) |

## TTL als OS-Indikator

```bash
ping -c1 192.168.56.100     # -> ttl=64
```

| TTL (initial) | wahrscheinliches OS |
|---------------|---------------------|
| 64 | Linux/Unix/macOS |
| 128 | Windows |
| 255 | viele Router/Netzgeräte |

> Die angezeigte TTL ist bereits um die Anzahl Hops reduziert (61 ≈ 64 − 3 Router).

## Hinweis

Viele Hosts/Firewalls **blocken ICMP** – „keine Antwort" heißt nicht zwingend „Host down" (siehe `nmap -Pn`).

## Verwendet in

Übung 05 (OS-Fingerprinting via TTL), allgemein zur Erreichbarkeitsprüfung.
