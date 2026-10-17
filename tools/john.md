# John the Ripper (john)

**Kategorie:** Offline-Passwort-Cracking (CPU-stark)

Vielseitiger Passwort-Cracker mit automatischer Format-Erkennung, starken Rules und vielen Hilfstools (`unshadow`, `zip2john`, …). Gut auf CPU; „Jumbo"-Version deckt sehr viele Formate ab.

```bash
john [--format=<typ>] [--wordlist=<liste>] [--rules] <hashdatei>
```

## Wichtigste Optionen

| Option | Bedeutung |
|--------|-----------|
| `--wordlist=<datei>` | Dictionary-Angriff |
| `--rules[=<satz>]` | Wortliste mutieren (leetspeak/Anhänge) |
| `--format=<typ>` | Format erzwingen (`raw-md5`, `sha512crypt`, `NT`, …) |
| `--single` | Username/GECOS als Kandidaten |
| `--incremental` | Brute-Force (Zeichenraum) |
| `--mask=<maske>` | Mask-Angriff |
| `--show` | geknackte Passwörter anzeigen |
| `--list=formats` | unterstützte Formate |

## Hilfstools

`unshadow passwd shadow > out` · `zip2john`, `rar2john`, `ssh2john`, `keepass2john` → Hashes aus Dateien extrahieren.

## Beispiele

```bash
john --format=raw-md5 --wordlist=rockyou.txt dvwa.hash
unshadow passwd shadow > unshadowed.txt
john --wordlist=rockyou.txt --rules unshadowed.txt
john --show unshadowed.txt
```

## Hinweis

Pot-File `~/.john/john.pot` speichert Geknacktes. Nur eigene Hashes. Vorinstalliert in Kali (jumbo).

## Verwendet in

password-attacks 02, 04, 05, 10.
