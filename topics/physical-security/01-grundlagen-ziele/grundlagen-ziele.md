# Übung 01 – Grundlagen & Ziele physischer Sicherheit

**Schwierigkeit: 1/10 · Dauer: ca. 40 Min.**

## Lernziele

- Ziele und Prinzipien physischer Sicherheit verstehen
- Physische Controls nach Typ/Kategorie einordnen (Bezug `security-controls`)
- Den Zusammenhang physisch ↔ logisch erkennen

## Theorie

**Physical Security** schützt Personen, Gebäude, Hardware und Daten vor **physischen** Bedrohungen (Diebstahl, unbefugter Zutritt, Sabotage, Umwelt). Grundregel: **ohne physische Sicherheit keine logische Sicherheit** – wer physischen Zugriff auf ein System hat, kann viele logische Controls umgehen (Boot-Angriff, Disk ausbauen, Reset, Keylogger anstecken).

Ziele (oft als **Deter → Detect → Delay → Deny/Respond**): abschrecken, erkennen, verzögern, verhindern/reagieren. Physische Controls lassen sich – wie in `security-controls` – nach **Typ** (deterrent/preventive/detective/…) **und** **Kategorie** (hier v. a. **physical**) einordnen: z. B. Zaun (deterrent/preventive), Kamera (detective/deterrent), Schloss (preventive), Wachdienst (operational/detective). Ansatz **Defense in Depth** auch physisch (mehrere Ringe: Gelände → Gebäude → Raum → Rack). Design-Philosophie **CPTED** (Crime Prevention Through Environmental Design): durch Gestaltung (Sichtachsen, Beleuchtung, Zonierung) Kriminalität erschweren.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| (konzeptionell) | Einordnung/Analyse |

## Lab-Setup

- Keines; optional dein Mini-Lab-Standort als Beispiel.

## Aufgabe (selbst lösen)

1. Erkläre, warum physischer Zugriff logische Controls aushebeln kann (2 Beispiele).
2. Ordne 8 physische Controls nach **Typ** (deterrent/preventive/detective) ein (Zaun, Kamera, Schloss, Wachmann, Beleuchtung, Mantrap, Warnschild, Bewegungssensor).
3. Beschreibe das Modell Deter→Detect→Delay→Deny an einem Szenario (Einbruch in deinen Lab-Raum).
4. Nenne drei CPTED-Ideen für deinen Lab-Standort.

**Ziel:** Ziele/Prinzipien physischer Sicherheit verstehen und Controls nach Typ einordnen (inkl. physisch↔logisch).

## SY0-701 Prüfungsbezug

- **1.0** physical security controls; control types/categories applied physically; defense in depth.
- Begriffe: *physical security*, *deter/detect/delay/deny*, *CPTED*, *defense in depth*, *physical vs. logical*.
