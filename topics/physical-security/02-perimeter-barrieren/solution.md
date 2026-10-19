# Lösung – Übung 02: Perimeter & Barrieren

## 1. Barrieren nach Zweck

| Barriere | Zweck |
|----------|-------|
| Warnschild | deter |
| Beleuchtung | deter (+ unterstützt detect) |
| Zaun | delay (+ deter) |
| Mauer | delay/deny |
| Poller (bollards) | deny (Fahrzeuge) |
| Mantrap/Vestibule | deny (tailgating) |

## 2. Mehrschichtiger Perimeter (Ringe)

```
Gelände (Zaun/Beleuchtung/Schild)
 └─ Gebäude (verschlossene Türen, Badge)
     └─ Raum/Serverraum (Zutrittskontrolle, Kamera)
         └─ Rack (abschließbar) → Gerät (FDE)
```
Jeder Ring verzögert + bietet Detection-Punkt.

## 3. Warum Delay

Kein Schutz hält ewig; Barrieren **verzögern** den Angreifer so lange, dass **Detection** (Sensor/Kamera) + **Response** (Alarm/Eingreifen) rechtzeitig wirken. Delay ohne Detection/Response ist wertlos (und umgekehrt) → zusammen denken.

## 4. CPTED-Perimeter

- **Beleuchtung** an Zugängen (schreckt ab, Kamera-Nutzen).
- **Sichtachsen/keine Deckung:** Bepflanzung niedrig halten, keine Verstecke → natural surveillance.

## Hinweise / Troubleshooting

- Zaunhöhe/-material = Delay-Zeit (bestimmt, wie lange bis Überwindung).
- Poller/vehicle barriers nur dort, wo Fahrzeugangriff plausibel ist (risikobasiert).
- Perimeter nützt nichts ohne Detection + Response dahinter.
