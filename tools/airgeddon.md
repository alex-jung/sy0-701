# airgeddon

**Kategorie:** WLAN – All-in-one-Menü (inkl. Evil Twin)

Menügeführtes Bash-Framework, das die gängigen WLAN-Angriffe bündelt: Monitor-Mode, Scan, Handshake/PMKID, WPS, **Evil Twin + Captive Portal**, Enterprise (hostapd-wpe), WPA3-Checks. Ruft intern aircrack-ng, hcxtools, reaver, hostapd, dnsmasq usw. auf.

```bash
sudo airgeddon
```

## Funktionsbereiche (Menü)

| Bereich | Inhalt |
|---------|--------|
| Interface/Monitor | Adapter in Monitor-Mode setzen |
| DoS attacks | Deauth/DoS |
| Handshake/PMKID | capturen + an Cracker übergeben |
| Offline WPA/WPA2 decrypt | aircrack/hashcat |
| WPS attacks | reaver/bully/pixie |
| **Evil Twin attacks** | Rogue AP + Captive Portal + Deauth |
| Enterprise | hostapd-wpe (MSCHAPv2 abgreifen) |

## Hinweis

Komfortabel fürs Lernen, weil der Workflow geführt ist; versteht man die Einzeltools (aircrack-ng/hcxtools/reaver), ist airgeddon nur die Hülle. **Nur eigenes Test-WLAN**; Evil-Twin-/Enterprise-Module sind intrusiv. Abhängigkeiten installiert airgeddon-geführt. Projekt-GitHub / Kali-Paket.

## Verwendet in

wireless-security 08 (Evil Twin), 09 (Enterprise), 10.
