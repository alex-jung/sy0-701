# Lösung – Übung 01: Monitor Mode

## 1. Adapter identifizieren

```bash
iw dev                 # listet Interfaces + type (managed)
iwconfig               # zeigt wlan0 ... Mode:Managed
ip link                # Interface-Namen
```

## 2. Monitor Mode

```bash
sudo airmon-ng check kill         # NetworkManager/wpa_supplicant beenden
sudo airmon-ng start wlan0        # -> wlan0mon (Monitor)
iwconfig wlan0mon                 # Mode:Monitor
```
(Manuell: `ip link set wlan0 down; iw wlan0 set monitor control; ip link set wlan0 up`.)

## 3. Injection-Test

```bash
sudo aireplay-ng --test wlan0mon
```
```
... Injection is working!
... Found N APs
```

## 4. Managed vs. Monitor

- **Managed:** Karte ist mit einem AP assoziiert, empfängt nur eigene Frames → normaler Betrieb.
- **Monitor:** Karte lauscht **passiv alle** Frames auf einem Kanal, ohne Assoziation; mit Injection kann sie auch Frames senden (Deauth, Fake-Auth). Nötig für Capture/Attacks/Analyse.

## 5. Frame-Typen

- **Management:** Beacon (AP kündigt sich an), Probe Request/Response, Auth/Assoc, **Deauth**.
- **Control:** ACK, RTS/CTS (Medienzugriff).
- **Data:** die eigentlichen Nutzdaten.

## Härtung (Kontext)

Monitor Mode ist Adapter-/Angreifer-seitig – schützen kann man sich nicht „dagegen", aber die Folge-Angriffe adressiert man mit **starker PSK/WPA3**, **802.11w (PMF)** gegen Deauth, WIDS/WIPS zur Erkennung.

## Häufige Fehler / Troubleshooting

- **Kein Monitor-Mode möglich:** Chipsatz ungeeignet → Adapter mit AR9271/RT3070/RT5370/RTL8812AU nutzen.
- **Adapter in VM nicht sichtbar:** USB an die Kali-VM durchreichen (Proxmox/VirtualBox USB-Passthrough).
- **„SIOCSIFFLAGS: Operation not possible":** `airmon-ng check kill` vergessen.
- **Injection „failed":** zu weit vom AP / falscher Kanal / Treiber ohne Injection.
