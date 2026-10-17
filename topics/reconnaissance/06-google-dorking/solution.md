# Lösung – Übung 06: Google Dorking

`<DOMAIN>` = deine eigene Domain.

## 1. Indexierte Dokumente

```
site:<DOMAIN> (filetype:pdf OR filetype:docx OR filetype:xlsx OR filetype:pptx)
```
Listet alle von der Suchmaschine indexierten Office-/PDF-Dateien deiner Domain. Interessant, weil Dokumente oft Metadaten/interne Infos enthalten (→ Übung 08).

## 2. Offene Verzeichnislisten

```
site:<DOMAIN> intitle:"index of"
intitle:"index of" "parent directory" site:<DOMAIN>
```
Findet Apache/nginx-Directory-Listings (oft ungewollt offen) – manchmal mit Backups, Logs, Quellcode.

## 3. Login-/Admin-Panels

```
site:<DOMAIN> (inurl:admin OR inurl:login OR intitle:"login")
site:<DOMAIN> inurl:wp-login.php
```

## 4. GHDB-Kategorien (Beispiele)

Aus der Google Hacking Database (exploit-db.com/google-hacking-database), gefährlich für Firmen:
- **„Files Containing Passwords":** `ext:sql intext:password`, `filetype:env "DB_PASSWORD"` → exponierte Credentials/`.env`.
- **„Sensitive Directories":** `intitle:"index of" "backup"` → offene Backup-Ordner.
- **„Various Online Devices":** Dorks für offene Kameras/Drucker/IoT-Weboberflächen.
- (weitere: „Login Portals", „Error Messages" mit Stacktraces, „Files Containing Juicy Info").

## 5. Blue-Team: Indexierung verhindern

- **Authentifizierung** vor sensible Bereiche – `robots.txt`/`noindex` schützt **nicht** vor Zugriff, nur vor Crawling.
- **`X-Robots-Tag: noindex`** / `<meta name="robots" content="noindex">` für Seiten, die nicht in den Index sollen.
- **Directory-Listing deaktivieren** (Apache `Options -Indexes`).
- **Sensible Dateien gar nicht im Webroot** ablegen (`.env`, Backups, `.sql`).
- Bereits indexierte Leaks über die **Search Console / „Remove URL"** entfernen und Ursache (offener Pfad) schließen.
- **DLP** / regelmäßige eigene Dork-Checks als Monitoring.

## Häufige Fehler / Troubleshooting

- **CAPTCHAs/Blocking bei vielen Dorks:** Google drosselt automatisiertes Dorking; manuell/langsam, oder Bing/DuckDuckGo als Alternative.
- **`filetype:` vs. `ext:`:** funktionieren ähnlich; bei Bing teils anders.
- **Keine Treffer für eigene Domain:** gut fürs Blue Team (wenig exponiert) – dann an einer generischen Technikübung lernen, nicht an fremden Zielen.
- **Automatisierung:** Tools wie frühere „Google-Scraper" verletzen oft die ToS und werden geblockt – für die Übung reicht die manuelle Suche.
