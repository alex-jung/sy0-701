# Übung 02 – AP-/Client-Discovery & Sniffing

**Schwierigkeit: 2/10 · Dauer: ca. 45 Min.**

## Lernziele

- WLANs in der Umgebung aufspüren (airodump-ng)
- APs und assoziierte Clients identifizieren (BSSID, Kanal, Verschlüsselung, Signal)
- Einen Capture auf einen Ziel-AP/-Kanal fokussieren
- Hidden SSIDs und Probe Requests verstehen

## Theorie

**airodump-ng** zeigt im Monitor Mode alle hörbaren APs und Clients. Pro AP: **BSSID**, **PWR** (Signal), **CH** (Kanal), **ENC/CIPHER/AUTH** (z. B. WPA2/CCMP/PSK), **ESSID**. Unten die **Stations** (Clients) mit zugehöriger BSSID.

Beim Angriff fokussiert man auf **einen** AP + Kanal (`--bssid`/`-c`), weil Kanal-Hopping sonst Pakete verpasst. **Hidden SSIDs** (Beacon ohne Namen) verraten sich oft über **Probe Requests** verbundener Clients. Clients senden Probes nach bekannten Netzen (Privacy-Leak → relevant für Evil Twin, Übung 08).

## Verwendete Tools

| Tool | Zweck | Optionen |
|------|-------|----------|
| `airodump-ng` | APs/Clients scannen & capturen | `--bssid`, `-c <kanal>`, `-w <datei>`, `--band abg` |
| `wifite` | automatisierte Übersicht | (interaktiv) |
| Wireshark | Frames analysieren | Filter `wlan` |

## Lab-Setup

- Monitor-Interface (Übung 01). Eigener Test-AP (+ ein verbundener Client, z. B. Smartphone).

## Aufgabe (selbst lösen)

1. Scanne mit `airodump-ng` die Umgebung und finde deinen **Test-AP**: BSSID, Kanal, Verschlüsselung, Signal.
2. Liste die mit deinem AP **assoziierten Clients** (Station-MACs).
3. Fokussiere den Capture auf deinen AP + Kanal und schreibe in eine Datei.
4. Schalte an deinem AP die SSID auf **hidden** – wie bekommst du den Namen trotzdem (Probe/Client-Reassoc)?
5. Erkläre, warum „Hidden SSID" und MAC-Filter nur schwache Schutzmaßnahmen sind.

**Ziel:** deinen Test-AP samt Clients identifiziert, einen fokussierten Capture gestartet und Hidden-SSID aufgedeckt.

## SY0-701 Prüfungsbezug

- **Wireless reconnaissance**; **BSSID/ESSID**, Verschlüsselungs-Anzeige (WPA2/WPA3).
- **Security by obscurity**: Hidden SSID / MAC-Filtering sind leicht umgehbar (kein echter Schutz).
- **Probe-Request-Privacy-Leak** (Grundlage Evil Twin).
- Begriffe: *SSID/BSSID*, *hidden SSID*, *MAC filtering*, *probe request*, *security by obscurity*.
