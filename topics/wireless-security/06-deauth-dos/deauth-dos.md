# Übung 06 – Deauthentication & DoS (+ Detection)

**Schwierigkeit: 6/10 · Dauer: ca. 45 Min.**

## Lernziele

- Deauthentication-Angriffe verstehen und als DoS einordnen
- Gezielte vs. Broadcast-Deauth durchführen
- Den Angriff im Capture erkennen (Detection-Perspektive)
- 802.11w (PMF) als Gegenmaßnahme verstehen

## Theorie

**Deauth-Frames** sind Management-Frames, die (bei WPA2 **ohne PMF**) **unauthentifiziert** sind – jeder kann sie im Namen des APs/Clients fälschen. Ein Angreifer trennt damit Clients:
- **gezielt** (ein Client) – leise, z. B. um einen Reconnect/Handshake zu erzwingen (Übung 03) oder Clients auf einen Evil Twin zu treiben (Übung 08),
- **Broadcast** (alle Clients) – lauter, reiner **DoS**.

**Detection:** gehäufte Deauth/Disassoc-Frames = klares WIDS-Signal. **Mitigation: 802.11w / Protected Management Frames (PMF)** signiert Management-Frames → gefälschte Deauth werden verworfen. WPA3 erzwingt PMF.

> ⚠️ Deauth stört reale Geräte/Nachbarn → nur eigener AP/Client, kurz, niedriger Umfang.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `aireplay-ng --deauth` | Deauth-Frames senden |
| `airodump-ng`/Wireshark | Angriff beobachten/erkennen |
| `mdk4` | erweiterte 802.11-DoS (optional) |

## Lab-Setup

- Monitor-Interface + eigener AP + eigener Client. AP einmal **ohne** PMF, einmal **mit** PMF (802.11w).

## Aufgabe (selbst lösen)

1. Trenne mit einer **gezielten** Deauth deinen eigenen Test-Client kurz vom AP.
2. Führe eine **Broadcast**-Deauth aus und beobachte den Effekt auf alle (deine) Clients.
3. **Detection:** zeichne mit Wireshark/airodump die Deauth-Frames auf – woran erkennt ein WIDS den Angriff?
4. Aktiviere am AP **802.11w (PMF)** und wiederhole – was passiert mit der Deauth?
5. Erkläre, warum Deauth ohne PMF grundsätzlich möglich ist und wie WPA3 das löst.

**Ziel:** Deauth gezielt und als DoS durchgeführt, im Capture erkannt und die Wirkung von PMF selbst gezeigt.

## SY0-701 Prüfungsbezug

- **Deauthentication/Disassociation attack** als **DoS** (Wireless Attacks, 2.0).
- **802.11w / PMF** und **WPA3** als Gegenmaßnahmen.
- **WIDS/WIPS** zur Erkennung.
- Begriffe: *deauthentication attack*, *DoS*, *management frames*, *PMF (802.11w)*, *WIDS/WIPS*.
