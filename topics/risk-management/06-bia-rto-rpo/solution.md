# Lösung – Übung 06: BIA (RTO/RPO/MTD)

## 1. Kritikalität (Beispiel)

| Prozess/Asset | Funktion | Impact bei Ausfall | Kritikalität |
|---------------|----------|--------------------|--------------|
| OPNsense (Routing/Firewall) | Netz/Schutz | gesamtes Lab offline/ungeschützt | sehr hoch |
| SIEM/Logging | Monitoring | keine Detection | hoch |
| Repo/Doku (dieses Projekt) | Wissen/Übungen | Arbeitsverlust | hoch |
| Übungs-/Ziel-VMs | Praxis | Übung gestört | mittel |

## 2. RTO/RPO/MTD (Top-3)

| Asset | RTO | RPO | MTD | Begründung |
|-------|-----|-----|-----|------------|
| OPNsense | 2 h | 24 h | 8 h | ohne Firewall kein sicherer Lab-Betrieb; Config ändert selten → RPO 24 h ok |
| Repo/Doku | 4 h | 1 h | 24 h | Git-Remote = häufige Sicherung → kleiner RPO |
| SIEM | 8 h | 24 h | 48 h | wichtig, aber Lab läuft kurzzeitig ohne |

## 3. Maßnahmen aus RTO/RPO

- **RPO 1 h (Repo):** häufige Commits/Push (Remote-Backup).
- **RPO 24 h (OPNsense):** tägliches Config-Backup/Export.
- **RTO 2 h (OPNsense):** Konfig-Backup + schnelle Re-Deploy-Anleitung/Snapshot (ggf. Standby).
- Kürzeres RTO → Redundanz/HA (CARP); kleineres RPO → häufigere Backups/Replikation (= höhere Kosten).

## 4. Abgrenzungen

- **RTO vs. RPO:** OPNsense fällt 03:00 aus, letztes Backup 00:00, wieder online 05:00 → **RTO = 5 h** (Ausfalldauer), **RPO = 3 h** (verlorene Änderungen seit 00:00).
- **MTBF vs. MTTR:** MTBF = durchschnittliche **Zeit zwischen** Ausfällen (Zuverlässigkeit); MTTR = durchschnittliche **Reparaturdauer**. Hohe MTBF + niedrige MTTR = hohe Verfügbarkeit.

## Hinweise / Troubleshooting

- RTO + WRT müssen **≤ MTD** bleiben, sonst existenzbedrohend.
- RPO bestimmt die **Backup-Frequenz** (RPO 1 h ⇒ mind. stündliche Sicherung).
- BIA priorisiert **nach Business-Impact**, nicht nach technischer Vorliebe.
