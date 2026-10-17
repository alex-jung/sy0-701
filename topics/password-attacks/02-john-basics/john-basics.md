# Übung 02 – John the Ripper: Wortlisten-Angriff

**Schwierigkeit: 2/10 · Dauer: ca. 40 Min.**

## Lernziele

- John the Ripper (JtR) bedienen
- Einen Dictionary-(Wortlisten-)Angriff gegen Hashes fahren
- Hash-Format korrekt angeben und geknackte Passwörter anzeigen
- Den „single"/Incremental-Modus grob einordnen

## Theorie

**John the Ripper** ist ein vielseitiger, CPU-starker Passwort-Cracker. Angriffsmodi:

- **Wordlist/Dictionary** (`--wordlist`) – probiert Einträge einer Liste (schnell, deckt reale Passwörter gut ab).
- **Single crack** (`--single`) – nutzt Username/GECOS-Infos als Kandidaten (sehr effektiv bei „username=password").
- **Incremental** – echter Brute-Force über Zeichenräume (langsam, nur kurze Passwörter).

John erkennt viele Formate automatisch, man kann es aber mit `--format=` erzwingen. Geknackte Passwörter landen im „pot file" (`~/.john/john.pot`) und werden mit `--show` angezeigt.

## Verwendete Tools

| Tool | Zweck | Wichtige Optionen |
|------|-------|-------------------|
| `john` | Cracken | `--wordlist=`, `--rules`, `--format=`, `--single`, `--show`, `--incremental` |

## Lab-Setup

- Kali. Hashes aus Übung 01 / web-exploitation (DVWA-`users` als MD5). `rockyou.txt` entpackt.

## Aufgabe (selbst lösen)

1. Lege die DVWA-MD5-Hashes in eine Datei (`hash:nur-hash` oder `user:hash`-Format) und cracke sie mit John + `rockyou.txt`.
2. Zeige die geknackten Passwörter mit `--show` an.
3. Erzwinge testweise das **Format** (`--format=raw-md5`) und erkläre, warum die Format-Angabe wichtig sein kann.
4. Teste den **`--single`**-Modus an einem Datensatz mit `user:hash` (z. B. `admin:` mit Passwort „admin") – was macht single anders?
5. Erkläre, warum ein reiner Wortlisten-Angriff so oft erfolgreich ist.

**Ziel:** die DVWA-Hashes mit John geknackt und die Klartext-Passwörter angezeigt – plus Verständnis der John-Modi.

## SY0-701 Prüfungsbezug

- **Dictionary Attack** vs. Brute-Force; warum Wortlisten real so wirksam sind (schwache/wiederverwendete Passwörter).
- **Offline-Cracking** (Angreifer hat den Hash) vs. online.
- **Mitigation:** starke, lange, einzigartige Passwörter + langsame Hashes.
- Begriffe: *dictionary attack*, *offline password cracking*, *wordlist*, *password complexity/length*.
