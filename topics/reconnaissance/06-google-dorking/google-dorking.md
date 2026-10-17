# Übung 06 – Google Dorking / Search-Engine-Recon

**Schwierigkeit: 6/10 · Dauer: ca. 45 Min.**

## Lernziele

- Suchmaschinen gezielt als OSINT-Werkzeug einsetzen (Advanced Operators)
- Exponierte Dateien, Verzeichnislisten und Login-Panels über Dorks finden
- Die Google Hacking Database (GHDB) kennen
- Verstehen, wie man die eigene Organisation gegen Dorking absichert

## Theorie

**Google Dorking** (Google Hacking) nutzt erweiterte Such-Operatoren, um gezielt Dinge zu finden, die öffentlich indexiert, aber nicht offensichtlich sind: Konfigdateien, Backups, Verzeichnislisten, Login-Seiten, exponierte Dokumente. Es ist **passiv** gegenüber dem Ziel – du fragst die Suchmaschine, nicht den Server.

Wichtige Operatoren:

| Operator | Wirkung |
|----------|---------|
| `site:` | nur eine Domain (`site:example.com`) |
| `filetype:` / `ext:` | Dateityp (`filetype:pdf`, `ext:sql`) |
| `intitle:` / `allintitle:` | Wort im Seitentitel (`intitle:"index of"`) |
| `inurl:` / `allinurl:` | Wort in der URL (`inurl:admin`) |
| `intext:` | Wort im Seitentext |
| `cache:` | Google-Cache einer Seite |
| `-` / `OR` / `" "` | ausschließen / oder / exakte Phrase |

Die **Google Hacking Database (GHDB)** bei Exploit-DB sammelt tausende fertige Dorks nach Kategorie (Dateien mit Passwörtern, exponierte Geräte, Login-Portale …).

> ⚠️ Dorks **nur gegen die eigene Domain** anwenden bzw. als generische Technik üben. Keine fremden exponierten Daten herunterladen/missbrauchen.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Suchmaschine (Google/Bing/DuckDuckGo) | Advanced Operators |
| GHDB (exploit-db.com/google-hacking-database) | fertige Dork-Sammlung |
| `curl` (optional) | gefundene öffentliche Datei abrufen |

## Lab-Setup

- Kali/Browser + Internet. Übungsziel: **deine eigene Domain** mit `site:` – so bleibt es autorisiert und zeigt deinen echten öffentlichen Fußabdruck.

## Aufgabe (selbst lösen)

1. Formuliere einen Dork, der nur deine Domain durchsucht und **alle indexierten PDF-/Office-Dokumente** auflistet.
2. Baue einen Dork, der **offene Verzeichnislisten** findet (`intitle:"index of"`), eingeschränkt auf eine Domain.
3. Suche nach möglichen **Login-/Admin-Panels** (`inurl:`/`intitle:`).
4. Durchstöbere die **GHDB** und wähle 3 Dork-Kategorien, die für eine Firma gefährlich wären. Notiere je ein Beispiel.
5. **Blue-Team-Teil:** Wie verhinderst du, dass sensible Inhalte deiner Domain indexiert werden? Nenne mindestens zwei Maßnahmen.

**Ziel:** ein kleiner „Dork-Werkzeugkasten" + eine Liste dessen, was von deiner eigenen Domain öffentlich auffindbar ist – und wie man das reduziert.

## SY0-701 Prüfungsbezug

- **OSINT / passive reconnaissance** mit öffentlichen Suchindizes.
- **Information disclosure / data exposure:** indexierte Backups/Configs/Dokumente als Leak; Gegenmaßnahmen: `robots.txt` (begrenzt!), `X-Robots-Tag`, Auth, Entfernen aus dem Index, DLP.
- **Attack surface / footprinting**; GHDB als Threat-Intel-Ressource.
- Begriffe: *OSINT*, *information disclosure*, *data exfiltration/exposure*, *search engine indexing*, *security misconfiguration*.
