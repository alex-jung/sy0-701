# Übung 09 – Pretexting & vollständiges Szenario

**Schwierigkeit: 9/10 · Dauer: ca. 75 Min.**

## Lernziele

- Ein mehrstufiges, kanalübergreifendes SE-Szenario planen (OSINT → Pretext → Multi-Kanal)
- Pretexting über mehrere Kontaktpunkte konsistent halten
- Erfolgskriterien und Abbruch-/Safety-Regeln definieren
- Das Szenario in Erkennung/Abwehr übersetzen

## Theorie

Fortgeschrittenes Social Engineering ist selten eine einzelne Mail, sondern ein **Szenario**: ein konsistenter **Pretext**, der über **mehrere Kanäle** (E-Mail, Telefon, ggf. physisch) und **mehrere Schritte** aufgebaut wird, um Vertrauen zu gewinnen und zur Zielhandlung zu führen (z. B. Zahlung, Zugang, Datenherausgabe). Beispiel BEC: OSINT → gefälschte Mail des „CFO" → Follow-up-Anruf („wie besprochen") → dringende Überweisung.

Für ein **autorisiertes Red-Team/Awareness-Engagement** braucht es: definierten **Scope**, **Erfolgskriterien** (was gilt als „kompromittiert"), **Safety/Abbruch** (keine echte Schädigung, informierte Rahmenbedingungen), **Dokumentation**.

**In diesem Kurs:** Planung/Analyse eines Szenarios gegen die **eigene/fiktive** Organisation; die aktive Durchführung nur im Rahmen eines autorisierten Programms mit informierten Teilnehmern.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| theHarvester/OSINT | Pretext-Material (eigene Org) |
| GoPhish/SET | Mail-/Landing-Teil (autorisiert, Lab) |
| Skript-Vorlagen | Multi-Kanal-Konsistenz |

## Lab-Setup

- Eigene/fiktive Zielorganisation, eigene Test-Teilnehmer. Kombination der Bausteine aus Übung 02–07.

## Aufgabe (selbst lösen)

1. Definiere ein **Szenario** (z. B. „Lieferanten-BEC" oder „IT-Migration") mit Zielhandlung und Erfolgskriterium.
2. Baue den **Pretext** über mind. **zwei Kanäle** konsistent (z. B. Mail + Follow-up-Anruf) – welche Prinzipien ziehen sich durch?
3. Lege **Safety-/Abbruch-Regeln** und **Scope** fest (wie bei einem echten Engagement).
4. Skizziere den **Ablauf** Schritt für Schritt (Kontaktpunkte, erwartete Reaktionen, Eskalation).
5. Übersetze das Szenario in **Detection/Abwehr**: an welchen Punkten hätte es auffallen/gestoppt werden müssen?

**Ziel:** ein durchdachtes, mehrstufiges SE-Szenario (autorisiert/fiktiv) mit Erfolgskriterien, Safety-Regeln und einer Abwehr-Analyse.

## SY0-701 Prüfungsbezug

- **Pretexting**, **BEC**, Multi-Kanal-SE, Red-Team-Engagement (Scope/Rules of Engagement).
- **Detection/Abwehr an mehreren Punkten:** Vier-Augen-Prinzip, Verifikation, Prozesse, Awareness.
- Begriffe: *pretexting*, *BEC*, *rules of engagement*, *separation of duties / dual control*, *verification process*.
