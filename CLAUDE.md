# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Zweck dieses Repos

Praxis-Übungen für die **CompTIA Security+ SY0-701** Prüfung sowie allgemeine Cybersecurity-/Hacking-Praxis. Das Repo ist **keine Software**, sondern eine strukturierte Sammlung von Lern-Übungen (Markdown + Beispieldateien), die im eigenen Home-Lab durchgeführt werden.

Alle Übungen sind für **autorisiertes Testen im eigenen, isolierten Lab** gedacht. Jede Übung geht davon aus, dass Angriffe ausschließlich gegen eigene Lab-Ziele laufen.

## Lab-Umgebung des Users

- **Mini-PC mit Proxmox** als Virtualisierungs-Host
- **OPNsense** als Firewall/Router (Lab-Netz-Segmentierung)
- **Kali Linux** als Angreifer-/Pentest-VM
- **Verwundbare Ziele:** Metasploitable und DVWA vorhanden/geplant
- Weitere verwundbare VMs bei Bedarf → in der Übung angeben, welche VM nötig ist und wie man sie aufsetzt

Wenn eine Übung ein Ziel braucht, das es noch nicht gibt (z. B. Windows/AD), muss die Übung einen kurzen Setup-Abschnitt enthalten.

## Sprache

Erklärungen auf **Deutsch**, Fachbegriffe und Akronyme auf **Englisch** (so wie sie in der Prüfung und in Tools vorkommen), z. B. *Lateral Movement*, *Privilege Escalation*, *CVE*, *IoC*. Keine Eindeutschung von etablierten Tool-/Konzeptnamen.

## Verzeichnis- und Dateistruktur

Pro Thema ein Ordner unter `topics/`. Darin **10 Übungs-Unterordner**, von Schwierigkeit 1 (einfach) bis 10 (schwer):

```
topics/
  <thema-slug>/
    README.md                 # Themen-Übersicht: Lernziele, SY0-701-Domänen, Übungsliste, Lab-Voraussetzungen
    01-<uebung-slug>/
      <uebung-slug>.md        # die Übung (Theorie, Aufgabe, Tools, Prüfungsbezug)
      solution.md             # vollständige Lösung – getrennt gehalten
      <zusatzdateien>         # optional: Beispiel-Code, Configs, Scripts, Capture-Dateien
    02-<uebung-slug>/
      ...
    10-<uebung-slug>/
```

Regeln:
- Ordner-Präfix immer zweistellig (`01`..`10`) = Schwierigkeitsgrad und Reihenfolge.
- `solution.md` liegt **im selben Ordner** wie die Übung, aber als eigene Datei → beim Lösen einer Übung werden nicht versehentlich spätere Lösungen gesehen.
- Slugs in Kleinbuchstaben mit Bindestrich, englisch (z. B. `arp-spoofing`, `password-cracking`).

## Aufbau einer Übungsdatei (`<uebung-slug>.md`)

Jede Übungsdatei hält diese Reihenfolge ein:

1. **Titel + Schwierigkeit** (`Schwierigkeit: X/10`) und geschätzte Dauer
2. **Lernziele** – was man danach kann
3. **Theorie** – kompakte Erklärung des Konzepts
4. **Verwendete Tools** – Tool-Name, kurze Beschreibung, relevante Flags/Syntax
5. **Lab-Setup** – welche VMs/Netze nötig sind, ggf. wie aufsetzen
6. **Aufgabe (selbst lösen)** – ein klar abgegrenzter Teil, den der User **selbst** ohne Lösung bearbeiten soll; mit konkretem, prüfbarem Ziel (z. B. „finde die offenen Ports und den Dienst auf Port X")
7. **SY0-701 Prüfungsbezug** – welche Exam-Domäne/-Objectives dieses Thema abdeckt, typische Prüfungsfragen/-fallen und Begriffe, die man kennen muss

Die zugehörige **`solution.md`** enthält: vollständige Befehle/Schritte, erwartete Ausgaben, Erklärung *warum*, und häufige Fehler/Troubleshooting.

## Didaktik

- Schwierigkeit steigt pro Thema monoton von 1 → 10 (frühe Übungen: geführt, viele Hinweise; späte: offener, mehrere Schritte kombinieren).
- Jede Übung ist eigenständig durchführbar, baut aber thematisch auf den vorherigen auf.
- Die „Aufgabe (selbst lösen)"-Sektion darf die Lösung nicht verraten; Hinweise ja, Antworten nein.

## Tool-Referenz (`tools/`)

`tools/` enthält pro verwendetem Tool eine `.md` (Zweck + wichtigste Optionen) und eine Index-`README.md`. Wird in einer neuen Übung ein Tool benutzt, das dort noch fehlt, **neue `tools/<tool>.md` anlegen** und in `tools/README.md` eintragen. Jede Tool-Datei nennt am Ende, in welchen Übungen das Tool vorkommt.

## Themen-Roadmap (`topics/ROADMAP.md`)

`topics/ROADMAP.md` listet alle geplanten Themen mit Status (⬜/🟡/✅), SY0-701-Domäne und Lab-Voraussetzungen. Beim Anlegen/Fertigstellen eines Themas **dort den Status aktualisieren**.

## Neues Thema anlegen

Zum Erstellen eines kompletten Themas (README + 10 Übungen mit Lösungen) den Agenten **`exercise-builder`** verwenden. Er kennt die Struktur-, Sprach- und Didaktik-Regeln oben. Beispiel-Trigger: „Erstelle ein Thema `network-scanning`" oder „Baue 10 Übungen zum Thema Password Cracking".
