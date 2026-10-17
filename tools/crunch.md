# crunch

**Kategorie:** Wortlisten-Generator

Erzeugt Wortlisten nach **Länge, Zeichenraum und Muster** – für gezielte Brute-Force-/Masken-Angriffe, wenn das Passwort-Format bekannt ist.

```bash
crunch <min> <max> [zeichenraum] [-t <muster>] [-o <datei>]
```

## Wichtigste Optionen

| Option | Bedeutung |
|--------|-----------|
| `<min> <max>` | Mindest-/Maximallänge |
| `[zeichenraum]` | z. B. `0123456789abcdef` |
| `-t <muster>` | festes Muster mit Platzhaltern |
| `-o <datei>` | Ausgabedatei (`-o START` für Split) |
| `-f <lst> <name>` | vordefinierter Zeichensatz (`charset.lst`) |
| `-b <größe>` | Dateien bei Größe splitten |

## Muster-Platzhalter (`-t`)

`@` Kleinbuchstabe · `,` Großbuchstabe · `%` Ziffer · `^` Sonderzeichen.

## Beispiele

```bash
crunch 4 4 0123456789 -o pins.txt            # alle 4-stelligen PINs
crunch 9 9 -t Firma%%%% -o firma.txt         # "Firma"+4 Ziffern
crunch 6 8 -f /usr/share/crunch/charset.lst lalpha -o out.txt
```

## Hinweis

Listen werden **schnell riesig** (crunch zeigt die Größe vorab) → Länge/Muster begrenzen. Installation: `sudo apt install crunch`.

## Verwendet in

password-attacks 08 (Custom-Wortlisten), 10.
