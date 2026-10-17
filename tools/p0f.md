# p0f

**Kategorie:** Passives OS-Fingerprinting · **Benötigt root:** ja

Erkennt Betriebssysteme und einiges mehr **rein durch Mithören** – p0f sendet selbst **keine** Pakete. Dadurch praktisch nicht nachweisbar (im Gegensatz zu `nmap -O`). Analysiert TCP-SYN-Eigenheiten (Window-Size, Optionen, TTL) des beobachteten Traffics.

```bash
sudo p0f [Optionen]
```

## Wichtigste Optionen

| Option | Bedeutung |
|--------|-----------|
| `-i <iface>` | Interface zum Mithören |
| `-r <datei.pcap>` | vorhandenen Mitschnitt analysieren (statt live) |
| `-p` | Promiscuous-Modus |
| `-o <datei>` | Ergebnisse loggen |
| `-f <datei>` | andere Fingerprint-DB verwenden |
| `-S` | nur Zusammenfassungen |

## Beispiele

```bash
sudo p0f -i eth0                 # live mithören
sudo p0f -r scan.pcap            # pcap auswerten
```

Dann Traffic erzeugen (Ziel baut Verbindung zu dir / du verbindest dich) – p0f gibt u. a. aus:
```
| os  = Linux 2.6.x
| dist = 0 (Hops)
| link = Ethernet
```

## Aktiv vs. passiv (prüfungsrelevant)

- `nmap -O` = **aktiv**: sendet Probes, erzeugt Spuren/Alerts.
- `p0f` = **passiv**: nur Beobachtung, keine eigenen Pakete → leise, aber abhängig von vorhandenem Traffic.

## Verwendet in

Übung 05 (passives OS-Fingerprinting als leise Alternative).
