# Lösung – Übung 01: Hashing & Integrität

## 1. SHA-256 + Avalanche

```bash
echo "Hallo Security+" > a.txt
sha256sum a.txt
sed -i 's/Hallo/hallo/' a.txt   # 1 Zeichen
sha256sum a.txt                 # komplett anderer Hash
```
Avalanche: eine minimale Änderung ändert ~50 % der Ausgabebits → Hashes sind völlig verschieden, keine Ähnlichkeit erkennbar.

## 2. Algorithmen & Längen

```bash
echo -n "test" | md5sum      # 128 bit (32 hex)
echo -n "test" | sha1sum     # 160 bit (40 hex)
echo -n "test" | sha256sum   # 256 bit (64 hex)
echo -n "test" | sha512sum   # 512 bit (128 hex)
# oder: openssl dgst -sha256 datei
```

## 3. SHA256SUMS verifizieren

```bash
sha256sum datei1 datei2 datei3 > SHA256SUMS
sha256sum -c SHA256SUMS          # alle "OK"
echo x >> datei2
sha256sum -c SHA256SUMS          # datei2: FAILED
```

## 4. Warum nicht MD5/SHA-1

Für beide sind **praktische Kollisionen** bekannt (MD5 trivial, SHA-1 seit „SHAttered" 2017). Ein Angreifer kann zwei unterschiedliche Inhalte mit gleichem Hash erzeugen → Integritäts-/Signatur-Garantie gebrochen. Daher nur noch als simple, nicht-sicherheitskritische Checksumme.

## Hinweise / Troubleshooting

- `echo` fügt ein `\n` an → `echo -n` für exakte Eingaben (sonst andere Hashes als erwartet).
- Hash-Groß/Kleinschreibung (hex) ist egal, aber führende/trailing Whitespaces ändern das Ergebnis.
- Hash ≠ Verschlüsselung: „SHA-256 entschlüsseln" gibt es nicht; „Cracken" = Durchprobieren/Rainbow-Tables.
