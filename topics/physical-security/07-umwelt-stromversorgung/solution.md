# Lösung – Übung 07: Umwelt & Stromversorgung

## 1. Risiken (Lab)

| Risiko | Impact |
|--------|--------|
| Stromausfall/-schwankung | Ausfall, Datenkorruption (unsauberer Shutdown) |
| Überhitzung (schlechte Kühlung) | Hardware-Ausfall/Drosselung |
| Wasser/Leckage | Hardware-Schaden |
| Feuer | Totalverlust |

## 2. Controls

| Control | schützt gegen |
|---------|---------------|
| USV/UPS | kurze Ausfälle/Spikes, sauberer Shutdown |
| Generator | längere Blackouts |
| Surge Protection | Überspannung |
| HVAC/Lüftung | Überhitzung |
| Fire suppression | Brand |
| Wassersensor | Leckage (früh erkennen) |

## 3. Gasbasiert + Hot/Cold Aisle

- **Clean-Agent/Gaslöschung** (z. B. Inertgas/FM-200) löscht **ohne Wasser** → kein Schaden an Elektronik (Wasser-Sprinkler würden Server zerstören; sonst pre-action als Kompromiss).
- **Hot/Cold Aisle:** Racks so ausrichten, dass Kalt-/Warmluft getrennt sind → effizientere Kühlung, keine Hitze-Hotspots.

## 4. Bezug BIA/RTO

- Fürs **Lab** (unkritisch): USV für sauberen Shutdown reicht meist; Generator/HVAC-Redundanz unwirtschaftlich → akzeptiertes Risiko (`risk-management` BIA/Treatment).
- Für ein echtes RZ: Absicherung nach RTO/Verfügbarkeitsziel (Dual Power, N+1-Kühlung, Geo-Redundanz).

## Hinweise / Troubleshooting

- Strom ist der häufigste Verfügbarkeits-Killer → USV als Minimum (auch fürs Lab sinnvoll).
- Wasser und Elektronik vertragen sich nicht → Löschmittel/Leitungsführung beachten.
- Umwelt-Monitoring (Temp/Wasser/Strom) an Alarmierung koppeln (Detection, Übung 04).
