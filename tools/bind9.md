# bind9 / named

**Kategorie:** DNS-Server (Lab-Ziel) · **Benötigt root:** ja

BIND9 ist der verbreitetste autoritative DNS-Server. In den Übungen wird er **im Lab aufgesetzt**, um einen DNS-Zonentransfer (AXFR) einmal verwundbar und einmal gehärtet zu demonstrieren – also als **Ziel/Studienobjekt**, nicht als Angriffstool.

```bash
sudo apt install bind9 bind9utils
sudo systemctl restart bind9        # bzw. named
```

## Wichtige Dateien

| Datei | Zweck |
|-------|-------|
| `/etc/bind/named.conf.options` | globale Optionen (`listen-on`, `allow-transfer`, Forwarder) |
| `/etc/bind/named.conf.local` | eigene Zonen definieren |
| `/etc/bind/db.<zone>` | Zonendatei (Records) |

## Sicherheitsrelevante Direktiven

| Direktive | Bedeutung |
|-----------|-----------|
| `allow-transfer { any; };` | **verwundbar** – jeder darf AXFR |
| `allow-transfer { <ip>; };` | nur bekannter Secondary darf AXFR (sicher) |
| `allow-transfer { none; };` | AXFR komplett verbieten |
| `allow-query { ... };` | wer darf abfragen |
| `listen-on { any; };` | Interfaces, auf denen gelauscht wird |

## Prüf-/Hilfstools

```bash
named-checkconf                       # Konfig-Syntax prüfen
named-checkzone lab.local /etc/bind/db.lab.local   # Zonendatei prüfen
journalctl -u bind9 -e                # Fehler-Log
```

## Hinweis

AXFR läuft über **TCP/53** (nicht UDP). Dienstname je nach Distro `bind9` oder `named`.

## Verwendet in

reconnaissance 04 (DNS-Zonentransfer, Lab-Ziel).
