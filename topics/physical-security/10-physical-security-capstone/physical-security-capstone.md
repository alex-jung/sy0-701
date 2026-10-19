# Übung 10 – Capstone: Physical-Security-Assessment

**Schwierigkeit: 10/10 · Dauer: ca. 3 Std.**

## Lernziele

- Ein vollständiges Physical-Security-Assessment durchführen
- Perimeter, Zutritt, Detection, Personal, Geräte, Umwelt und physische Angriffe zusammenführen
- Physisch↔logisch verzahnen und einen Report mit Maßnahmen erstellen

## Theorie

Dieses Capstone bündelt Übungen 01–09 zu einem **Physical-Security-Assessment** der eigenen „Facility" (Lab-Standort): Ist-Aufnahme → Bewertung je Bereich (Perimeter/Zutritt/Detection/Personal/Geräte/Umwelt/Angriffe) → Findings/Risiken → Maßnahmen (Deter/Detect/Delay/Deny) → Verzahnung mit logischen Controls (FDE/Secure Boot/NAC). Ergebnis ist ein Report mit priorisierten Empfehlungen. Nutze `physical-security-assessment-template.md`.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Checkliste/Diagramm | Ist-Aufnahme/Bewertung |
| (Ergebnisse Ü01–09) | Input |

## Lab-Setup

- Dein physisches Lab (Mini-PC, Netzwerk, Raum/Standort) als Facility.

## Aufgabe (selbst lösen)

Führe ein Physical-Security-Assessment durch:

1. **Scope & Ist-Aufnahme:** Facility/Objekte (Raum, Mini-PC, Netzwerk, Medien) + vorhandene physische Controls.
2. **Bewertung je Bereich:** Perimeter (02), Zutritt (03), Detection (04), Personal/Vektoren (05), Geräte/Medien (06), Umwelt/Strom (07), physische Angriffe (08) – je mit Ist/Lücke.
3. **Findings & Risiken:** physische Schwächen mit Schwere (z. B. kein FDE, offener USB-Boot, ungesicherter Raum, keine USV).
4. **Maßnahmen:** je Finding eine Control nach Deter/Detect/Delay/Deny; **physisch↔logisch** verzahnt (FDE/Secure Boot/Zutritt).
5. **Priorisierung & Report:** `physical-security-assessment-template.md` vollständig, inkl. Management Summary + priorisierten Quick Wins.

**Ziel:** ein vollständiges, priorisiertes Physical-Security-Assessment deines Labs (Ist→Findings→Maßnahmen) + Report mit physisch/logischer Verzahnung.

## SY0-701 Prüfungsbezug

- **1.0/2.0 (+3.0)** kombiniert: physical controls, perimeter/access/detection, personnel/social, equipment/media, environmental, physical attacks, facility design.
- Prüfungsnah: Controls nach Typ wählen/platzieren, physisch↔logisch verbinden, Risiken priorisieren.
- Begriffe: *physical security assessment*, *deter/detect/delay/deny*, *access control vestibule*, *FDE/Secure Boot*, *environmental controls*, *defense in depth*.
