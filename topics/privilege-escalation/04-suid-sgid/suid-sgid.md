# Übung 04 – SUID/SGID-Binaries

**Schwierigkeit: 4/10 · Dauer: ca. 50 Min.**

## Lernziele

- Das SUID/SGID-Konzept verstehen (Ausführung mit Datei-Eigentümer-Rechten)
- SUID-Binaries finden und auf Missbrauchbarkeit prüfen
- GTFOBins für SUID-Eskalation nutzen
- Eigene (absichtlich falsche) SUID-Binary ausnutzen

## Theorie

Das **SUID-Bit** (`-rwsr-xr-x`) lässt eine Binary mit den Rechten ihres **Eigentümers** laufen – bei root-eigenen Binaries also **als root**, egal wer sie startet. Nötig für legitime Fälle (`passwd` muss `/etc/shadow` schreiben), aber **gefährlich**, wenn eine SUID-Binary Shell-/Datei-Operationen erlaubt. **SGID** = analog mit Gruppenrechten.

Angriff: SUID-Binaries finden → prüfen, ob eine davon in **GTFOBins (SUID)** steht (`bash`, `find`, `cp`, `nano`, `vim`, `python`, `less`, …) → root-Shell. Auch **selbstgeschriebene** SUID-Programme, die unsicher `system()`/relative Pfade nutzen, sind angreifbar.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `find ... -perm -4000` | SUID-Binaries finden |
| GTFOBins (SUID) | Missbrauchs-Rezepte |

## Lab-Setup

- Linux-Ziel mit einer missbrauchbaren SUID-Binary (Metasploitable hat welche; oder selbst setzen: `chmod u+s /usr/bin/find`). Snapshot.

## Aufgabe (selbst lösen)

1. Finde alle SUID-Binaries und trenne Standard von ungewöhnlichen.
2. Wähle eine SUID-Binary aus GTFOBins (z. B. `find`, `cp`, `bash`, `python`) und eskaliere zu root. Belege mit `id`.
3. Demonstriere mit `cp` (SUID) den **alternativen** Weg: `/etc/passwd` manipulieren statt direkter Shell.
4. Analysiere eine selbstgeschriebene SUID-Binary, die `system("ls")` (ohne absoluten Pfad) aufruft – wie nutzt man **PATH-Hijacking** aus? (Überleitung zu Übung 05)
5. Erkläre, warum das SUID-Bit so sorgsam gesetzt werden muss.

**Ziel:** über eine SUID-Binary root erlangt – per GTFOBins und per Datei-Manipulation – und das Missbrauchsmuster verstanden.

## SY0-701 Prüfungsbezug

- **SUID/SGID** als Berechtigungskonzept und Angriffsfläche.
- **Least privilege / secure configuration**: SUID minimieren.
- **Living off the land** (GTFOBins).
- Begriffe: *SUID/SGID*, *privilege escalation*, *least privilege*, *insecure permissions*.
