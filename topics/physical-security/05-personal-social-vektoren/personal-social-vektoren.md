# Übung 05 – Personal & menschliche Vektoren

**Schwierigkeit: 5/10 · Dauer: ca. 60 Min.**

## Lernziele

- Menschliche/physische Angriffsvektoren erkennen (tailgating, impersonation, etc.)
- Organisatorische Controls (Prozesse, Besuchermanagement, Guards) einordnen
- Physische Social-Engineering-Angriffe abwehren (Bezug `social-engineering`)

## Theorie

Der Mensch ist auch physisch der schwächste Punkt. Physische/menschliche Vektoren (SY0-701):

- **Tailgating/Piggybacking** (Übung 03), **impersonation** (Handwerker/Lieferant/Kollege vortäuschen), **pretexting** vor Ort, **badge cloning/theft**.
- **Shoulder surfing** (Mitlesen von PINs/Passwörtern), **dumpster diving** (Müll nach Infos durchsuchen), **baiting** (präparierter USB-Stick „verloren"), **lock picking/bypass**.
- **Unescorted visitors**, **unattended workstations** (nicht gesperrt), **unsecured documents** (Clean Desk fehlt).

Controls (organisatorisch/operational): **Visitor management** (Anmeldung/Badge/Begleitpflicht/escort), **guards & patrols**, **Clean-Desk-Policy**, **Screen-Lock**, **Awareness** (keine Fremden mitnehmen, PINs verdecken, Besucher ansprechen), **shredding** sensibler Dokumente, **Badge-Hygiene**. Verzahnt mit `social-engineering` (gleiche Prinzipien: authority/urgency) und `security-controls` (operational controls).

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| (konzeptionell) | Vektor-/Control-Analyse |

## Lab-Setup

- Konzeptionell; eigenes Umfeld als Beispiel (keine Angriffe gegen Dritte).

## Aufgabe (selbst lösen)

1. Ordne 8 Vektoren korrekt zu (tailgating, impersonation, shoulder surfing, dumpster diving, baiting, badge cloning, unattended workstation, unsecured docs).
2. Bestimme für 4 Vektoren das ausgenutzte **Prinzip/Problem** (Vertrauen/Hilfsbereitschaft/Nachlässigkeit).
3. Ordne je Vektor eine **organisatorische** Gegenmaßnahme zu (Prozess/Awareness).
4. Entwirf 5 Punkte einer **physischen Security-Awareness/Clean-Desk-Policy**.

**Ziel:** menschliche/physische Vektoren erkennen und mit organisatorischen Controls abwehren.

## SY0-701 Prüfungsbezug

- **2.0** physical/social vectors: tailgating, impersonation, shoulder surfing, dumpster diving, baiting (USB); visitor management, clean desk, awareness.
- Begriffe: *tailgating/piggybacking*, *impersonation/pretexting*, *shoulder surfing*, *dumpster diving*, *baiting*, *clean desk*, *visitor management/escort*.
