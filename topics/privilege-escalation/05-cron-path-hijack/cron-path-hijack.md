# Übung 05 – Cron Jobs & PATH-/Wildcard-Hijacking

**Schwierigkeit: 5/10 · Dauer: ca. 55 Min.**

## Lernziele

- Unsichere Cron Jobs als PrivEsc-Vektor erkennen und ausnutzen
- Writable Script, relatives Binary (PATH) und Wildcard-Injection unterscheiden
- Mit `pspy` versteckte root-Cron-Jobs timing-genau treffen
- Cron-Härtung ableiten

## Theorie

Cron Jobs laufen oft **als root** periodisch. Drei typische Schwächen:

- **Writable Script:** der Job führt ein Skript aus, das **du beschreiben** darfst → du legst root-Code hinein.
- **PATH-Hijacking:** der Job ruft ein Binary **ohne absoluten Pfad** auf (`backup` statt `/usr/bin/backup`) und `PATH` enthält ein von dir beschreibbares Verzeichnis → du legst dort ein gleichnamiges Skript ab.
- **Wildcard-Injection:** der Job nutzt `*` (z. B. `tar -czf backup.tar.gz *`) in einem von dir beschreibbaren Verzeichnis → du legst Dateien an, deren **Namen als Optionen** interpretiert werden (z. B. `--checkpoint-action=exec=...` bei tar).

`pspy` zeigt die Jobs live (inkl. Intervall), auch wenn `crontab` sie nicht listet.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `pspy` | Cron/Prozesse live beobachten |
| Standard-Tools | Skript/PATH/Wildcard manipulieren |

## Lab-Setup

- Linux-Ziel mit einem root-Cron-Job, der (a) ein writable Skript, (b) ein relatives Binary oder (c) eine Wildcard nutzt (ggf. selbst einrichten). Snapshot.

## Aufgabe (selbst lösen)

1. Finde mit `pspy`/`cat /etc/crontab` einen **root-Cron-Job** und bestimme Skript/Intervall.
2. **Writable Script:** ist das ausgeführte Skript beschreibbar? Baue einen Reverse-Shell-/SUID-Payload hinein und warte auf die Ausführung.
3. **PATH-Hijacking:** ruft der Job ein Binary ohne Pfad auf? Lege ein gleichnamiges Skript in ein beschreibbares PATH-Verzeichnis.
4. **Wildcard-Injection:** nutzt der Job `tar * ` o. ä. in einem beschreibbaren Ordner? Platziere passende „Options-Dateien".
5. Erkläre je Variante die Gegenmaßnahme.

**Ziel:** über einen unsicheren root-Cron-Job (mind. eine der drei Varianten) root erlangt.

## SY0-701 Prüfungsbezug

- **Scheduled tasks / cron** als PrivEsc-Vektor; **insecure permissions** & **PATH**-Probleme.
- **Wildcard/argument injection** als Angriffsmuster.
- **Hardening:** absolute Pfade, feste PATH, keine writable root-Skripte.
- Begriffe: *privilege escalation*, *cron/scheduled task*, *PATH hijacking*, *wildcard injection*, *insecure permissions*.
