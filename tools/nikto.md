# nikto

**Kategorie:** Web-Vulnerability-Scanner

Scannt Webserver auf tausende bekannte verwundbare/Default-Dateien, veraltete Versionen, gefährliche Programme, fehlende Security-Header und Misconfigurations. Breiter, schneller Überblick – aber **laut** (viele Requests, leicht per IDS/WAF erkennbar).

```bash
nikto -h <ziel> [Optionen]
```

## Wichtigste Optionen

| Option | Bedeutung |
|--------|-----------|
| `-h <ziel>` | Ziel-Host/URL |
| `-p <ports>` | Port(s) |
| `-ssl` | HTTPS erzwingen |
| `-Tuning <x>` | Kategorie(n) eingrenzen (1 Files, 2 Misconfig, 3 Info-Disclosure, 4 Injection, 9 SQLi …) |
| `-o <datei> -Format <htm/csv/xml/json>` | Report exportieren |
| `-Display V` | verbose |
| `-useragent` / `-evasion` | UA setzen / IDS-Evasion-Techniken |

## Beispiele

```bash
nikto -h http://<ZIEL>/
nikto -h <ZIEL> -p 443 -ssl
nikto -h http://<ZIEL> -Tuning 2 -o nikto.html -Format htm
```

## Hinweis

Noisy, nicht auf Tarnung ausgelegt → nur autorisierte Ziele. Versions-Warnungen sind bei Distro-Backports oft False Positives (verifizieren). Vorinstalliert in Kali.

## Verwendet in

vulnerability-scanning 04 (Web-Scan), 09, 10.
