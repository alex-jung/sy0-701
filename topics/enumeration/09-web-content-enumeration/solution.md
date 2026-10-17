# Lösung – Übung 09: Web Content & Directory Enumeration

`<URL>` = z. B. `http://<ZIEL>/`.

## 1. Directory-Enumeration

```bash
gobuster dir -u <URL> -w /usr/share/seclists/Discovery/Web-Content/directory-list-2.3-medium.txt -t 50
```
Typische Funde (Metasploitable/DVWA):
```
/dvwa        (Status: 301)
/phpmyadmin  (Status: 301)
/phpinfo.php (Status: 200)
/test        (Status: 301)
```

## 2. Mit Extensions

```bash
gobuster dir -u <URL> -w <liste> -x php,txt,bak,zip,old,conf -t 50
```
Findet z. B. `config.inc.php`, `backup.zip`, `index.php.bak`. `.bak`/`.old`-Dateien enthalten oft Quellcode/Credentials.

## 3. Recursion

```bash
feroxbuster -u <URL> -w <liste> -x php,txt -d 2
# -d 2 = bis Tiefe 2 rekursiv; feroxbuster recursiert gefundene Verzeichnisse automatisch
```
Oder gefundenes Verzeichnis gezielt:
```bash
gobuster dir -u <URL>dvwa/ -w <liste> -x php
```

## 4. ffuf mit Filtern

```bash
ffuf -u <URL>FUZZ -w /usr/share/seclists/Discovery/Web-Content/raft-medium-directories.txt \
     -mc 200,301,302,401,403        # nur diese Statuscodes zeigen
# Rauschen (Soft-404) wegfiltern nach Größe:
ffuf -u <URL>FUZZ -w <liste> -fs 1234      # Responses mit Größe 1234 ausblenden
ffuf -u <URL>FUZZ -w <liste> -fc 404       # 404 ausblenden
```
`-mc` = match codes, `-fc` = filter codes, `-fs` = filter size. So entfernt man generische „existiert nicht"-Antworten.

## 5. VHost-Fuzzing

```bash
ffuf -u http://<ZIEL>/ -H "Host: FUZZ.<domain>" -w /usr/share/seclists/Discovery/DNS/subdomains-top1million-5000.txt -fs <größe-der-default-seite>
# gobuster-Variante:
gobuster vhost -u http://<ZIEL> -w <liste> --append-domain
```
Verschiedene `Host:`-Header liefern unterschiedliche Inhalte, wenn der Webserver **name-based virtual hosting** betreibt (mehrere Sites auf einer IP). Treffer erkennt man an abweichender Response-Größe/Status.

## 6. Statuscodes interpretieren

- **200 OK** – Ressource existiert und ist abrufbar (bester Fund).
- **301/302 Redirect** – existiert, leitet weiter (oft Verzeichnis ohne `/`).
- **403 Forbidden** – existiert, aber Zugriff verboten → interessant (da vorhanden!).
- **401 Unauthorized** – Auth nötig → Login-Ziel.
- **404 Not Found** – nicht vorhanden (Grundrauschen, wegfiltern).

## Härtung

- Keine Backups/Configs/Panels im Webroot; `.bak/.old/.zip` entfernen.
- Admin-Bereiche hinter Auth/ACL/VPN; einheitliche `404` statt `403` (weniger Info).
- **WAF** + Rate-Limiting gegen Brute-Force; Directory-Listing aus.

## Häufige Fehler / Troubleshooting

- **Tools/Wortlisten fehlen:** `sudo apt install gobuster ffuf feroxbuster seclists`.
- **Alles 200 (Soft-404):** App liefert für alles Status 200 → nach Response-**Größe** filtern (`-fs`) oder `--exclude-length`.
- **Zu langsam/Ziel überlastet:** Threads senken (`-t 20`), kleinere Liste; im Lab mit kleinen VMs moderat.
- **HTTPS-Zertifikat:** `-k` (gobuster/ffuf) für Self-signed.
