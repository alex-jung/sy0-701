# Übung 07 – Rule-based & Mask Attacks

**Schwierigkeit: 7/10 · Dauer: ca. 60 Min.**

## Lernziele

- Wortlisten mit **Rules** mutieren (leetspeak, Anhänge, Groß/Klein)
- **Mask-Attacks** für bekannte Passwortmuster bauen
- **Hybrid-Angriffe** (Wortliste + Maske) kombinieren
- Verstehen, warum Rules reale „komplexe" Passwörter so gut treffen

## Theorie

Reale Passwörter sind oft „Wort + Muster": `Sommer2024!`, `P@ssw0rd`, `Firma123`. **Rules** transformieren Wortlisten-Einträge automatisch so:

- Groß-/Kleinschreibung, Anhängen von Ziffern/Sonderzeichen, **leetspeak** (`a→@`, `o→0`, `s→$`), Umkehren, Verdoppeln.
- Hashcat: `-r <regeldatei>` (z. B. `best64.rule`, `rockyou-30000.rule`); John: `--rules`.

**Mask-Attacks** (`-a 3`) brute-forcen einen **definierten Zeichenraum** nach Muster:
- `?l` a-z, `?u` A-Z, `?d` 0-9, `?s` Sonderzeichen, `?a` alles.
- Beispiel `?u?l?l?l?l?d?d` = Großbuchstabe + 4 klein + 2 Ziffern.
- Custom Charsets (`-1 ?l?d`) für eigene Räume.

**Hybrid** (`-a 6`/`-a 7`): Wortliste + Maske, z. B. `wort?d?d?d?d` (Wort + 4 Ziffern).

## Verwendete Tools

| Tool | Zweck | Wichtige Optionen |
|------|-------|-------------------|
| `hashcat` | Rules/Masks/Hybrid | `-r <rule>`, `-a 3 <maske>`, `-a 6/7`, `-1/-2` Custom-Charsets, `--increment` |
| `john` | Rules | `--rules[=<regelsatz>]`, `--mask=` |

## Lab-Setup

- Kali. Hashes aus vorigen Übungen (bevorzugt welche, die „nackte" Wortliste **nicht** knackt). Regeldateien unter `/usr/share/hashcat/rules/`.

## Aufgabe (selbst lösen)

1. Nimm einen Hash eines Passworts wie `P@ssw0rd!` oder `Sommer2024!`, das rockyou **pur nicht** knackt. Bestätige, dass die reine Wortliste scheitert.
2. Knacke es mit **Rules** (`best64.rule`) – Hashcat `-a 0 -r`. Welche Regel hat getroffen?
3. Baue einen **Mask-Angriff** für ein bekanntes Muster (z. B. „8 Zeichen: Großbuchstabe + 5 klein + 2 Ziffern") und knacke es.
4. Führe einen **Hybrid-Angriff** durch (Wort + `?d?d?d?d`).
5. Erkläre, warum Passwort-„Komplexitätsregeln" (1 Groß, 1 Ziffer, 1 Sonderzeichen) gegen Rules **wenig** helfen – und was wirklich hilft.

**Ziel:** ein „komplexes" Passwort, das die pure Wortliste nicht knackt, per Rules und per Maske geknackt – plus Erkenntnis über Passwortlänge vs. Komplexität.

## SY0-701 Prüfungsbezug

- **Rule-based/hybrid/mask attacks** – warum übliche Komplexitätsmuster vorhersehbar sind.
- **Passwort-Policy:** **Länge > Komplexität**; Passphrasen, Sperrlisten.
- **Mitigation:** langsame Hashes machen auch Rule-Angriffe teuer.
- Begriffe: *rule-based attack*, *mask/hybrid attack*, *leetspeak*, *password length vs. complexity*, *passphrase*.
