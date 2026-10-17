# Übung 04 – WPA2 Handshake cracken

**Schwierigkeit: 4/10 · Dauer: ca. 50 Min.**

## Lernziele

- Einen gecaptureten WPA2-Handshake offline cracken (aircrack-ng & hashcat)
- Capture ins hashcat-Format 22000 konvertieren
- Wortlisten + Rules anwenden (Verbindung zu password-attacks)
- Den Einfluss der PSK-Stärke auf die Crack-Chance verstehen

## Theorie

Cracking prüft **Passphrase-Kandidaten** gegen den Handshake: Kandidat → PBKDF2(SSID,pass) = PMK → PTK → **MIC** berechnen, mit dem gecaptureten MIC vergleichen. Treffer = richtige PSK.

- **aircrack-ng:** CPU, direkt auf `.cap` + Wortliste.
- **hashcat (Mode 22000):** GPU, deutlich schneller; Capture muss ins **22000-Format** (`hc22000`) konvertiert werden (`hcxpcapngtool`).

Da WPA2-PSK **nicht key-stretched im Cracking-Sinne wie bcrypt** ist (PBKDF2 mit 4096 Runden ist moderat), fällt eine **schwache** PSK schnell – eine **lange/zufällige** praktisch nie. Das ist die Kernaussage.

## Verwendete Tools

| Tool | Zweck | Optionen |
|------|-------|----------|
| `aircrack-ng` | CPU-Crack | `-w <liste> <cap>` |
| `hcxpcapngtool` | `.cap`/`.pcapng` → 22000 | `-o hash.22000 <cap>` |
| `hashcat` | GPU-Crack | `-m 22000 hash.22000 <liste> [-r rules]` |

## Lab-Setup

- Handshake aus Übung 03 (`hs-01.cap`). `rockyou.txt`. Test-AP mit **schwacher** PSK (in rockyou) zum Üben.

## Aufgabe (selbst lösen)

1. Cracke den Handshake mit **aircrack-ng** + rockyou. Wie lange dauert es?
2. Konvertiere den Capture ins **22000-Format** und cracke mit **hashcat** (`-m 22000`). Vergleiche die Geschwindigkeit.
3. Wende eine **Rule** (best64) auf eine kleinere Liste an (Verbindung zu password-attacks 07).
4. Ändere die Test-AP-PSK auf etwas **Langes/Zufälliges** und versuche erneut – was passiert?
5. Erkläre, warum SSID als „Salt" wirkt (keine generischen Rainbow Tables, aber WPA-Rainbow-Tables pro SSID möglich).

**Ziel:** die schwache Test-PSK mit aircrack-ng **und** hashcat geknackt und den Effekt einer starken PSK selbst gemessen.

## SY0-701 Prüfungsbezug

- **WPA2-PSK Offline-Cracking**; Wichtigkeit **starker Passphrasen**.
- **GPU-Cracking** (hashcat) als Bedrohungsfaktor.
- **WPA3/802.1X** als robustere Alternative.
- Begriffe: *WPA2-PSK*, *offline dictionary attack*, *PBKDF2*, *passphrase strength*, *hashcat mode 22000*.
