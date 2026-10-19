# Lösung – Übung 04: Überwachung & Detection

## 1. Sensoren → Zweck

| Sensor | erkennt |
|--------|---------|
| Motion/PIR | Bewegung im Raum |
| Magnetkontakt | Tür/Fenster geöffnet |
| Glass break | Glasbruch |
| Temperatur | Überhitzung (Serverraum/HVAC) |
| Wasser/Flood | Leckage/Überschwemmung |
| Rauch/Fire | Brand |

## 2. CCTV Nutzen/Grenzen

- **Nutzen:** Abschreckung (sichtbar), Aufzeichnung/Beweis, Live-Monitoring, Analytics (Bewegung).
- **Grenzen:** tote Winkel, Qualität/Speicherdauer, Aufzeichnung muss **ausgewertet** werden (sonst nur reaktiv), **Datenschutz** (Mitarbeiter/Öffentlichkeit, DSGVO).

## 3. Detection + Monitoring + Response

Alarmkette: Sensor erkennt Zutritt → Alarm an Leitstelle/Handy (Monitoring) → Response (nachsehen/Polizei/Sperren). Fehlt Monitoring/Response, löst der Sensor nur „ins Leere" aus (wie ein SIEM-Alarm ohne SOC). Delay (Barriere) + Detection + Response müssen zusammenpassen.

## 4. Lab-Detektions-Konzept (Beispiel)

- Magnetkontakt an der Lab-Raum-/Schranktür + PIR im Raum → Alarm aufs Handy.
- Rauch-/Temperatur-/Wassersensor für Umwelt (Übung 07).
- Kamera an der Zugangstür (mit Speicherung, Datenschutz beachten).

## Hinweise / Troubleshooting

- **Sensor fusion** (mehrere Sensoren bestätigen) senkt Fehlalarme.
- CCTV-Aufzeichnung regelmäßig prüfen + sicher speichern (sonst wertlos/manipulierbar).
- Datenschutz bei Kameras (Beschilderung, Bereiche, Aufbewahrung) beachten.
