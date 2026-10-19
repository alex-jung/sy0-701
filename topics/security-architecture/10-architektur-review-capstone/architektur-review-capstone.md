# Übung 10 – Capstone: Architektur-Review & Zielbild

**Schwierigkeit: 10/10 · Dauer: ca. 3–4 Std.**

## Lernziele

- Die gesamte Lab-Architektur erfassen, bewerten und ein sicheres Zielbild entwerfen
- Segmentierung, Zero Trust, HA, Cloud/Edge, Protokolle und Resilience zusammenführen
- Einen Architektur-Review-Report mit Zielbild und Roadmap erstellen

## Theorie

Dieses Capstone bündelt Übungen 01–09 zu einem **Security-Architecture-Review**: Ist-Architektur dokumentieren → gegen Prinzipien/Modelle bewerten (Segmentierung, Defense-in-Depth-Platzierung, Zero Trust, HA, Cloud, Protokolle, Resilience) → Schwächen/Risiken identifizieren → **Zielarchitektur** entwerfen → Migrations-Roadmap. Methodik: Diagramme, Zonen, Trust-/Datenflüsse, Threat-informed (Bezug `threat-concepts`), Control-Mapping (`security-controls`). Nutze `architecture-review-template.md`.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Diagramm-Tool | Ist-/Ziel-Architektur |
| OPNsense/VLAN/HA | Umsetzung/Validierung |
| (Ergebnisse Ü01–09) | Input |

## Lab-Setup

- Dein gesamtes Lab + Ergebnisse der Übungen 01–09.

## Aufgabe (selbst lösen)

Erstelle ein vollständiges Architektur-Review:

1. **Ist-Architektur:** Diagramm mit Zonen, Datenflüssen, Komponenten, Trust-Grenzen.
2. **Bewertung** gegen: Segmentierung/Zonen (02), Control-Platzierung (03), Zero Trust (04), HA/SPOF (05), Cloud/Shared Responsibility falls zutreffend (06), SASE/Secure Access (07), sichere Protokolle (08), Resilience/Recovery (09).
3. **Findings:** Architektur-Schwächen (SPOFs, flache Netze, Klartext-Protokolle, implizites Vertrauen) mit Risiko/Schwere.
4. **Zielarchitektur:** Diagramm + Prinzipien (Segmentierung, Zero Trust, HA, secure protocols, Resilience) – mit Begründung der Trade-offs.
5. **Roadmap:** priorisierte Migrationsschritte (Quick Wins vs. mittel/lang), Rest-Risiko.
6. **Report:** `architecture-review-template.md` vollständig, inkl. Management Summary.

**Ziel:** ein durchgängiges Architektur-Review (Ist→Bewertung→Findings→Zielbild→Roadmap) + management-tauglicher Report mit Diagrammen.

## SY0-701 Prüfungsbezug

- **3.0 (+1.0/5.0)** kombiniert: architecture models, segmentation, zero trust, HA/resilience, cloud/shared responsibility, SASE, secure protocols, recovery.
- Prüfungsnah: Zonen/Platzierung begründen, Zero Trust/HA/Protokolle anwenden, Trade-offs/Resilience bewerten.
- Begriffe: *security architecture review*, *segmentation/zones*, *zero trust*, *HA/SPOF*, *shared responsibility*, *SASE/ZTNA*, *secure protocols*, *resilience*.
