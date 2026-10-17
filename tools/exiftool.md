# exiftool

**Kategorie:** Metadaten / OSINT

Liest, schreibt und **entfernt** Metadaten in sehr vielen Datei-Formaten (JPEG/PNG, PDF, Office, Video …). In der Recon zum Auslesen von Autor, Software, Zeitstempeln und **GPS**; im Blue Team zum Bereinigen vor Veröffentlichung.

```bash
exiftool [Optionen] <datei(en)>
```

## Wichtigste Optionen

| Option | Bedeutung |
|--------|-----------|
| `exiftool <datei>` | alle Metadaten anzeigen |
| `-<Tag>` | nur bestimmtes Feld (`-Author -Model -Software`) |
| `-gps:all` | alle GPS-Felder |
| `-n` | numerische Werte (GPS als Dezimalgrad) |
| `-all= <datei>` | **alle** Metadaten entfernen (strippen) |
| `-csv` | CSV-Ausgabe (mehrere Dateien aggregieren) |
| `-r <dir>` | rekursiv über Verzeichnis |
| `-overwrite_original` | kein `_original`-Backup anlegen |

## Beispiele

```bash
exiftool foto.jpg
exiftool -n -GPSLatitude -GPSLongitude foto.jpg
exiftool -Author -Creator -CreateDate bericht.docx
exiftool -all= foto_clean.jpg               # alle Metadaten entfernen
exiftool -csv -Author -Creator docs/*.pdf   # aggregiert auswerten
```

## Hinweis

Installation: `sudo apt install libimage-exiftool-perl`.

## Verwendet in

reconnaissance 08 (Metadata Harvesting), 10 (OSINT-Report).
