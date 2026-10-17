# metagoofil

**Kategorie:** Metadaten / OSINT

Automatisiert das **Sammeln öffentlicher Dokumente** einer Domain (PDF, DOCX, XLSX, PPTX …) über Suchmaschinen, lädt sie herunter und extrahiert die Metadaten (Autoren/Benutzernamen, Software, interne Pfade) en masse.

```bash
metagoofil -d <domain> -t <typen> -l <limit> -o <ausgabe-dir> [Optionen]
```

## Wichtigste Optionen

| Option | Bedeutung |
|--------|-----------|
| `-d <domain>` | Zieldomain |
| `-t <typen>` | Dateitypen, kommagetrennt (`pdf,docx,xlsx,pptx`) |
| `-l <n>` | Anzahl Suchtreffer |
| `-o <dir>` | Download-/Ausgabeverzeichnis |
| `-w` | Dateien herunterladen (statt nur Links) |
| `-f <datei>` | Ergebnis-Report speichern |

## Beispiel

```bash
metagoofil -d example.com -t pdf,docx,xlsx -l 50 -o docs_out
# danach aggregiert auswerten:
exiftool -csv -Author -Creator docs_out/*.pdf docs_out/*.docx | sort -u
```

## Hinweise

- Optionen variieren je nach Version (Python-Rewrite vs. alt); `metagoofil -h` prüfen.
- Dokumente Dritter nicht massenhaft abgreifen → nur eigene/freigegebene Domain.
- Installation: `sudo apt install metagoofil`.

## Verwendet in

reconnaissance 08 (Metadata Harvesting), 10 (OSINT-Report).
