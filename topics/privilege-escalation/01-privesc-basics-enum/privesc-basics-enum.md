# Übung 01 – PrivEsc-Grundlagen & manuelle Linux-Enumeration

**Schwierigkeit: 1/10 · Dauer: ca. 40 Min.**

## Lernziele

- Horizontale vs. vertikale Privilege Escalation unterscheiden
- Die wichtigsten manuellen Enumeration-Checks auf Linux kennen
- Aus den Ergebnissen potenzielle PrivEsc-Vektoren ableiten
- Verstehen, warum gründliche Enumeration der halbe PrivEsc ist

## Theorie

**Privilege Escalation** = aus einem Zugang mehr Rechte gewinnen:
- **vertikal:** vom normalen User zu root/Admin (mehr Macht).
- **horizontal:** zu einem anderen gleichrangigen User (fremde Daten/Session).

Der erste Schritt ist immer **Enumeration** – das System systematisch nach Fehlkonfigurationen/Schwachstellen absuchen. Wichtige manuelle Checks:

| Check | Befehl |
|-------|--------|
| Wer bin ich / Gruppen | `id`, `whoami`, `groups` |
| sudo-Rechte | `sudo -l` |
| SUID/SGID-Binaries | `find / -perm -4000 -type f 2>/dev/null` |
| Cron Jobs | `cat /etc/crontab`, `ls -la /etc/cron.*` |
| Writable sensible Dateien | `ls -la /etc/passwd /etc/shadow` |
| Kernel/OS | `uname -a`, `cat /etc/os-release` |
| Laufende Dienste/Prozesse | `ps aux`, `netstat -tulpn` |
| Interessante Dateien | `find / -writable 2>/dev/null`, History-/Config-Dateien |

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Standard-Coreutils | `id`, `find`, `ps`, `sudo`, `cat`, `ls`, `uname` |

## Lab-Setup

- Eine unprivilegierte Shell auf einem Linux-Ziel (z. B. `www-data` via Web-Exploit, oder lokaler Low-Priv-User). Snapshot.

## Aufgabe (selbst lösen)

1. Bestimme deinen aktuellen User, deine Gruppen und ob du `sudo`-Rechte hast.
2. Liste alle **SUID-Binaries** und markiere ungewöhnliche (nicht Standard).
3. Finde Cron Jobs und prüfe, ob eins davon ein **von dir beschreibbares** Skript ausführt.
4. Prüfe die Rechte an `/etc/passwd` und `/etc/shadow` – lesbar/schreibbar?
5. Erstelle eine priorisierte Liste potenzieller **PrivEsc-Vektoren** aus deinen Funden (ohne sie schon auszunutzen).

**Ziel:** eine manuelle Enumeration-Checkliste abgearbeitet und eine priorisierte Vektor-Liste erstellt – die Grundlage aller folgenden Übungen.

## SY0-701 Prüfungsbezug

- **Privilege escalation (horizontal/vertical)** als Angriffsphase.
- **Misconfiguration / least privilege** – die meisten PrivEsc-Vektoren sind Fehlkonfigurationen.
- **Enumeration** als methodischer Schritt.
- Begriffe: *privilege escalation*, *least privilege*, *SUID*, *misconfiguration*, *enumeration*.
