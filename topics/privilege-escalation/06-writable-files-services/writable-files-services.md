# Übung 06 – Writable Files, /etc/passwd & Service-Fehler

**Schwierigkeit: 6/10 · Dauer: ca. 55 Min.**

## Lernziele

- Unsichere Dateiberechtigungen systematisch zu PrivEsc nutzen
- Writable `/etc/passwd`/`/etc/shadow`/`sudoers` ausnutzen
- Fehlkonfigurierte systemd-Services (writable unit/ExecStart-Binary) missbrauchen
- Credentials in Konfig-/History-Dateien finden und wiederverwenden

## Theorie

Falsche Dateirechte sind ein PrivEsc-Dauerbrenner:

- **`/etc/passwd` writable:** eigenen root-User (UID 0) mit bekanntem Passwort eintragen.
- **`/etc/shadow` writable/lesbar:** Hash ersetzen bzw. cracken.
- **`sudoers`/`sudoers.d` writable:** sich selbst `NOPASSWD: ALL` geben.
- **systemd-Service:** eine **writable `.service`-Unit** oder ein **writable Binary** in `ExecStart=`, der als root (neu)gestartet wird → Code als root. Ebenso writable von root genutzte Libraries/Configs.
- **Credentials im Klartext:** in `.bash_history`, `config.php`, `.env`, Backup-Dateien, `wp-config.php` → oft root-/sudo-Passwörter.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `find -writable` / `ls -la` | schreibbare sensible Dateien finden |
| `openssl passwd` | Passwort-Hash für /etc/passwd |
| `grep`/`cat` | Credentials in Dateien suchen |
| `systemctl` | Service-Status/Restart (falls erlaubt) |

## Lab-Setup

- Linux-Ziel mit (absichtlich) einer schwachen Berechtigung: writable `/etc/passwd` **oder** writable `.service`/ExecStart-Binary **oder** Klartext-Creds in einer Config. Snapshot.

## Aufgabe (selbst lösen)

1. Suche gezielt nach **schreibbaren** sensiblen Dateien (`/etc/passwd`, `sudoers.d`, systemd-Units) und von dir beschreibbaren Binaries, die root startet.
2. **Writable /etc/passwd:** trage einen root-UID-User mit eigenem Passwort ein und werde root.
3. **Writable Service:** manipuliere eine `.service`-Unit (oder ihr ExecStart-Binary) und bringe sie zum Neustart als root.
4. Durchsuche Config-/History-Dateien nach **Klartext-Credentials** und teste sie (z. B. `su`/`sudo`).
5. Nenne für jede Variante die Härtung.

**Ziel:** über eine unsichere Dateiberechtigung oder einen Service-Fehler root erlangt – plus mindestens ein gefundenes Credential.

## SY0-701 Prüfungsbezug

- **Insecure permissions / misconfiguration**; **least privilege**.
- **Hardcoded/Klartext-Credentials** als Schwachstelle (Secrets-Management).
- **systemd/Service-Hardening**.
- Begriffe: *insecure file permissions*, *privilege escalation*, *hardcoded credentials*, *secrets management*, *least privilege*.
