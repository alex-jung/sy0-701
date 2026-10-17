# Lösung – Übung 02: John the Ripper

## 0. rockyou vorbereiten

```bash
sudo gunzip -k /usr/share/wordlists/rockyou.txt.gz   # falls noch gepackt
```

## 1. DVWA-Hashes cracken

Datei `dvwa.hash` (nur die Hashes, einer pro Zeile – oder `user:hash`):
```
5f4dcc3b5aa765d61d8327deb882cf99
e99a18c428cb38d5f260853678922e03
8d3533d75ae2c3966d7e0d4fcc69216b
```
```bash
john --format=raw-md5 --wordlist=/usr/share/wordlists/rockyou.txt dvwa.hash
```
```
password         (?)
abc123           (?)
charley          (?)
```

## 2. Geknackte anzeigen

```bash
john --format=raw-md5 --show dvwa.hash
```
Zeigt `hash:klartext`. Pot-File: `~/.john/john.pot` (gecrackte Hashes gespeichert → nicht erneut knacken).

## 3. Format erzwingen

```bash
john --format=raw-md5 --wordlist=rockyou.txt dvwa.hash
```
Bei blanken Hex-Hashes rät John sonst evtl. falsch (z. B. LM/NT vs. raw-MD5) oder fragt nach. Explizites `--format=` stellt sicher, dass der richtige Algorithmus verwendet wird → sonst „No password hashes loaded".

## 4. single-Modus

Datei `users.txt`:
```
admin:21232f297a57a5a743894a0e4a801fc3     # MD5 von "admin"
```
```bash
john --format=raw-md5 --single users.txt
```
`--single` bildet Kandidaten aus dem **Usernamen** (und GECOS/Realname) + Mangling-Regeln → knackt „admin:admin", „root:root123" etc. sofort, ohne Wortliste. Sehr effektiv gegen username-basierte Passwörter.

## 5. Warum Wortlisten so wirksam sind

Menschen wählen **reale Wörter, Namen, Muster** (`password`, `sommer2024`, `firmaname1`). `rockyou` (14 Mio. echte, geleakte Passwörter) deckt einen Großteil davon ab. Reiner Brute-Force wäre viel teurer – aber warum alles durchrechnen, wenn die meisten Passwörter in der Liste stehen?

## Gegenmaßnahmen

- Lange (>12–14 Zeichen), einzigartige Passwörter / Passphrasen; Passwort-Manager.
- Gegen „in Wortliste enthalten": Sperrlisten bekannter/geleakter Passwörter (z. B. HIBP).
- Langsame Hashes (bcrypt) machen selbst Wortlisten-Angriffe teuer.

## Häufige Fehler / Troubleshooting

- **„No password hashes loaded":** falsches `--format` → mit `hashid`/`john --list=formats` prüfen.
- **Nichts geknackt:** Passwort nicht in der Liste → andere Liste/Rules (Übung 07).
- **„No password hashes left to crack" sofort:** schon im Pot → `--show` nutzen oder `~/.john/john.pot` leeren.
- **shadow-Format:** `unshadow` nötig (Übung 04).
