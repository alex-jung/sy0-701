# Übung 08 – Custom-Wortlisten (crunch, cewl)

**Schwierigkeit: 8/10 · Dauer: ca. 60 Min.**

## Lernziele

- Gezielte, zielbezogene Wortlisten erstellen statt nur Standardlisten zu nutzen
- Mit `crunch` Zeichenraum-/Muster-basierte Listen generieren
- Mit `cewl` eine Wortliste aus der Website des Ziels scrapen
- OSINT-/zielbezogene Begriffe in effektive Passwort-Kandidaten verwandeln

## Theorie

Standardlisten (rockyou) decken Allgemeines ab – aber zielspezifische Passwörter (Firmenname, Produkte, Orte, Jahreszahlen) stehen dort oft nicht. **Custom-Wortlisten** schließen diese Lücke:

- **`cewl`** crawlt die Website des Ziels und baut eine Wortliste aus den **vorkommenden Begriffen** (Firmen-/Produktnamen, Fachjargon) – ideal in Kombination mit Rules (Übung 07).
- **`crunch`** erzeugt Listen nach **Länge/Zeichenraum/Muster** (z. B. alle 8-stelligen aus `[a-z0-9]`, oder festes Muster `Firma@@@@` ). Kann riesig werden → gezielt einsetzen.
- OSINT (Thema `reconnaissance`) liefert Namen/Daten → persönliche Listen.

Prinzip: **gezielte** Listen + **Rules** schlagen oft brute-force, weil sie den realen Passwort-Kontext treffen.

## Verwendete Tools

| Tool | Zweck | Wichtige Optionen |
|------|-------|-------------------|
| `cewl` | Wortliste von Website scrapen | `-d <tiefe>`, `-m <minlänge>`, `-w <datei>`, `--with-numbers`, `-e` (Mails) |
| `crunch` | Listen generieren | `crunch <min> <max> [charset] -t <muster> -o <datei>` |
| `hashcat`/`john` | Listen gegen Hashes testen | (Übung 03/07) |

## Lab-Setup

- Eine Website im Lab (DVWA/eigene Seite) für cewl. Kali mit `cewl`/`crunch`. Zielhashes aus vorigen Übungen.

## Aufgabe (selbst lösen)

1. Scrape mit **cewl** eine Lab-Website und erzeuge eine Wortliste der dort vorkommenden Begriffe (min. 6 Zeichen, mit Zahlen).
2. Erweitere diese cewl-Liste mit **Rules** (Übung 07) und teste sie gegen einen Zielhash.
3. Erzeuge mit **crunch** eine gemusterte Liste (z. B. festes Präfix + Ziffern, oder ein bekannter Passwort-Aufbau).
4. Baue eine **persönliche** Liste aus OSINT-Begriffen (Namen/Orte/Jahre – aus dem recon-Thema) und kombiniere mit Rules.
5. Erkläre, wann eine Custom-Liste effektiver ist als rockyou – und was das für Passwort-Policies bedeutet.

**Ziel:** mindestens zwei zielbezogene Custom-Wortlisten (cewl + crunch) erstellt und erfolgreich gegen einen Hash eingesetzt.

## SY0-701 Prüfungsbezug

- **Targeted/OSINT-basierte Passwort-Angriffe** – warum zielbezogene Listen gefährlich sind.
- **Password policy / Sperrlisten:** keine firmen-/kontextbezogenen Wörter, Länge, Leak-Abgleich.
- **Reconnaissance → Credential Access**-Verbindung.
- Begriffe: *custom wordlist*, *OSINT*, *targeted attack*, *password policy*, *passphrase*.
