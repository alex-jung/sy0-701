# reaver / bully

**Kategorie:** WLAN – WPS-Angriffe · **Benötigt:** Monitor-Mode-Adapter

Greifen die **WPS-PIN** eines APs an. Wegen der Prüfung in zwei Hälften (4+3 Stellen) reduziert sich der Keyspace auf ~11.000 → **Online-Brute-Force**; **Pixie-Dust** (`-K`) nutzt schwache Zufallszahlen für einen **Offline**-Angriff. Erfolg → AP gibt die **WPA-PSK** heraus (PSK-Stärke egal). `bully` ist eine Alternative mit ähnlichem Zweck.

```bash
sudo wash -i wlan0mon                         # WPS-fähige APs finden
sudo reaver -i wlan0mon -b <BSSID> -c <CH> -K 1 -vv   # Pixie-Dust
sudo reaver -i wlan0mon -b <BSSID> -c <CH> -vv        # PIN-Brute-Force
```

## Wichtigste Optionen (reaver)

| Option | Bedeutung |
|--------|-----------|
| `-i <iface>` | Monitor-Interface |
| `-b <BSSID>` | Ziel-AP |
| `-c <CH>` | Kanal |
| `-K 1` | Pixie-Dust-Angriff |
| `-vv` | verbose |
| `--session` | Fortschritt speichern/fortsetzen |
| `-L` / `--lock-delay` | AP-Lockout umgehen/abwarten |

## Hinweis

Nur **eigener** AP. PIN-Brute kann Stunden dauern und APs sperren („WPS locked"); Pixie-Dust ist (bei anfälligen Chipsätzen) in Minuten durch. Gegenmaßnahme: **WPS deaktivieren**. `wash`/`reaver` sind Teil des reaver-Pakets.

## Verwendet in

wireless-security 07 (WPS-Angriffe), 10.
