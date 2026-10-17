# Übung 06 – Online-Brute-Force mit Hydra

**Schwierigkeit: 6/10 · Dauer: ca. 55 Min.**

## Lernziele

- Online- von Offline-Angriffen unterscheiden
- Hydra gegen mehrere Protokolle einsetzen (SSH, FTP, HTTP-Form)
- Password Spraying vs. Brute-Force im Online-Kontext umsetzen
- Erkennen, warum Lockout/Rate-Limit/MFA online besonders wirksam sind

## Theorie

**Offline** (Übung 02–05): Angreifer hat den Hash → beliebig viele Versuche, nur durch Rechenleistung begrenzt, **unsichtbar** fürs Ziel.
**Online:** Angreifer probiert Logins **direkt am Dienst** → langsam, **laut/loggt**, und durch **Account Lockout/Rate-Limiting** stark bremsbar. Deshalb online meist **Password Spraying** (ein gutes Passwort gegen viele User, mit Pausen) statt klassischem Brute-Force (viele Passwörter gegen einen User → Lockout).

**Hydra** unterstützt viele Protokolle (SSH, FTP, SMB, RDP, HTTP-Form, …). Man braucht Userliste/-name, Passwortliste und beim Web-Form den **Fail-String**.

## Verwendete Tools

| Tool | Zweck | Wichtige Optionen |
|------|-------|-------------------|
| `hydra` | Online-Login-Brute | `-l/-L`, `-p/-P`, `-t`, `-f`, `-s`, `ssh`/`ftp`/`http-post-form` |

## Lab-Setup

- Metasploitable (SSH/FTP, bekannte Creds `msfadmin:msfadmin`), DVWA „Brute Force". `rockyou.txt`, Userlisten.

## Aufgabe (selbst lösen)

1. Brute-force den **SSH**-Login eines bekannten Lab-Users mit Hydra + kleiner Passwortliste.
2. Mache dasselbe für **FTP**.
3. Setze **Password Spraying** um: ein häufiges Passwort gegen eine **Userliste** – warum ist das online klüger als volle Brute-Force?
4. Brute-force das **DVWA-Login-Formular** (http-post/get-form mit Fail-String + Session-Cookie).
5. Erkläre, welche Verteidigungen (Lockout, Rate-Limit, MFA, fail2ban) deine Angriffe stoppen – und warum sie online wirksamer sind als offline.

**Ziel:** erfolgreiche Online-Logins über mehrere Protokolle + ein Spraying-Lauf, plus Verständnis der Online-Gegenmaßnahmen.

## SY0-701 Prüfungsbezug

- **Online vs. offline attacks**; **brute force vs. password spraying vs. credential stuffing**.
- **Account lockout, rate limiting, MFA, CAPTCHA, fail2ban** als Gegenmaßnahmen.
- **Detection:** viele fehlgeschlagene Logins = IoC (SIEM/Logging).
- Begriffe: *online password attack*, *password spraying*, *credential stuffing*, *account lockout*, *MFA*, *rate limiting*.
