# Übung 10 – Vollständiges Wireless Assessment + Report

**Schwierigkeit: 10/10 · Dauer: ca. 2–3 Std.**

## Lernziele

- Ein eigenes WLAN methodisch komplett bewerten
- Alle Techniken kombinieren (Recon → PSK/PMKID → WPS → Evil Twin → Enterprise)
- Findings nach Risiko bewerten und priorisiert härten
- Einen Wireless-Assessment-Report erstellen

## Theorie

Ein WLAN-Assessment prüft systematisch alle relevanten Angriffsflächen deines Netzes:
1. **Recon:** APs/Clients, Verschlüsselung, Kanäle, versteckte SSIDs.
2. **PSK-Angriffe:** Handshake/PMKID capturen + Crack-Versuch (→ PSK-Stärke bewerten).
3. **WPS:** aktiviert? pixie/PIN-anfällig?
4. **Deauth/PMF:** ist 802.11w aktiv?
5. **Evil Twin/Rogue:** Anfälligkeit für gefälschte APs.
6. **Enterprise/WPA3:** EAP-Konfiguration, Server-Zert-Validierung, WPA3 vorhanden?
7. **Report:** Findings + Risiko + Härtung.

`wifite` kann vieles automatisieren; der Report macht daraus ein Ergebnis. `wireless-report-template.md` ist das Gerüst.

## Verwendete Tools

Kombination aus Übung 01–09: aircrack-ng-Suite, hcxdumptool/hcxtools, reaver/bully, airgeddon/hostapd(-wpe), hashcat, wifite, Wireshark + `wireless-report-template.md`.

## Lab-Setup

- Dein(e) eigene(n) Test-AP(s) in verschiedenen Konfigurationen (schwache/starke PSK, WPS an/aus, PMF an/aus, ggf. Enterprise/WPA3). Monitor-Adapter. Snapshots/Configs dokumentieren.

## Aufgabe (selbst lösen)

Bewerte dein eigenes WLAN als „Wireless Pentest".

1. **Recon:** erfasse AP(s), Verschlüsselung, Clients, WPS-Status, PMF.
2. **PSK:** capture Handshake/PMKID und versuche zu cracken → bewerte die PSK-Stärke.
3. **WPS/Deauth/Evil Twin:** teste die jeweilige Anfälligkeit (nur eigener AP/Client).
4. **Findings & Risiko:** liste jede Schwäche mit High/Med/Low + Nachweis.
5. **Report:** fülle `wireless-report-template.md` – Findings, Risiko, priorisierte Härtung (starke PSK, WPS aus, PMF/802.11w, WPA3, 802.1X mit Zert-Validierung, WIDS).

**Ziel:** ein vollständiger, belegter Wireless-Assessment-Report deines eigenen Netzes mit priorisierten Härtungsmaßnahmen.

## SY0-701 Prüfungsbezug

- **Wireless security assessment**; alle Wireless-Attacks + Mitigations gebündelt.
- **Secure wireless architecture:** WPA3, 802.1X/EAP, PMF, WPS aus, starke PSK, WIDS/WIPS.
- Begriffe: *wireless assessment*, *WPA2/WPA3*, *802.1X/EAP*, *PMF (802.11w)*, *WPS*, *WIDS/WIPS*.
