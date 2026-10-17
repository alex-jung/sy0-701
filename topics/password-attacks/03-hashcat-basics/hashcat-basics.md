# Übung 03 – Hashcat: Basics & Attack-Modes

**Schwierigkeit: 3/10 · Dauer: ca. 45 Min.**

## Lernziele

- Hashcat bedienen (Hash-Mode, Attack-Mode)
- Den passenden `-m`-Mode zum Hash-Typ wählen
- Attack-Modes unterscheiden (Straight/Dictionary, Combination, Mask/Brute, Hybrid)
- Ergebnisse anzeigen und Performance einordnen (GPU vs. CPU)

## Theorie

**Hashcat** ist der schnellste Passwort-Cracker, v. a. **GPU-beschleunigt**. Zwei Kernparameter:

- **Hash-Mode `-m`** – welcher Hash-Typ (Beispiele): `0` MD5, `100` SHA1, `1400` SHA-256, `1800` sha512crypt, `1000` NTLM, `3200` bcrypt, `0`.
- **Attack-Mode `-a`:**
  - `-a 0` **Straight** (Wortliste, optional + Rules)
  - `-a 1` **Combination** (zwei Listen kombinieren)
  - `-a 3` **Mask/Brute-Force** (Zeichenraum per Maske)
  - `-a 6`/`-a 7` **Hybrid** (Wortliste + Maske)

`--show` zeigt geknackte, `--username` behandelt `user:hash`-Dateien, `-o` schreibt Ergebnisse. `hashcat --example-hashes` listet Formate/Modes.

## Verwendete Tools

| Tool | Zweck | Wichtige Optionen |
|------|-------|-------------------|
| `hashcat` | GPU/CPU-Cracking | `-m <mode>`, `-a <attack>`, `-o`, `--show`, `--username`, `--force`, `-r <rules>` |

## Lab-Setup

- Kali. DVWA-MD5-Hashes aus Übung 01/02, `rockyou.txt`. CPU reicht (ggf. `--force` in VMs ohne GPU-Treiber).

## Aufgabe (selbst lösen)

1. Bestimme den **`-m`-Mode** für die DVWA-MD5-Hashes (hashid/`--example-hashes`).
2. Cracke sie mit **`-a 0`** (Wortliste rockyou) und zeige die Treffer (`--show`).
3. Führe testweise einen **Mask-Angriff** (`-a 3`) auf ein kurzes numerisches Passwort durch (z. B. `?d?d?d?d`).
4. Vergleiche die **Geschwindigkeit** (Hashes/Sek.) von MD5 vs. einem langsamen Hash (bcrypt) – was fällt auf?
5. Erkläre, wann du Wortliste, wann Maske, wann Hybrid nutzt.

**Ziel:** DVWA-Hashes mit Hashcat geknackt und die Attack-Modes praktisch unterschieden.

## SY0-701 Prüfungsbezug

- **Brute-force vs. dictionary vs. mask/hybrid**; GPU-Beschleunigung als Bedrohungsfaktor.
- **Schnelle vs. langsame Hashes:** warum MD5 in Sekunden, bcrypt praktisch nicht fällt.
- **Key stretching** als direkte Gegenmaßnahme (sichtbar an der Crack-Rate).
- Begriffe: *dictionary/brute-force/mask attack*, *GPU cracking*, *key stretching*, *hash mode*.
