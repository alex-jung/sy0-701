# Übung 01 – SMTP User Enumeration

**Schwierigkeit: 1/10 · Dauer: ca. 30 Min.**

## Lernziele

- Den SMTP-Dialog grundlegend verstehen
- Mit `VRFY`, `EXPN` und `RCPT TO` gültige Benutzernamen am Mailserver ermitteln
- Enumeration manuell (netcat) und automatisiert (`smtp-user-enum`) durchführen
- Verstehen, warum gültige Usernamen für spätere Angriffe wertvoll sind

## Theorie

SMTP (Port 25) kennt Kommandos, mit denen ein Server verrät, ob ein **Benutzer existiert** – ideal zum Sammeln gültiger Logins:

- **`VRFY <user>`** – „verifiziere diesen Benutzer". Antwort `250` = existiert, `550` = nicht.
- **`EXPN <liste>`** – expandiert Mailinglisten/Aliase zu echten Adressen.
- **`RCPT TO:<user>`** (nach `MAIL FROM`) – viele Server akzeptieren nur existierende Empfänger → `250` vs. `550`.

Gültige Benutzernamen sind die halbe Miete für **Password-Spraying/Brute-Force** (Übungen später) und **Phishing**. Moderne Mailserver deaktivieren `VRFY`/`EXPN` meist – Metasploitable nicht, darum perfekt zum Üben.

## Verwendete Tools

| Tool | Zweck | Wichtige Optionen |
|------|-------|-------------------|
| `nc` (netcat) | manueller SMTP-Dialog | `nc <ziel> 25` |
| `telnet` | alternativer Dialog | `telnet <ziel> 25` |
| `smtp-user-enum` | automatisierte Enumeration | `-M <VRFY/EXPN/RCPT>`, `-U <userliste>`, `-t <ziel>` |
| `nmap` NSE | Bonus | `--script smtp-enum-users,smtp-commands` |

## Lab-Setup

- Metasploitable (Postfix auf Port 25). Ziel-IP aus `network-scanning` bekannt.
- Wortliste mit Usernamen (z. B. `/usr/share/seclists/Usernames/top-usernames-shortlist.txt`).

## Aufgabe (selbst lösen)

1. Verbinde dich **manuell** (netcat) auf Port 25 und lies das Banner. Welche Software/Version?
2. Teste mit `VRFY`, ob die User `root`, `msfadmin`, `user` und ein frei erfundener Name existieren. Woran erkennst du „existiert" vs. „existiert nicht"?
3. Prüfe, ob `EXPN` funktioniert.
4. Automatisiere die Enumeration mit `smtp-user-enum` und einer Userliste. Erstelle eine Liste **gültiger** Benutzer.
5. Erkläre, warum ein Verteidiger `VRFY`/`EXPN` abschalten sollte – und was trotzdem noch über `RCPT TO` leakt.

**Ziel:** eine Liste verifizierter SMTP-Benutzer, manuell *und* automatisiert gewonnen.

## SY0-701 Prüfungsbezug

- **Enumeration / information disclosure:** Dienste, die Existenz von Konten verraten (*account enumeration*), sind eine eigene Schwachstellenklasse.
- **Attack chain:** gültige Usernamen → Password-Spraying/Brute-Force → Credential Access. Gegenmaßnahme u. a. **MFA**, generische Fehlermeldungen.
- **Hardening:** `VRFY`/`EXPN` deaktivieren = *secure configuration baseline*.
- Begriffe: *account/user enumeration*, *information disclosure*, *password spraying*, *SMTP (25)*, *hardening*.
