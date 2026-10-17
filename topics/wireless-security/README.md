# Thema: Wireless Security

Praxis-Übungen zur **WLAN-Sicherheit (802.11)** – von Monitor Mode und Sniffing über WPA2-Handshake-Capture/-Cracking, PMKID, WPS und Evil Twin bis zu WPA-Enterprise/WPA3. Mit Angriff **und** Abwehr/Detection.

> ⚠️ **Nur dein eigenes Test-WLAN.** Angriffe auf fremde WLANs (Deauth, Handshake-Capture, Evil Twin) sind illegal. Betreibe einen **eigenen Test-Access-Point** (eigener Router/zweite VM/Smartphone-Hotspot) und greife ausschließlich diesen an. Deauth/DoS stören auch benachbarte Netze – im Zweifel abgeschirmt/leiser Kanal.

## Lernziele

- 802.11-Grundlagen, Monitor Mode und Frame-Typen verstehen
- APs/Clients aufspüren, WPA2-Handshakes capturen und cracken
- PMKID-, WPS-, Deauth- und Evil-Twin-Angriffe durchführen
- WPA-Enterprise (EAP) und WPA3 (SAE) einordnen
- Zu jedem Angriff die Gegenmaßnahme kennen (starke PSK, WPS aus, 802.11w/PMF, WPA3)

## Abgedeckte SY0-701-Domänen

- **2.0 Threats, Vulnerabilities & Mitigations** – Wireless Attacks (deauth, evil twin, rogue AP, WPS)
- **3.0 Security Architecture** – sichere WLAN-Architektur, WPA2/3, 802.1X/EAP
- **4.0 Security Operations** – WIDS/WIPS, Monitoring

## Übungen (Schwierigkeit 1 → 10)

| #  | Übung | Schwierigkeit |
|----|-------|---------------|
| 01 | WLAN-Grundlagen & Monitor Mode | 1/10 |
| 02 | AP-/Client-Discovery & Sniffing | 2/10 |
| 03 | WPA2 4-Way-Handshake capturen | 3/10 |
| 04 | WPA2 Handshake cracken | 4/10 |
| 05 | PMKID-Angriff (clientless) | 5/10 |
| 06 | Deauthentication & DoS (+ Detection) | 6/10 |
| 07 | WPS-Angriffe (reaver/bully) | 7/10 |
| 08 | Evil Twin / Rogue AP + Captive Portal | 8/10 |
| 09 | WPA-Enterprise (EAP) & WPA3 | 9/10 |
| 10 | Vollständiges Wireless Assessment + Report | 10/10 |

## Lab-Voraussetzungen

- **WLAN-Adapter mit Monitor-Mode + Packet Injection** (z. B. Chipsätze Atheros AR9271, Ralink RT3070/RT5370, Realtek RTL8812AU) – in Kali per USB durchgereicht
- **Eigener Test-AP:** ein Router/AP, den du kontrollierst, mit **absichtlich schwacher PSK** (in `rockyou`) zum Üben; für WPS/Enterprise/WPA3 entsprechend konfigurierbar
- **Kali Linux** – `aircrack-ng`-Suite, `hcxdumptool`/`hcxtools`, `reaver`/`bully`, `wifite`, `airgeddon`/`hostapd`, `hashcat`, Wireshark
- Für PMKID/Handshake-Cracking: `hashcat` (Mode 22000), Wortlisten

> Ohne passenden Adapter lassen sich die reinen Capture-/Inject-Übungen nicht praktisch durchführen – dann konzeptionell + an bereitgestellten Capture-Dateien üben.

Reihenfolge: starte bei `01-monitor-mode/`. Pro Übung erst die `.md` lösen, dann `solution.md`.
