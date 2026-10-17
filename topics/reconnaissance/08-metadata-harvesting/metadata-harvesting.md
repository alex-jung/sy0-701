# Übung 08 – Metadata Harvesting (Dokumente & Bilder)

**Schwierigkeit: 8/10 · Dauer: ca. 55 Min.**

## Lernziele

- Metadaten aus Dokumenten/Bildern extrahieren und ihren Recon-Wert verstehen
- `exiftool` sicher bedienen (lesen & bereinigen)
- `metagoofil` nutzen, um öffentliche Dokumente einer Domain zu sammeln und auszuwerten
- Metadaten als Datenschutz-/Information-Disclosure-Risiko einordnen

## Theorie

Dateien tragen oft unsichtbare **Metadaten**: Autor/Benutzername, Software + Version, Erstell-/Änderungsdaten, Drucker, Dateipfade (verraten interne Struktur/Benutzernamen), bei Fotos **GPS-Koordinaten**, Kameramodell, teils Software-/OS-Versionen.

Für Recon ergibt das:
- **Benutzernamen** (Autor-Feld) → Login-/Mail-Namensschema.
- **Software-/OS-Versionen** → bekannte CVEs.
- **Interne Pfade/Servernamen** (`\\fileserver01\...`) → Infrastruktur.
- **GPS** in Fotos → physische Standorte.

**metagoofil** automatisiert: es findet über Suchmaschinen öffentliche Dokumente (`pdf`, `docx`, `xlsx`, `pptx`) einer Domain, lädt sie und extrahiert die Metadaten en masse.

> ⚠️ Übe das **Lesen** an eigenen Dateien und das **Sammeln** an deiner eigenen Domain. Fremde Dokumente nicht massenhaft abgreifen.

## Verwendete Tools

| Tool | Zweck | Wichtige Optionen |
|------|-------|-------------------|
| `exiftool` | Metadaten lesen/schreiben/löschen | `<datei>`, `-gps*`, `-all= <datei>` (strippen), `-csv` |
| `metagoofil` | öffentliche Docs sammeln + auswerten | `-d <domain>`, `-t <typen>`, `-l <limit>`, `-o <dir>` |
| `mat2` (optional) | Metadaten sicher entfernen | `mat2 <datei>` |

## Lab-Setup

- Kali + Internet. Eigene Testdateien (ein Foto mit GPS, ein PDF/DOCX). `exiftool`/`metagoofil` ggf. installieren.

## Aufgabe (selbst lösen)

1. Lies mit `exiftool` die Metadaten einer eigenen **Bilddatei**. Enthält sie **GPS-Koordinaten**, Kameramodell, Software? Wandle die GPS-Daten in einen Kartenpunkt um.
2. Lies die Metadaten eines **Office-/PDF-Dokuments**: **Autor**, erzeugende **Software + Version**, Zeitstempel.
3. **Bereinige** eine Kopie der Dateien (alle Metadaten entfernen) und verifiziere, dass nichts mehr übrig ist.
4. Lass `metagoofil` öffentliche Dokumente **deiner Domain** sammeln und die Metadaten auswerten. Welche **Benutzernamen/Software** tauchen auf?
5. Erkläre, wie man Metadaten-Leaks organisatorisch und technisch verhindert.

**Ziel:** aus Metadaten reale Recon-Infos (Usernamen, Software-Versionen, Standorte) ziehen – und zeigen, wie man Dateien vor Veröffentlichung sauber bereinigt.

## SY0-701 Prüfungsbezug

- **Information disclosure / data leakage** über Metadaten – klassisches, unterschätztes Leck.
- **Data protection:** Metadaten-Scrubbing als Kontrolle; **DLP**, Freigabe-Prozesse vor Veröffentlichung.
- **OSINT** zur Benutzer-/Software-Enumeration → CVE-Bezug und Phishing-Namensschema.
- Begriffe: *metadata*, *data exposure*, *EXIF/GPS*, *DLP*, *sanitization/scrubbing*, *information disclosure*.
