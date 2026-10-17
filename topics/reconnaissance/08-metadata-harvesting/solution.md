# Lösung – Übung 08: Metadata Harvesting

## 1. Bild-Metadaten (EXIF/GPS)

```bash
exiftool foto.jpg
exiftool -gps:all -Model -Software -DateTimeOriginal foto.jpg
# GPS kompakt + als Dezimalgrad:
exiftool -n -GPSLatitude -GPSLongitude foto.jpg
```
Beispiel:
```
GPS Latitude  : 48.137154
GPS Longitude : 11.576124
Model         : iPhone 13
Software      : 17.4.1
```
→ Dezimalkoordinaten in OpenStreetMap/Google Maps eingeben ergibt den Aufnahmeort. `Software` verrät iOS-Version.

## 2. Dokument-Metadaten

```bash
exiftool bericht.pdf
exiftool -Author -Creator -Producer -CreateDate -ModifyDate bericht.docx
```
Typische Funde:
```
Author     : m.mustermann
Creator    : Microsoft Word 2016
Producer   : ...
Create Date: 2023:05:12 ...
```
→ `Author` = Benutzername (Namensschema!), `Creator` = Software/Version (CVE-Ansatz).

## 3. Bereinigen & verifizieren

```bash
cp foto.jpg foto_clean.jpg
exiftool -all= foto_clean.jpg            # alle Metadaten entfernen
exiftool foto_clean.jpg                   # prüfen: nur noch technische Basics
# gründlicher/mehr Formate:
mat2 bericht.docx                         # erzeugt bericht.cleaned.docx
```
Nach `-all=` sollten Autor/GPS/Software weg sein. `exiftool` legt bei In-Place-Edit ein `_original`-Backup an.

## 4. metagoofil gegen eigene Domain

```bash
metagoofil -d <DEINE_DOMAIN> -t pdf,docx,xlsx,pptx -l 50 -o docs_out
# auf manchen Systemen:  metagoofil -d ... -t pdf -l 25 -o docs_out -w
```
metagoofil sucht die Dokumente über Suchmaschinen, lädt sie nach `docs_out/` und fasst Metadaten (Autoren, Software, Pfade) zusammen. Ergänzend:
```bash
exiftool -csv -Author -Creator docs_out/*.pdf docs_out/*.docx | sort -u
```
→ aggregierte Benutzernamen + eingesetzte Office-Versionen deiner Domain.

## 5. Leaks verhindern

- **Metadaten vor Veröffentlichung strippen** (`exiftool -all=` / `mat2`), idealerweise automatisiert im Publishing-Prozess.
- **Office:** „Dokument prüfen → persönliche Informationen entfernen"; PDF-Export ohne Metadaten.
- **Richtlinie/Awareness:** keine internen Pfade/echten Usernamen in Vorlagen.
- **DLP** erkennt/blockt sensible Dateien; **Freigabe-Review** vor Upload.

## Häufige Fehler / Troubleshooting

- **`exiftool`/`metagoofil` fehlt:** `sudo apt install libimage-exiftool-perl metagoofil`.
- **Kein GPS im Bild:** viele Plattformen strippen EXIF beim Upload – eigene Originaldatei direkt vom Smartphone testen.
- **metagoofil findet nichts:** Suchmaschinen-Blocking/kleine Domain; Limit senken, Typen einzeln, erneut versuchen.
- **`-all=` löscht zu viel?** Genau der Zweck. Für selektives Entfernen einzelne Tags setzen (`-GPS:all=`).
