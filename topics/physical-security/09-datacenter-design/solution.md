# Lösung – Übung 09: Datacenter-Design

## 1. Zonen/Ringe (Beispiel)

| Zone | Controls |
|------|----------|
| Gelände | Zaun, Poller, Beleuchtung, Kamera, Schild |
| Gebäude | Reception, Badge, **Access Control Vestibule/Mantrap**, Guard |
| Rechnerraum | Zutrittskontrolle (badge+PIN/Biometrie), Kamera, Sensoren |
| Käfig/Rack | abschließbar, Tamper-Seal |
| Gerät | FDE, Secure Boot |
Jede Zone eigene Kontrolle → Defense in Depth.

## 2. Redundanz/Tiers

| Verfügbarkeitsziel | Redundanz |
|--------------------|-----------|
| niedrig | N (keine Redundanz) |
| mittel | **N+1** (eine Reserve je Komponente) |
| hoch | **2N** (vollständig gedoppelt), Dual Power, diverse Pfade |
Uptime-Tiers I→IV steigern Redundanz/Verfügbarkeit (Tier IV ~ fault tolerant). Wahl nach RTO/Kritikalität (BIA).

## 3. Umwelt-Integration

- USV + Generator (Strom), N+1-HVAC + hot/cold aisle (Klima), Gaslöschung + Rauch/Temp-Sensoren (Feuer), Wassersensoren → alles an **Monitoring/Alarm** (Detection, Übung 04/07).

## 4. Standortwahl (Kriterien)

1. **Naturgefahren** (nicht in Flutgebiet/Flugschneise) → geringeres Umweltrisiko.
2. **Stromversorgung/Netzqualität** (idealerweise zwei Einspeisungen).
3. **Zufahrt/Logistik** (Lieferzone getrennt) + sichere Nachbarschaft.
4. **Unauffälligkeit** (kein Schild „Datacenter") → weniger gezielte Angriffe.

## Hinweise / Troubleshooting

- Tier/Redundanz kostet exponentiell → an Verfügbarkeitsziel/BIA ausrichten, nicht „maximal".
- Lieferzone/Wartungszugänge sind häufige Schwachstellen → separat kontrollieren.
- Zonen nur wirksam mit Detection + Response (Delay-Prinzip).
