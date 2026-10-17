# cewl

**Kategorie:** Wortlisten-Generator (zielbezogen)

Crawlt eine Website und baut aus den **vorkommenden Begriffen** eine Wortliste – ideal für zielspezifische Passwörter (Firmen-/Produktnamen, Fachjargon), besonders kombiniert mit Rules.

```bash
cewl [Optionen] <url>
```

## Wichtigste Optionen

| Option | Bedeutung |
|--------|-----------|
| `-d <n>` | Crawl-Tiefe |
| `-m <n>` | Mindest-Wortlänge |
| `-w <datei>` | Wortliste speichern |
| `--with-numbers` | Wörter mit Ziffern behalten |
| `-e --email_file <datei>` | E-Mail-Adressen sammeln |
| `--lowercase` | alles klein |
| `-a --meta_file <datei>` | Metadaten sammeln |

## Beispiele

```bash
cewl -d 2 -m 6 --with-numbers -w cewl.txt http://<ZIEL>/
cewl -e --email_file mails.txt http://<ZIEL>/
# dann mit Rules gegen Hashes:
hashcat -m 0 -a 0 ziel.hash cewl.txt -r /usr/share/hashcat/rules/best64.rule
```

## Hinweis

Nur eigene/freigegebene Websites crawlen. Rohe cewl-Liste wird erst mit Rules richtig stark. Installation: `sudo apt install cewl`.

## Verwendet in

password-attacks 08 (Custom-Wortlisten), 10; Bezug zu reconnaissance.
