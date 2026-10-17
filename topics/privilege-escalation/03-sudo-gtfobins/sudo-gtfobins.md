# Übung 03 – Sudo-Misconfigurations & GTFOBins

**Schwierigkeit: 3/10 · Dauer: ca. 50 Min.**

## Lernziele

- `sudo -l` auswerten und Misconfigurations erkennen
- GTFOBins nutzen, um erlaubte Programme zur Shell-Eskalation zu missbrauchen
- Den Unterschied „Programm darf als root laufen" vs. „sicher" verstehen
- sudo-Härtung (least privilege, `NOEXEC`, keine Shell-Escapes) kennen

## Theorie

`sudo` erlaubt, bestimmte Befehle als root (oder anderer User) auszuführen. Gefährlich wird es, wenn ein Programm erlaubt ist, das **eine Shell starten oder Dateien lesen/schreiben** kann – dann eskaliert man trivial zu root.

**GTFOBins** (gtfobins.github.io) katalogisiert, wie Standard-Binaries für PrivEsc/Shell-Escape missbraucht werden. Beispiele: `vim`, `less`, `find`, `awk`, `python`, `nmap`, `tar`, `man` können (sudo-erlaubt) eine root-Shell öffnen.

Auch `sudo` selbst hatte CVEs (z. B. **Baron Samedit CVE-2021-3156**, `sudoedit -s`) – unabhängig von der Konfiguration.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `sudo -l` | erlaubte sudo-Befehle anzeigen |
| GTFOBins (Web) | Missbrauchs-Rezept je Binary |

## Lab-Setup

- Linux-Ziel, bei dem der aktuelle User per `sudo` ein shell-fähiges Programm ausführen darf (ggf. selbst setzen, z. B. `user ALL=(ALL) NOPASSWD: /usr/bin/find`). Snapshot.

## Aufgabe (selbst lösen)

1. Lies mit `sudo -l`, welche Befehle du als root ausführen darfst.
2. Suche eines dieser Programme in GTFOBins unter „Sudo" und eskaliere zu einer **root-Shell**. Belege mit `id`.
3. Falls `env_keep`/`LD_PRELOAD` erlaubt ist: demonstriere den `LD_PRELOAD`-Weg (Konzept).
4. Prüfe die sudo-Version auf bekannte CVEs (z. B. Baron Samedit) – betroffen oder nicht?
5. Erkläre, warum „Programm X als root erlauben" so oft zu vollem root führt.

**Ziel:** über eine sudo-Misconfiguration + GTFOBins eine root-Shell erlangt und das Prinzip verstanden.

## SY0-701 Prüfungsbezug

- **Misconfiguration / least privilege**: zu weit gefasste sudo-Regeln.
- **Living-off-the-land**: legitime Binaries als Angriffswerkzeug (GTFOBins/LOLBAS).
- **Patch-Management**: sudo-CVEs.
- Begriffe: *privilege escalation*, *least privilege*, *living off the land (LOLBins)*, *misconfiguration*.
