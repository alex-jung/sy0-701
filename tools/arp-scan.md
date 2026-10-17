# arp-scan

**Kategorie:** Host Discovery · **Benötigt root:** ja

Sehr schnelles, zuverlässiges ARP-Scanning im lokalen Netz. Gibt IP, MAC und – über die IEEE-OUI-Datenbank – den **Hersteller** der Netzkarte aus. Weil es auf Layer 2 arbeitet, lässt es sich im Segment nicht per Firewall unterdrücken.

```bash
sudo arp-scan [Optionen] <ziele|--localnet>
```

## Wichtigste Optionen

| Option | Bedeutung |
|--------|-----------|
| `-l` / `--localnet` | gesamtes lokales Netz des Interfaces scannen |
| `-I <iface>` | Interface wählen (z. B. `-I eth0`) |
| `192.168.56.0/24` | explizite Range als Argument |
| `-f <datei>` | Ziel-Liste aus Datei |
| `-g` | keine Duplikate ausgeben |
| `-r <n>` / `--retry` | Anzahl Wiederholungen pro Host |
| `-t <ms>` | Timeout pro Host |
| `--bandwidth <n>` | Sende-Bandbreite begrenzen (leiser) |

## Beispiele

```bash
sudo arp-scan --localnet                 # lokales Netz
sudo arp-scan -I eth0 192.168.56.0/24    # gezielte Range
```

## Beispiel-Ausgabe

```
192.168.56.1    08:00:27:aa:bb:cc   (Unknown)
192.168.56.100  08:00:27:11:22:33   PCS Systemtechnik GmbH
```

## Verwendet in

Übung 01 (Host Discovery).
