# Übung 03 – WPA2 4-Way-Handshake capturen

**Schwierigkeit: 3/10 · Dauer: ca. 45 Min.**

## Lernziele

- Den WPA2-4-Way-Handshake und seine Rolle verstehen
- Einen Handshake durch (De-)Authentifizierung eines Clients erzwingen und capturen
- Den Capture auf Vollständigkeit prüfen
- Die Beziehung PSK → PMK → PTK grob einordnen

## Theorie

Bei **WPA2-PSK** leitet sich aus der Passphrase (**PSK**) via PBKDF2 der **PMK** ab; beim Verbinden handeln AP und Client im **4-Way-Handshake** den Sitzungsschlüssel **PTK** aus (mit Nonces + MACs). Der Handshake selbst überträgt **nicht** das Passwort, enthält aber genug, um offline **Passphrase-Kandidaten zu prüfen** (Übung 04).

Angriff: man **capturet den Handshake** eines sich verbindenden Clients. Da man nicht warten will, **deauthentifiziert** man einen verbundenen Client kurz → er reconnectet → Handshake wird mitgeschnitten. Man braucht mindestens die Nachrichten M1–M2 (besser alle 4) + Beacon.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `airodump-ng` | Handshake capturen (zeigt „WPA handshake") |
| `aireplay-ng` | gezielte Deauth zum Reconnect erzwingen |
| `wifite` | automatisiert (capture+deauth) |

## Lab-Setup

- Monitor-Interface + eigener WPA2-Test-AP + ein verbundener Client. BSSID/Kanal aus Übung 02.

## Aufgabe (selbst lösen)

1. Starte einen fokussierten `airodump-ng`-Capture auf deinen AP (mit `-w`).
2. Erzwinge mit einer **gezielten Deauth** (an einen verbundenen Client) dessen Reconnect.
3. Bestätige, dass airodump oben rechts **„WPA handshake: <BSSID>"** meldet.
4. Verifiziere die Vollständigkeit des Handshakes im Capture (aircrack/`wpaclean`/Wireshark EAPOL).
5. Erkläre, warum das Capturen eines Handshakes das Passwort noch **nicht** verrät.

**Ziel:** ein vollständiger WPA2-Handshake deines Test-APs in einer `.cap`-Datei – bereit fürs Cracking (Übung 04).

## SY0-701 Prüfungsbezug

- **WPA2 4-Way-Handshake**, PSK/PMK/PTK-Grundidee.
- **Deauthentication** als Enabler (Mitigation: **802.11w/PMF**).
- **Offline-Angriff:** Capture ≠ Passwort (erst Cracking).
- Begriffe: *WPA2-PSK*, *4-way handshake*, *EAPOL*, *deauthentication*, *PMF (802.11w)*.
