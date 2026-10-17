# Übung 03 – Web-Footprinting & Technology Fingerprinting

**Schwierigkeit: 3/10 · Dauer: ca. 45 Min.**

## Lernziele

- Die eingesetzte Web-Technologie eines Ziels bestimmen (Server, CMS, Frameworks)
- HTTP-Header, `robots.txt`, `sitemap.xml` und Fehlerseiten als Infoquelle nutzen
- Eine vorgelagerte **WAF** erkennen
- Historische Stände über das Wayback-Archiv finden

## Theorie

Bevor man eine Webapp angreift, bestimmt man ihren **Stack**: Webserver (Apache/nginx/IIS), Sprache (PHP/ASP.NET), CMS (WordPress/Joomla), JS-Frameworks, CDN/WAF. Quellen sind meist **semi-passiv** (ein HTTP-Request reicht):

- **HTTP-Response-Header:** `Server`, `X-Powered-By`, `Set-Cookie` (z. B. `PHPSESSID`), Security-Header.
- **`robots.txt` / `sitemap.xml`:** verraten oft versteckte Pfade (Admin-Panels, Backups).
- **Fehlerseiten / Banner:** Versions-/Stack-Hinweise.
- **`wafw00f`:** erkennt Web Application Firewalls anhand von Fingerprints.
- **Wayback Machine:** alte Versionen, verschwundene Seiten, frühere Pfade.

Semi-passiv heißt: Du kontaktierst zwar den Webserver (ein Request), aber harmlos wie ein normaler Besucher – keine Angriffe.

## Verwendete Tools

| Tool | Zweck | Wichtige Optionen |
|------|-------|-------------------|
| `whatweb` | Tech-Fingerprinting | `whatweb <url>`, `-a 3` (aggressiver), `-v` |
| `curl` | Header/robots abrufen | `-I` (nur Header), `-sS`, `-L` (folgt Redirects) |
| `wafw00f` | WAF-Erkennung | `wafw00f <url>`, `-a` (alle Checks) |
| `httpx` (optional) | schnelle Web-Probes | `-title -tech-detect -status-code` |

## Lab-Setup

- Für aktive/aggressivere Teile: **DVWA / Metasploitable-Webserver** im Lab oder `scanme.nmap.org`.
- Für passive Teile (Wayback): beliebige öffentliche Domain (nur Lesen).

## Aufgabe (selbst lösen)

1. Bestimme für dein Web-Ziel (DVWA/Lab) **Webserver + Version**, **Sprache/Framework** und – falls vorhanden – das **CMS**. Nutze dafür Header **und** `whatweb`.
2. Rufe `robots.txt` und (falls vorhanden) `sitemap.xml` ab. Welche Pfade werden „versteckt"/disallowed – und warum ist das für einen Angreifer interessant?
3. Prüfe die **Security-Header** (`X-Frame-Options`, `Content-Security-Policy`, `Strict-Transport-Security`). Welche fehlen?
4. Teste mit `wafw00f`, ob eine **WAF** vorgeschaltet ist.
5. Finde über die **Wayback Machine** einen älteren Stand einer öffentlichen Seite und notiere eine Info, die heute nicht mehr sichtbar ist.

**Ziel:** ein Technologie-Steckbrief des Web-Ziels (Stack, versteckte Pfade, Security-Header, WAF ja/nein) als Grundlage für spätere Web-Exploitation.

## SY0-701 Prüfungsbezug

- **Footprinting / enumeration** der Angriffsfläche einer Webanwendung.
- **Security-Header & WAF** als Mitigations (Domäne 3.0/4.0): HSTS, CSP, X-Frame-Options; WAF als *compensating control*.
- **Information disclosure** durch Banner/`X-Powered-By`/`robots.txt` – und das Härten dagegen (Banner unterdrücken, *security by obscurity* als *zusätzliche*, nicht alleinige Maßnahme).
- Begriffe: *banner grabbing*, *WAF*, *security headers (HSTS/CSP)*, *information disclosure*, *attack surface*.
