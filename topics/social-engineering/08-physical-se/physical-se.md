# Übung 08 – Physical Social Engineering

**Schwierigkeit: 8/10 · Dauer: ca. 50 Min.**

## Lernziele

- Physische SE-Techniken verstehen (Tailgating, Baiting, Badge-Cloning, Dumpster Diving)
- Den „USB-Drop" und seine Payload-Mechanik einordnen
- Physische Sicherheitskontrollen als Abwehr kennen
- Ein physisches Assessment (autorisiert) konzeptionell planen

## Theorie

Physical Social Engineering zielt auf **physischen Zutritt/Zugriff**:

- **Tailgating/Piggybacking:** jemandem durch eine gesicherte Tür folgen (freundlich, „Hände voll").
- **Baiting:** präparierte **USB-Sticks** auslegen („Gehälter 2024") → Opfer steckt ein → Payload (HID/„Rubber Ducky" tippt Befehle, oder Autorun/Lure-Datei).
- **Badge-Cloning:** RFID-/NFC-Ausweise auslesen/klonen (z. B. mit Proxmark).
- **Impersonation:** als Handwerker/Lieferant/Besucher auftreten.
- **Dumpster Diving:** sensible Dokumente aus dem Müll.
- **Shoulder Surfing:** Passwörter/PINs beim Eintippen beobachten.

**In diesem Kurs** bleibt es bei **Technik-Verständnis, Payload-Mechanik (im Lab) und Abwehr** – physische Angriffe werden nur im Rahmen eines **autorisierten** physischen Pentests mit Freigabe/„Get-out-of-jail"-Letter durchgeführt.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| HID-/„Rubber Ducky"-Konzept | USB-HID-Payload (Lab) |
| (Proxmark) | RFID/NFC – nur Konzept/eigene Karten |
| — | Prozess-/Abwehr-Analyse |

## Lab-Setup

- Kein Angriff auf reale Gebäude/Personen. HID-Payload optional an **eigener** Test-VM. Sonst konzeptionell.

## Aufgabe (selbst lösen)

1. Ordne Tailgating, Baiting, Badge-Cloning, Dumpster Diving, Shoulder Surfing je einer physischen Kontrolle als Gegenmaßnahme zu.
2. Erkläre die **USB-Drop**-Mechanik: Was macht ein HID-„Rubber Ducky" anders als ein Autorun-Stick?
3. (Optional Lab) demonstriere ein harmloses **HID-Payload** gegen eine eigene Test-VM (z. B. öffnet Notepad/Markerdatei).
4. Plane konzeptionell ein **autorisiertes** physisches Assessment (Scope, Regeln, Safety, Authorization-Letter).
5. Liste physische + organisatorische Abwehrmaßnahmen auf.

**Ziel:** physische SE-Techniken und die USB-Drop-Mechanik verstanden, mit zugeordneten Kontrollen und einem sauberen (autorisierten) Assessment-Rahmen.

## SY0-701 Prüfungsbezug

- **Physical attacks:** tailgating/piggybacking, baiting, badge cloning, dumpster diving, shoulder surfing, **malicious USB (HID)**.
- **Physical controls:** Mantrap/Access Vestibule, Badges, Wachen, Sensoren, Shredding, Kameras, Clean-Desk.
- **USB-Schutz:** Device Control/Port-Blocking, Disable Autorun, EDR.
- Begriffe: *tailgating*, *baiting/malicious USB (HID)*, *badge cloning*, *dumpster diving*, *shoulder surfing*, *access vestibule/mantrap*.
