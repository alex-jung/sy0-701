# hashid / hash-identifier

**Kategorie:** Hash-Identifikation

Bestimmen den wahrscheinlichen **Hash-Typ** anhand von Format/Länge/Präfix – erster Schritt vor dem Cracken, um den richtigen `-m`/`--format` zu wählen.

```bash
hashid '<hash>'            # modern, mit Hashcat-Mode-Hinweis
hash-identifier            # klassisch, interaktiv
```

## hashid – wichtige Optionen

| Option | Bedeutung |
|--------|-----------|
| `hashid '<hash>'` | Typ(en) vorschlagen |
| `-m` | zugehörigen **Hashcat-Mode** mit ausgeben |
| `-j` | John-Format mit ausgeben |
| `-e` | auch „exotische" Typen |
| `-f <datei>` | Hashes aus Datei |

## Beispiele

```bash
hashid -m '5f4dcc3b5aa765d61d8327deb882cf99'
hashid '$6$salt$hash...'
hash-identifier          # dann Hash einfügen
```

## Hinweis

Erkennung ist eine **Vermutung** (32 Hex = MD5 *oder* NTLM) – Kontext entscheidet. Installation: `sudo apt install hashid hash-identifier`.

## Verwendet in

password-attacks 01, 03, 10.
