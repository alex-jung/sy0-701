# Lösung – Übung 03: Web-Footprinting

`<ZIEL>` = z. B. `http://192.168.56.100/dvwa/` oder `http://scanme.nmap.org`.

## 1. Stack bestimmen

```bash
# HTTP-Header
curl -sSI http://<ZIEL>
# Fingerprinting
whatweb -a 3 -v http://<ZIEL>
```
Beispiel-Header (Metasploitable/DVWA):
```
Server: Apache/2.2.8 (Ubuntu) DAV/2
X-Powered-By: PHP/5.2.4-2ubuntu5.10
Set-Cookie: PHPSESSID=...
```
→ Apache 2.2.8, PHP 5.2, Cookie `PHPSESSID` bestätigt PHP. `whatweb` ergänzt CMS/JS-Libs, Titel, evtl. WordPress/Joomla-Version.

## 2. robots.txt / sitemap.xml

```bash
curl -sS http://<ZIEL>/robots.txt
curl -sS http://<ZIEL>/sitemap.xml
```
`robots.txt` listet oft genau die Pfade, die man *nicht* sehen soll:
```
User-agent: *
Disallow: /admin/
Disallow: /backup/
Disallow: /config/
```
→ Für den Angreifer eine **Landkarte sensibler Pfade** (Admin-Panels, Backups). `robots.txt` verhindert nur Crawling, **nicht** den Zugriff.

## 3. Security-Header

```bash
curl -sSI http://<ZIEL> | grep -iE 'x-frame-options|content-security|strict-transport|x-content-type|referrer-policy'
```
Bei Metasploitable/DVWA fehlen praktisch alle → keine Clickjacking-/XSS-/HSTS-Härtung. Notiere, welche fehlen (meist alle).

## 4. WAF-Erkennung

```bash
wafw00f http://<ZIEL>
wafw00f -a http://<ZIEL>        # alle Checks
```
Ausgabe entweder „is behind <WAF>" oder „No WAF detected". Lab-Ziele haben i. d. R. keine WAF → gutes Kontrastbeispiel.

## 5. Wayback Machine

- Web: `https://web.archive.org/web/*/<domain>` → Snapshot wählen.
- CLI (alle archivierten URLs):
```bash
curl -sS "http://web.archive.org/cdx/search/cdx?url=<domain>*&output=text&fl=original&collapse=urlkey" | head
```
Typischer Fund: alte Pfade/Subdomains, entfernte Dateien (z. B. `/old/`, `backup.zip`), frühere Technologie – Infos, die live längst weg sind.

## Häufige Fehler / Troubleshooting

- **`whatweb`/`wafw00f` fehlt:** `sudo apt install whatweb wafw00f`.
- **HTTPS-Zertifikatsfehler im Lab:** `curl -k` (Zertifikatsprüfung aus).
- **Redirect verschluckt Header:** `curl -IL` folgt Redirects.
- **Keine Wayback-Snapshots:** kleine/private Seiten sind oft nicht archiviert – größere Domain nehmen.
- **`whatweb -a 3` ist aktiver/lauter:** gegen Fremdziele nicht ohne Erlaubnis; im Lab unkritisch.
