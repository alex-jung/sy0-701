# Übung 06 – Memory- & Disk-Forensik

**Schwierigkeit: 6/10 · Dauer: ca. 80 Min.**

## Lernziele

- Ein RAM-Image erstellen und mit Volatility analysieren
- Flüchtige Artefakte finden (Prozesse, Verbindungen, Injektion, Credentials)
- Disk-Images untersuchen (Dateisystem, gelöschte Dateien, Artefakte)
- Memory- und Disk-Befunde zusammenführen

## Theorie

- **Memory-Forensik:** der RAM enthält, was auf der Platte fehlt – laufende/versteckte Prozesse, Netzwerkverbindungen, **fileless Malware** (z. B. Meterpreter/C2), entschlüsselte Daten, Keys, Befehlshistorie. **Volatility** (2/3) analysiert ein RAM-Image: `pslist/psscan` (Prozesse), `netscan` (Verbindungen), `malfind` (Injection), `cmdline`, `hashdump`.
- **Disk-Forensik:** Dateisystem, Zeitstempel (MACB), gelöschte/versteckte Dateien, Persistence-Artefakte, Browser-/Shell-History. **Sleuth Kit** (`fls`, `icat`, `mactime`), **Autopsy** (GUI).

Memory + Disk ergänzen sich: Memory zeigt den **aktuellen** Angriff (auch fileless), Disk die **Spuren/Artefakte** über Zeit. Immer an **Images/Kopien** arbeiten (Übung 05).

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `avml` / LiME | RAM-Image erstellen |
| `volatility3` | Memory-Analyse |
| Sleuth Kit (`fls`,`icat`,`mactime`) / Autopsy | Disk-Analyse |

## Lab-Setup

- Ein kompromittierter Lab-Host mit laufender Malware/Reverse-Shell (aus den offensiven Themen) – **isoliert, nicht ausgeschaltet**. RAM-Image + Disk-Image (Übung 05).

## Aufgabe (selbst lösen)

1. Erstelle ein **RAM-Image** (avml/LiME) des laufenden, isolierten Hosts.
2. Analysiere es mit **Volatility**: finde den **bösartigen Prozess**, seine **Netzverbindungen** (C2) und ggf. **Injection** (`malfind`).
3. Extrahiere die **Kommandozeile**/Argumente des Prozesses und – falls möglich – Hinweise auf Persistence.
4. Untersuche das **Disk-Image**: finde Persistence-Artefakte (cron/authorized_keys/service), verdächtige Dateien, ggf. **gelöschte** Dateien.
5. Führe Memory- und Disk-Befunde zu einer kohärenten Aussage zusammen (was lief, von wo, wie verankert).

**Ziel:** den bösartigen Prozess + C2 im RAM identifiziert und die zugehörigen Disk-Artefakte gefunden – ein verknüpftes Forensik-Ergebnis.

## SY0-701 Prüfungsbezug

- **Memory-/Disk-Forensik**, **fileless malware** im RAM, Artefakt-/Timeline-Analyse.
- **Volatility/Sleuth Kit**, MACB-Zeitstempel, gelöschte Dateien.
- Begriffe: *memory forensics*, *disk forensics*, *fileless malware*, *process injection*, *artifacts*.
