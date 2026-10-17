# Übung 02 – OSINT & Pretext-Building

**Schwierigkeit: 2/10 · Dauer: ca. 45 Min.**

## Lernziele

- OSINT gezielt für Social Engineering nutzen (Verbindung zu `reconnaissance`)
- Aus öffentlichen Infos einen glaubwürdigen Vorwand (Pretext) bauen
- Verstehen, wie wenig öffentliche Daten für überzeugende Angriffe reichen
- Daraus Abwehr ableiten (Datensparsamkeit, Awareness)

## Theorie

Gezieltes Social Engineering (Spear/Whaling/BEC) steht und fällt mit dem **Pretext** – einer glaubwürdigen Geschichte/Identität. Material dafür liefert **OSINT**:
- **Organisation:** Website, Impressum, Pressemitteilungen, Stellenanzeigen (verraten Tools/Tech), Org-Struktur.
- **Personen (rollenbasiert!):** Namen/Funktionen, E-Mail-Schema (aus `reconnaissance`), öffentliche Profile/Posts, Events.
- **Kontext:** aktuelle Projekte, Lieferanten, Abwesenheiten (Urlaub → „Vertretung").

Daraus entsteht ein Pretext wie „Ich bin vom neuen externen IT-Dienstleister X und brauche …". **Wichtig in diesem Kurs:** Wir üben das **Prinzip** und die **Abwehr** – nicht das Ausspähen realer Einzelpersonen. Nutze die **eigene** Organisation/Test-Identitäten.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `theHarvester` | Mails/Hosts/Namensschema (eigene Domain) |
| Suchmaschine | öffentliche Firmeninfos |
| (Konzept) | Pretext-Strukturierung |

## Lab-Setup

- Kali + Internet. Ziel = **deine eigene** Organisation/Domain oder eine fiktive Test-Firma.

## Aufgabe (selbst lösen)

1. Sammle (für deine **eigene** Domain) das E-Mail-Namensschema und öffentlich sichtbare Rollen/Infos.
2. Leite daraus ab, welche **Pretexte** plausibel wären (ohne reale Einzelpersonen zu adressieren).
3. Baue **einen** Beispiel-Pretext strukturiert: Wer gibst du vor zu sein, warum, welche Bitte, welcher Druck (Prinzip aus Übung 01)?
4. Identifiziere, welche öffentlichen Infos den Pretext ermöglicht haben.
5. Leite konkrete **Datensparsamkeits-/Awareness-Maßnahmen** ab, die genau diese Infos reduzieren.

**Ziel:** ein strukturierter, aus OSINT abgeleiteter Beispiel-Pretext (gegen die eigene/fiktive Org) plus Maßnahmen, die ihn erschweren.

## SY0-701 Prüfungsbezug

- **OSINT als Vorbereitung** von Spear Phishing/Pretexting/BEC.
- **Information disclosure / Datensparsamkeit** (weniger öffentlich = schwerer anzugreifen).
- **Awareness** gegen Pretext-Angriffe.
- Begriffe: *OSINT*, *pretexting*, *spear phishing*, *information disclosure*, *data minimization*.
