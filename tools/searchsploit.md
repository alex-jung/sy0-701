# searchsploit

**Kategorie:** Exploit-Recherche · **Teil von:** `exploitdb`

Offline-Suche in der **Exploit-DB** (lokal unter `/usr/share/exploitdb/`). Bildet erkannte Dienst-Versionen/CVEs auf verfügbare öffentliche Exploits und PoCs ab – zentral für Priorisierung (ist eine Lücke „weaponized"?).

```bash
searchsploit [Optionen] <suchbegriffe>
```

## Wichtigste Optionen

| Option | Bedeutung |
|--------|-----------|
| `<produkt version>` | Freitextsuche (z. B. `vsftpd 2.3.4`) |
| `--cve <id>` | nach CVE suchen |
| `-w` | Exploit-DB-Weblinks statt lokaler Pfade |
| `-x <pfad>` | Exploit anzeigen (read-only) |
| `-m <pfad>` | Exploit ins aktuelle Verzeichnis kopieren |
| `-j` | JSON-Ausgabe |
| `--exclude '<term>'` | Treffer ausschließen |
| `-u` | Exploit-DB aktualisieren |

## Beispiele

```bash
searchsploit -u
searchsploit samba 3.0
searchsploit --cve 2007-2447
searchsploit -x unix/remote/16320.rb
searchsploit -m unix/remote/16320.rb
```

## Hinweis

Nur Identifikation/Priorisierung – die Ausführung gehört ins Thema `exploitation-metasploit`. „Exploit vorhanden" ≠ „funktioniert ungeprüft". Installation: `sudo apt install exploitdb`.

## Verwendet in

vulnerability-scanning 03 (Versionen→Exploits), 09 (Verifikation), 10.
