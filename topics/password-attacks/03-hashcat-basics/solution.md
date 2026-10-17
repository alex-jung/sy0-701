# Lösung – Übung 03: Hashcat Basics

## 1. Mode bestimmen

```bash
hashid -m '5f4dcc3b5aa765d61d8327deb882cf99'   # schlägt Hashcat-Mode vor
hashcat --example-hashes | grep -i -A2 'MD5'
```
MD5 = **`-m 0`**.

## 2. Wortlisten-Angriff

```bash
hashcat -m 0 -a 0 dvwa.hash /usr/share/wordlists/rockyou.txt
# in VM ohne GPU-Treiber ggf.:
hashcat -m 0 -a 0 dvwa.hash rockyou.txt --force
hashcat -m 0 dvwa.hash --show        # Treffer anzeigen (hash:klartext)
```

## 3. Mask-Angriff (-a 3)

```bash
# 4-stellige Zahl:
hashcat -m 0 -a 3 one_md5.hash '?d?d?d?d'
# Maskenzeichen: ?l a-z  ?u A-Z  ?d 0-9  ?s Sonderzeichen  ?a alles
hashcat -m 0 -a 3 one_md5.hash '?u?l?l?l?d?d'   # Großbuchst+3 klein+2 Ziffern
```
Masken sind gezielter Brute-Force über definierte Zeichenräume.

## 4. Geschwindigkeit

```bash
hashcat -b -m 0        # Benchmark MD5
hashcat -b -m 3200     # Benchmark bcrypt
```
- **MD5 (`-m 0`):** Milliarden–Billionen H/s (GPU) → Wortliste in Sekunden durch.
- **bcrypt (`-m 3200`):** nur wenige tausend H/s → selbst kleine Wortlisten dauern ewig.
→ Der Faktor ist riesig – genau der Sinn von **key stretching**.

## 5. Modus-Wahl

- **Wortliste (`-a 0`):** erste Wahl – reale Passwörter. Mit Rules (Übung 07) verstärken.
- **Maske (`-a 3`):** wenn das Muster bekannt ist (z. B. „8 Zeichen, endet auf 2 Ziffern") oder für kurze Passwörter.
- **Hybrid (`-a 6/7`):** Wortliste + angehängte/vorangestellte Maske (`passwort` + `2024`).

## Gegenmaßnahmen

- **Langsame Hashes** (bcrypt/Argon2) – macht GPU-Cracking unwirtschaftlich.
- Lange Passphrasen (Maskenraum explodiert mit Länge), Sperrlisten, kein MD5/SHA1/NTLM.

## Häufige Fehler / Troubleshooting

- **„No devices found/clBuildProgram":** in VM ohne GPU → `--force` oder OpenCL/CPU-Backend; langsamer, aber ok fürs Lab.
- **Falscher `-m`:** keine Treffer → `hashid -m` / `--example-hashes`.
- **`user:hash`-Datei:** `--username` setzen, sonst wird der Username als Hash-Teil gelesen.
- **Status/Fortschritt:** während des Laufs `s` (status), `p` (pause), `q` (quit); Fortschritt wird gespeichert (`--restore`).
