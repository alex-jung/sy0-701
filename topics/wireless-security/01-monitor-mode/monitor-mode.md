# Übung 01 – WLAN-Grundlagen & Monitor Mode

**Schwierigkeit: 1/10 · Dauer: ca. 40 Min.**

## Lernziele

- 802.11-Grundlagen verstehen (Bänder, Kanäle, Frame-Typen, BSSID/ESSID)
- Einen WLAN-Adapter in den Monitor Mode versetzen
- Störquellen abschalten (NetworkManager/`airmon-ng check kill`)
- Den Unterschied Managed- vs. Monitor-Mode begreifen

## Theorie

WLAN nach **802.11** sendet in den Bändern **2,4 GHz** (Kanäle 1–13) und **5 GHz**. Datenverkehr läuft in **Frames** dreier Typen:
- **Management** (Beacons, Probe, Auth, Assoc, **Deauth**),
- **Control** (ACK, RTS/CTS),
- **Data** (Nutzdaten).

Begriffe: **BSSID** = MAC des APs, **ESSID** = Netzname, **STA** = Client.

Im normalen **Managed Mode** empfängt die Karte nur Frames für sich. Für Angriffe/Analyse braucht man den **Monitor Mode**: die Karte hört **alle** Frames auf einem Kanal mit (und kann – mit passendem Chipsatz – **injizieren**). Störende Dienste (NetworkManager) müssen beendet werden.

## Verwendete Tools

| Tool | Zweck | Befehle |
|------|-------|---------|
| `airmon-ng` | Monitor Mode + Störquellen | `airmon-ng start <iface>`, `airmon-ng check kill` |
| `iw`/`iwconfig` | Interface-/Mode-Status | `iw dev`, `iwconfig` |
| `ip`/`airmon-ng` | Interface up/down | |

## Lab-Setup

- WLAN-Adapter mit Monitor-Mode/Injection, in Kali durchgereicht. Eigener Test-AP in Reichweite.

## Aufgabe (selbst lösen)

1. Identifiziere deinen WLAN-Adapter und seinen aktuellen Modus (`iw dev`/`iwconfig`).
2. Beende störende Dienste und versetze den Adapter in den **Monitor Mode**. Verifiziere den Modus.
3. Teste, ob dein Adapter **Packet Injection** kann (`aireplay-ng --test`).
4. Erkläre den Unterschied Managed/Monitor und wofür du Monitor Mode brauchst.
5. Nenne die drei 802.11-Frame-Typen und je ein Beispiel.

**Ziel:** ein funktionierendes Monitor-Mode-Interface mit bestätigter Injection-Fähigkeit – die Grundlage aller folgenden Übungen.

## SY0-701 Prüfungsbezug

- **802.11-Grundlagen**, Bänder/Kanäle, Frame-Typen; BSSID/ESSID.
- **Monitor Mode / Injection** als Voraussetzung für WLAN-Angriffe und -Analyse.
- Begriffe: *802.11*, *BSSID/ESSID*, *management/control/data frame*, *monitor mode*, *packet injection*.
