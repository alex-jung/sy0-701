# wpscan

**Kategorie:** Web-App-Scanner (WordPress)

Spezialisierter WordPress-Sicherheitsscanner. Erkennt Core-Version, verwundbare **Plugins/Themes**, enumeriert **Benutzer** und gleicht gegen eine WordPress-Vulnerability-DB ab (CVE-Details per API-Token).

```bash
wpscan --url <wp-url> [Optionen]
```

## Wichtigste Optionen

| Option | Bedeutung |
|--------|-----------|
| `--url <url>` | Ziel-WordPress |
| `--enumerate <args>` | `vp` vuln plugins, `vt` vuln themes, `u` users, `ap`/`at` all plugins/themes, `cb` config backups |
| `--api-token <token>` | CVE-Details aus wpvulndb (kostenlos registrierbar) |
| `--passwords <liste> --usernames <user>` | Login-Brute-Force (nur Lab!) |
| `--random-user-agent` | UA variieren (gegen simple Blocks) |
| `-o <datei>` / `-f cli-no-color\|json` | Output |

## Beispiele

```bash
wpscan --url http://<WP>/ --enumerate vp,vt,u
wpscan --url http://<WP>/ --api-token <TOKEN> --enumerate vp
wpscan --url http://<WP>/ --passwords rockyou.txt --usernames admin   # nur autorisiert
```

## Hinweis

Aktiv/laut → nur eigene WordPress-Instanzen. WordPress-Lücken sitzen meist in **Plugins**, nicht im Core. Installation: `sudo apt install wpscan`.

## Verwendet in

vulnerability-scanning 08 (Web-App-Scanning).
