# Lösung – Übung 05: Secure Network Design & HA

## 1. SPOFs im Lab (Beispiel)

| SPOF | Impact |
|------|--------|
| einzelne OPNsense | gesamtes Lab offline/ungeschützt |
| einzelner ISP-Uplink | kein Internet |
| einzelner Proxmox-Host | alle VMs weg |
| keine USV | Totalausfall bei Stromfehler |

## 2. HA-Design (OPNsense CARP)

- Zwei OPNsense als **Active/Passive** mit **CARP** (virtuelle IP), **pfsync/State-Sync** → Sessions bleiben beim Failover erhalten.
- Standby gleich gehärtet/gepatcht; Sync-Interface vertrauenswürdig/isoliert.

## 3. Load Balancer

- LB (z. B. HAProxy) vor zwei Web-Backends: **health checks** nehmen ausgefallene Backends raus.
- **Active/Active:** beide Backends tragen Last (Skalierung). **Active/Passive:** Passives springt nur bei Ausfall ein (einfacher, weniger Kapazität).

## 4. Bezug BIA

- RTO/RPO (Übung `risk-management` 06) bestimmen den HA-Aufwand: kritische Komponente mit kurzem RTO → HA/Redundanz lohnt; unkritische → einfaches Backup reicht. HA nur dort, wo wirtschaftlich (Kosten vs. Ausfallschaden/ALE).

## Hinweise / Troubleshooting

- Redundanz **ohne** Sicherheits-Schwächung: Standby ebenso hart; State-Sync-Link schützen.
- SPOF kann auch „menschlich"/organisatorisch sein (nur eine Person kennt das System).
- HA erhöht Komplexität → Failover regelmäßig **testen** (sonst „Standby" nur auf dem Papier).
