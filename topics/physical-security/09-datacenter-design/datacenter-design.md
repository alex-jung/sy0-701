# Übung 09 – Datacenter-/Facility-Design

**Schwierigkeit: 9/10 · Dauer: ca. 80 Min.**

## Lernziele

- Ein sicheres Datacenter/eine Facility ganzheitlich entwerfen
- Physische Zonen, Redundanz und Umwelt in ein Design integrieren
- Standards/Tiers und Standortwahl einordnen

## Theorie

Datacenter-Design verbindet **alle** physischen Controls zu einem mehrschichtigen System (Defense in Depth):

- **Zonen/Ringe:** Gelände (Zaun/Poller/Beleuchtung) → Gebäude (Reception/Badge/Vestibule) → Rechnerraum (Zutritt + Kamera) → Käfig/Rack (abschließbar) → Gerät (FDE). Jede Zone eigene Kontrolle (defense in depth).
- **Redundanz/Verfügbarkeit:** **Uptime-Institute-Tiers (I–IV)** (zunehmende Redundanz: N, N+1, 2N), Dual Power, N+1-Kühlung, diverse Netzpfade, **Geo-Redundanz** (`security-architecture` 09).
- **Umwelt:** HVAC/hot-cold aisle, Brand-/Wasser-/Temperatur-Monitoring, USV/Generator (Übung 07).
- **Standortwahl:** Naturgefahren (Flut/Erdbeben/Flugschneisen), Stromnetz, Zufahrt, Nachbarschaft; **Unauffälligkeit** (kein „Datacenter"-Schild).
- **Prozesse:** Visitor/Escort, Logging, Wartungszugänge, Lieferzonen getrennt, Wachdienst/Patrouillen.

Ziel: ausgewogenes Design aus **Deter/Detect/Delay/Deny**, Verfügbarkeit (Tier) und Kosten – risikobasiert (BIA).

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Diagramm | Facility-/Zonen-Design |
| (konzeptionell) | Tiers/Standort |

## Lab-Setup

- Hypothetisches kleines RZ + Bezug zu deinem Mini-Lab (skaliert).

## Aufgabe (selbst lösen)

1. Entwirf ein **Zonen-/Ring-Design** für ein kleines RZ (Gelände→Gebäude→Raum→Rack) mit Controls je Zone.
2. Ordne Redundanz-Konzepte (N/N+1/2N, Dual Power, Tiers) grob zu: welches Verfügbarkeitsziel braucht was?
3. Integriere Umwelt-Controls (USV/HVAC/Brandschutz/Monitoring) in dein Design.
4. Nenne 4 Kriterien der **Standortwahl** und begründe.

**Ziel:** ein ganzheitliches, mehrschichtiges Facility-Design (Zonen + Redundanz + Umwelt + Standort), risikobasiert.

## SY0-701 Prüfungsbezug

- **1.0/3.0** facility/datacenter security, zones/defense in depth, redundancy/tiers, environmental, site selection.
- Begriffe: *security zones/rings*, *Uptime Tiers (N/N+1/2N)*, *dual power/HVAC*, *geo-redundancy*, *site selection*, *cage/rack security*.
