# Lösung – Übung 02: Discovery & Sniffing

## 1. Umgebungsscan

```bash
sudo airodump-ng wlan0mon
```
```
 BSSID              PWR  CH  ENC  CIPHER AUTH ESSID
 AA:BB:CC:11:22:33  -40   6  WPA2 CCMP   PSK  MeinTestAP
```
Notiere BSSID, CH, ENC deines Test-APs.

## 2. Clients

Unten im airodump zeigt sich der STATION-Bereich:
```
 BSSID              STATION            PWR  Frames
 AA:BB:CC:11:22:33  DE:AD:BE:EF:00:11  -50  120
```
= ein Client (DE:AD:...) ist mit deinem AP verbunden.

## 3. Fokussierter Capture

```bash
sudo airodump-ng --bssid AA:BB:CC:11:22:33 -c 6 -w testcap wlan0mon
```
Schreibt `testcap-01.cap` (Basis für Handshake-Capture, Übung 03).

## 4. Hidden SSID aufdecken

Bei `ESSID = <length: 9>` (versteckt): warte auf einen Client, der sich (neu) verbindet – im **Probe/Assoc-Request** steht der Klartext-Name. Erzwingen per Deauth (Übung 06), damit der Client neu assoziiert:
```bash
sudo aireplay-ng --deauth 3 -a AA:BB:CC:11:22:33 wlan0mon
```
airodump zeigt dann die ESSID.

## 5. Warum schwacher Schutz

- **Hidden SSID:** der Name steckt in Probe/Assoc-Frames der Clients → trivial auslesbar; schützt nur vor Laien.
- **MAC-Filter:** Client-MACs sind im Klartext sichtbar und **spoofbar** (`macchanger`) → kein echter Zugriffsschutz.
→ Echter Schutz = **starke WPA2/WPA3-PSK** bzw. 802.1X, nicht Obscurity.

## Häufige Fehler / Troubleshooting

- **AP nicht zu sehen:** 5-GHz-AP → `--band a`; Signal zu schwach; falscher Adapter.
- **Keine Clients:** erst ein Gerät verbinden; Kanal fixieren (`-c`), sonst Hopping.
- **Capture leer:** Monitor-Interface korrekt? (`iwconfig wlan0mon`).
- **Rechtliches:** nur eigenen AP fokussieren.
