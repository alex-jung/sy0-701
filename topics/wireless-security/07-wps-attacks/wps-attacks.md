# Übung 07 – WPS-Angriffe (reaver/bully)

**Schwierigkeit: 7/10 · Dauer: ca. 60 Min.**

## Lernziele

- WPS (Wi-Fi Protected Setup) und seine Designschwäche verstehen
- WPS-fähige APs finden
- PIN-Brute-Force (reaver/bully) und Pixie-Dust-Angriff durchführen
- Warum WPS abzuschalten ist

## Theorie

**WPS** sollte das Verbinden erleichtern (PIN/Push-Button). Die **8-stellige PIN** hat eine fatale Schwäche: sie wird in **zwei Hälften** (4+3 Stellen, letzte = Prüfsumme) geprüft → statt 10^8 nur **10^4 + 10^3 ≈ 11.000** Versuche → **Online-Brute-Force in Stunden**. Ergebnis: die PIN gibt die **WPA2-PSK** heraus (unabhängig von deren Stärke!).

- **PIN-Brute-Force** (reaver/bully): probiert PINs online am AP.
- **Pixie-Dust** (reaver `-K`): offline-Angriff gegen schwache Zufallszahlen vieler Chipsätze → PIN in Sekunden/Minuten.

Viele APs haben WPS **ab Werk an** → verbreitetes reales Risiko. Mitigation: **WPS deaktivieren**.

## Verwendete Tools

| Tool | Zweck | Optionen |
|------|-------|----------|
| `wash` | WPS-fähige APs finden | `-i wlan0mon` |
| `reaver` | PIN-Brute + Pixie-Dust | `-i -b -c`, `-K 1` (pixie), `-vv` |
| `bully` | alternative WPS-Attacke | |

## Lab-Setup

- Monitor-Interface + eigener AP mit **aktiviertem WPS** (zum Üben). Geduld (PIN-Brute dauert).

## Aufgabe (selbst lösen)

1. Finde mit `wash` heraus, ob dein Test-AP **WPS aktiviert** hat (und ob „locked").
2. Starte einen **Pixie-Dust**-Angriff (reaver `-K`) – fällt dein AP in Sekunden/Minuten?
3. Falls nicht pixie-anfällig: starte einen **PIN-Brute-Force** (reaver) und beobachte den Fortschritt.
4. Nach Erfolg: notiere die zurückgegebene **WPA-PSK** – warum war deren Stärke egal?
5. Deaktiviere WPS am AP und verifiziere mit `wash`, dass es weg ist.

**Ziel:** über WPS (Pixie-Dust oder PIN-Brute) die WPA2-PSK deines Test-APs gewonnen – und WPS anschließend korrekt deaktiviert.

## SY0-701 Prüfungsbezug

- **WPS-Schwäche** als Designfehler (reduzierter Keyspace, Pixie-Dust).
- **WPS gibt PSK preis** → starke PSK nützt nichts, wenn WPS an ist.
- **Mitigation:** WPS deaktivieren; WPA3.
- Begriffe: *WPS*, *PIN brute force*, *Pixie-Dust*, *insecure defaults*, *attack surface*.
