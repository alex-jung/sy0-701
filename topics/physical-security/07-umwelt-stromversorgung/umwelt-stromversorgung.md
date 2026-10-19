# Übung 07 – Umwelt & Stromversorgung

**Schwierigkeit: 7/10 · Dauer: ca. 65 Min.**

## Lernziele

- Umwelt- und Versorgungsrisiken (Strom/Klima/Feuer/Wasser) verstehen
- Controls für Verfügbarkeit (USV, Generator, HVAC, Brandschutz) einordnen
- Umwelt-Resilienz mit BIA/Recovery verbinden

## Theorie

Physische Sicherheit umfasst **Umwelt-/Versorgungsschutz** – meist Angriff auf die **Verfügbarkeit** (A der CIA). Bereiche (SY0-701):

- **Stromversorgung:** **UPS/USV** (überbrückt kurze Ausfälle, sauberer Shutdown), **Generator** (längere Ausfälle), **PDU**, **redundante Einspeisung/Dual Power**, **surge protection** (Überspannung), Schutz vor **brownout/blackout/spikes**.
- **Klima/HVAC:** Temperatur-/Feuchteregelung (Überhitzung = Ausfall), **hot/cold aisle** im RZ, redundante Kühlung, Sensoren.
- **Brandschutz (fire suppression):** Detektion (Rauch/Hitze) + Löschung – im RZ bevorzugt **clean agent / gasbasiert** (kein Wasser auf Elektronik) bzw. **pre-action**-Sprinkler; Feuerklassen beachten.
- **Wasser/Leckage:** Sensoren, keine Wasserleitungen über Racks.
- **Naturgefahren:** Standortwahl (Flut/Erdbeben), redundante Standorte (Geo-Redundanz, Übung `security-architecture` 09).

Verzahnung: Umwelt-Controls dienen **Resilience/Continuity** (BCP/DRP) und werden über **BIA/RTO/RPO** (`risk-management`) priorisiert. Monitoring (Temp/Wasser/Strom) = Detection (Übung 04).

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| (konzeptionell) | Umwelt-/Versorgungs-Design |

## Lab-Setup

- Dein Lab-Standort (Mini-PC, Stromversorgung, Raumklima) als Beispiel.

## Aufgabe (selbst lösen)

1. Identifiziere Umwelt-/Versorgungsrisiken für dein Lab (Strom/Hitze/Wasser/Feuer) und ihren Impact (v. a. Verfügbarkeit).
2. Ordne Controls zu: USV/Generator/Surge/HVAC/Brandschutz/Wassersensor – was schützt wogegen.
3. Erkläre, warum im RZ **gasbasierte** Löschung statt Wasser-Sprinkler bevorzugt wird und was hot/cold aisle bringt.
4. Verbinde dein Umwelt-Konzept mit **BIA/RTO** (welche Absicherung lohnt sich fürs Lab?).

**Ziel:** ein risikobasiertes Umwelt-/Versorgungs-Konzept, das Verfügbarkeit sichert und an BIA ausgerichtet ist.

## SY0-701 Prüfungsbezug

- **1.0/3.0** environmental controls: power (UPS/generator/PDU/dual power/surge), HVAC/temperature, fire suppression (clean agent), water/flood sensors; availability/resilience.
- Begriffe: *UPS/generator*, *surge/brownout/blackout*, *HVAC/hot-cold aisle*, *fire suppression (clean agent/pre-action)*, *water sensor*, *geo-redundancy*.
