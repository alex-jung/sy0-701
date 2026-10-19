# Lösung – Übung 02: Passwort-Policies & Speicherung

## 1. shadow-Hash

```bash
sudo getent shadow alex
# alex:$6$Xy..salt..$hash....:19900:0:99999:7:::
```
Format `$id$salt$hash`: `$6$`=SHA-512-crypt, `$y$`=yescrypt (modern, Debian-Default), `$2b$`=bcrypt. Das Feld danach sind Aging-Werte (last change, min, max, warn).

## 2. pwquality

```bash
sudo apt install -y libpam-pwquality
# /etc/security/pwquality.conf:
#   minlen = 14
#   dictcheck = 1
#   maxrepeat = 3
sudo passwd testuser     # schwaches/woerterbuch-Passwort -> "BAD PASSWORD: ... too short / based on a dictionary word"
```

## 3. Aging (chage)

```bash
sudo chage -l alex                 # aktuelle Policy
sudo chage -M 365 -m 1 -W 14 alex  # Beispiel: max 365 Tage, warn 14
```
NIST 800-63B rät von **anlasslosen** Zwangswechseln ab (führt zu schwachen Mustern) → lange Max-Age oder Wechsel nur bei Verdacht/Breach; stattdessen Länge + Breach-Check + MFA.

## 4. Moderne Policy (Beispiel)

- **Tun:** Mindestlänge 12–14+, Passphrasen erlauben, gegen Breach-/Wörterbuchlisten prüfen, Passwort-Manager fördern, **MFA** verpflichtend.
- **Lassen:** erzwungener Zeichen-Mix, periodischer Zwangswechsel ohne Anlass, Hinweisfragen als „Faktor", Längenlimit nach oben (zu niedrig).

## Hinweise / Troubleshooting

- `pwquality` greift bei `passwd`/PAM-Login, nicht bei direktem `usermod -p`.
- `/etc/shadow` nur als root lesbar (gut so); `/etc/passwd` enthält **keine** Hashes mehr (`x`).
- yescrypt/sha512crypt sind für lokale Accounts ok; für Web-Apps eigenständig argon2/bcrypt (Übung `cryptography-basics` 08).
