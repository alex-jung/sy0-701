# wifite

**Kategorie:** WLAN – automatisiertes Audit

Automatisiert die gängigen WLAN-Angriffe: scannt APs, wählt Ziele und fährt der Reihe nach WPA-Handshake, PMKID, WPS (pixie/PIN) und Deauth – ruft intern aircrack-ng/hcxtools/reaver auf. Gut für einen schnellen Überblick/Assessment.

```bash
sudo wifite [Optionen]
```

## Wichtigste Optionen

| Option | Bedeutung |
|--------|-----------|
| `--kill` | störende Dienste beenden (NetworkManager) |
| `-i <iface>` | Interface |
| `--bssid <BSSID>` / `--essid <name>` | auf ein Ziel beschränken |
| `--wpa` / `--wps` / `--pmkid` | nur bestimmte Angriffe |
| `--dict <liste>` | Wortliste fürs Cracking |
| `-c <kanal>` | Kanal fixieren |

## Beispiele

```bash
sudo wifite --kill
sudo wifite --bssid AA:BB:CC:11:22:33 --wpa --pmkid --dict /usr/share/wordlists/rockyou.txt
```

## Hinweis

**Nur eigenes Test-WLAN** – ohne `--bssid`/`--essid` würde wifite breit angreifen. Für das *Verständnis* sind die Einzeltools (aircrack-ng/hcxtools/reaver) wichtiger; wifite ist der Komfort-Wrapper. Vorinstalliert in Kali.

## Verwendet in

wireless-security 02, 03, 10 (automatisierter Überblick/Assessment).
