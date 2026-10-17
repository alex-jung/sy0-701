# Lösung – Übung 01: Manuelle Linux-Enumeration

## 1. User / Gruppen / sudo

```bash
id; whoami; groups
sudo -l            # was darf ich als sudo? (ggf. ohne Passwort)
```
`id` zeigt interessante Gruppen (z. B. `docker`, `lxd`, `sudo`, `adm` → spätere Vektoren).

## 2. SUID-Binaries

```bash
find / -perm -4000 -type f 2>/dev/null
```
Standard (unkritisch): `passwd`, `su`, `sudo`, `mount`, `ping`. **Verdächtig**: `nmap`, `find`, `vim`, `python`, `cp`, `bash`, `nano`, `less` → sind in GTFOBins für PrivEsc nutzbar (Übung 03/04).

## 3. Cron Jobs

```bash
cat /etc/crontab
ls -la /etc/cron.d /etc/cron.daily /etc/cron.hourly
# laufende Cron-Prozesse live beobachten (Übung 02: pspy)
```
Kritisch: ein als root laufendes Skript, das **du schreiben darfst** (`ls -la` auf den Skriptpfad) → PrivEsc (Übung 05).

## 4. passwd / shadow

```bash
ls -la /etc/passwd /etc/shadow
```
- `/etc/passwd` **schreibbar** → eigenen root-User eintragen (Übung 06).
- `/etc/shadow` **lesbar** → Hashes cracken (Thema password-attacks).

## 5. Vektor-Liste (Beispiel)

```
[HIGH] sudo -l: (ALL) NOPASSWD: /usr/bin/find   -> GTFOBins (Übung 03)
[HIGH] SUID auf /usr/bin/python                  -> GTFOBins (Übung 04)
[MED ] cron: /opt/backup.sh (root, von mir schreibbar) -> Übung 05
[MED ] in Gruppe 'docker'                        -> Übung 07
[LOW ] /etc/shadow lesbar                         -> Hashes cracken
```

## Härtung

- **least privilege**: keine unnötigen sudo-/SUID-Rechte, keine User in `docker`/`lxd` ohne Grund.
- sensible Dateien korrekt (`/etc/passwd` 644 root, `/etc/shadow` 640 root:shadow), Cron-Skripte nicht world-writable.

## Häufige Fehler / Troubleshooting

- **`sudo -l` fragt Passwort:** als `www-data` o. ä. kein Passwort bekannt → andere Vektoren; manche sudo-Regeln sind `NOPASSWD`.
- **`find`-Output riesig:** `2>/dev/null` gegen Fehler-Spam; auf ungewöhnliche Pfade achten.
- **Kein TTY:** erst Shell upgraden (`python3 -c 'import pty;pty.spawn("/bin/bash")'`) – Thema post-exploitation 01.
