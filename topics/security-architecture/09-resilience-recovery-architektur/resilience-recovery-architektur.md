# Übung 09 – Resilience & Recovery-Architektur

**Schwierigkeit: 9/10 · Dauer: ca. 85 Min.**

## Lernziele

- Resilience und Recovery architektonisch verankern
- Backup-Strategien, Site-Typen und Redundanz-Konzepte einordnen
- Resilienz testen (Tabletop/Failover) und an RTO/RPO ausrichten

## Theorie

**Resilience** = die Fähigkeit, Störungen zu widerstehen und sich zu erholen. Architektur-Bausteine (SY0-701):

- **Backups:** **3-2-1-Regel** (3 Kopien, 2 Medien, 1 offsite), **offline/immutable** (gegen Ransomware), **Backup-Typen** (full/incremental/differential/snapshot), **Restore-Tests** (ein Backup ohne getesteten Restore ist wertlos). Steuert **RPO** (`risk-management` 06).
- **Recovery-Sites:** **hot site** (sofort betriebsbereit), **warm site** (teilweise), **cold site** (nur Infrastruktur), **mobile/cloud DR**. Steuert **RTO**.
- **Redundanz/HA** (Übung 05), **geo-redundancy**, **diverse Pfade**.
- **Continuity/Recovery-Pläne:** **BCP/DRP**, Runbooks, Eskalation.
- **Resilienz-Tests:** **tabletop exercise**, **simulation**, **failover-/parallel test**, **chaos engineering**; **capacity planning** (people/technology).

Ziel: nach Vorfall innerhalb **RTO** wieder online mit max. **RPO** Datenverlust – zu wirtschaftlich vertretbaren Kosten (an BIA/Kritikalität ausgerichtet). Bezug: `incident-response` (Recovery-Phase), `risk-management` (BIA).

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Snapshots/Backup-Tool | Backup-Strategie im Lab |
| Diagramm/Runbook | Recovery-Design |

## Lab-Setup

- Dein Lab (Proxmox-Snapshots, OPNsense-Config-Backup, Repo-Remote).

## Aufgabe (selbst lösen)

1. Entwirf eine **Backup-Strategie** nach 3-2-1 für deine kritischen Lab-Assets (was/wie oft/wohin), mit Backup-Typen; leite die Frequenz aus deinem **RPO** ab.
2. Ordne hot/warm/cold site je einem Szenario + RTO zu und begründe, welche für dein Lab realistisch ist.
3. Beschreibe, wie du gegen **Ransomware** resilient bist (offline/immutable Backups, Segmentierung, Restore-Test).
4. Plane einen **Resilienz-Test** (Tabletop **oder** Failover) inkl. Erfolgskriterium (RTO/RPO eingehalten?).

**Ziel:** eine resiliente Backup-/Recovery-Architektur, an RTO/RPO ausgerichtet, inkl. Ransomware-Resilienz und Testplan.

## SY0-701 Prüfungsbezug

- **3.0/5.0** resilience & recovery: backups (3-2-1, offline/immutable, types), hot/warm/cold sites, redundancy, BCP/DRP, testing (tabletop/failover/simulation), capacity planning.
- Begriffe: *3-2-1 backup*, *immutable/offline backup*, *full/incremental/differential/snapshot*, *hot/warm/cold site*, *BCP/DRP*, *tabletop/failover test*, *RTO/RPO*.
