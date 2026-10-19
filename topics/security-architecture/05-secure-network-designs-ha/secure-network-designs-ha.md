# Übung 05 – Secure Network Designs & High Availability

**Schwierigkeit: 5/10 · Dauer: ca. 75 Min.**

## Lernziele

- Hochverfügbare, sichere Netz-Designs entwerfen
- Redundanz, Load Balancing und Failover-Konzepte verstehen
- Single Points of Failure erkennen und beseitigen

## Theorie

Verfügbarkeit ist Teil der CIA-Triade und eine Architektur-Anforderung. Konzepte (SY0-701):

- **Redundanz:** doppelte Komponenten (Netzteile, Uplinks, Geräte, Standorte) → kein **Single Point of Failure (SPOF)**.
- **High Availability (HA):** **Active/Active** (beide tragen Last) vs. **Active/Passive** (Standby übernimmt). Firewalls: **CARP/VRRP**, State-Sync.
- **Load Balancing:** verteilt Last, **health checks**, erhöht Verfügbarkeit/Skalierung.
- **Clustering**, **Failover**, **geografische Redundanz** (mehrere Standorte), **diverse paths** (ISP-Redundanz).
- **Resilienz-Metriken:** MTBF/MTTR (`risk-management` 06), Verfügbarkeit (99,9 % …).

Sicher **und** verfügbar heißt: Redundanz **ohne** Sicherheits-Schwächung (z. B. Standby-Firewall gleich gehärtet, State-Sync verschlüsselt, keine „Notfall-Bypässe"). Trade-off: HA kostet (Komplexität/Geld) → an Kritikalität (BIA) ausrichten.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| OPNsense (CARP/HA) | Firewall-HA im Lab |
| Load Balancer (Konzept/HAProxy) | Verteilung/Health Check |
| Diagramm | HA-Design |

## Lab-Setup

- Optional zwei OPNsense (CARP), ein Dienst hinter einem Load Balancer.

## Aufgabe (selbst lösen)

1. Identifiziere **SPOFs** in deinem aktuellen Lab-Design (Firewall, Uplink, Host, Strom) und bewerte deren Impact.
2. Entwirf ein **HA-Design** für die wichtigste Komponente (z. B. OPNsense via CARP, Active/Passive) inkl. State-Sync.
3. Platziere einen **Load Balancer** vor einen Dienst und beschreibe Health Checks + Active/Active vs. Active/Passive.
4. Verbinde dein HA-Design mit der **BIA** (RTO/RPO aus `risk-management`): welche Verfügbarkeit ist nötig/wirtschaftlich?

**Ziel:** ein sicheres HA-Design, das SPOFs beseitigt und an Kritikalität/BIA ausgerichtet ist.

## SY0-701 Prüfungsbezug

- **3.0** high availability, redundancy, load balancing (active/active vs. active/passive), clustering, failover, SPOF, geographic redundancy.
- Begriffe: *HA*, *redundancy*, *SPOF*, *active/active vs. active/passive*, *load balancer/health check*, *CARP/VRRP*, *failover/clustering*.
