# Lösung – Übung 10: Architektur-Review (Capstone)

Muster-Lösungspfad; Qualität = **durchgängige** Bewertung Ist→Ziel mit begründeten Trade-offs und Diagrammen.

## 1. Ist-Architektur
- Diagramm: WAN→OPNsense→(DMZ/LAN/MGMT/LAB-ISOLATED), VMs, Datenflüsse, Trust-Grenzen (Ü02).

## 2. Bewertung (Auszug)
| Dimension | Ist | Bewertung |
|-----------|-----|-----------|
| Segmentierung | VLANs vorhanden | gut, Ost-West aber teils flach |
| Control-Platzierung | FW+IDS | ok; IDS passiv, kein EDR |
| Zero Trust | MFA teils | implizites LAN-Vertrauen → Lücke |
| HA/SPOF | einzelne OPNsense/Host | SPOFs |
| Protokolle | teils Klartext (Test) | Legacy isolieren/umstellen |
| Resilience | Snapshots | 3-2-1 unvollständig |

## 3. Findings (Beispiel)
| # | Finding | Schwere |
|---|---------|---------|
| F1 | Single OPNsense (SPOF) | hoch |
| F2 | Flaches LAN (Ost-West ungefiltert) | hoch |
| F3 | Klartext-Protokolle (Telnet/HTTP/SNMPv2c) | mittel |
| F4 | Kein offline/immutable Backup | hoch |

## 4. Zielarchitektur
- Mikrosegmentierung (Ost-West-Regeln/Zero Trust), MGMT nur via Bastion+MFA, OPNsense-HA (CARP), secure protocols (SSH/HTTPS/SNMPv3/LDAPS/DoT), 3-2-1 + immutable Backups, IDS + EDR/Logging. Diagramm + Trade-offs (Kosten/Komplexität vs. Sicherheit/Verfügbarkeit).

## 5. Roadmap
- **Quick Wins:** Klartext-Protokolle umstellen/abschalten, MFA überall, offline-Backup.
- **Mittel:** Ost-West-Segmentierung verschärfen, EDR/Logging ausbauen.
- **Lang:** OPNsense-HA, Zero-Trust-Zugriff (ZTNA statt reinem VPN).
- Rest-Risiko je Schritt benannt.

## 6. Report
`architecture-review-template.md`: Management Summary, Ist-/Ziel-Diagramm, Findings, Roadmap.

## Bewertungs-Checkliste
- [ ] Ist-Architektur mit Zonen/Datenflüssen/Trust-Grenzen
- [ ] Bewertung gegen alle Dimensionen (02–09)
- [ ] Findings mit Risiko/Schwere
- [ ] Zielarchitektur-Diagramm + begründete Trade-offs
- [ ] Priorisierte Roadmap + Rest-Risiko
- [ ] Vollständiger Report + Management Summary

## Häufige Fehler / Troubleshooting
- Flaches LAN „weil es funktioniert" → Lateral Movement; Ost-West segmentieren.
- HA/Backups „geplant", aber nie getestet (Failover/Restore).
- Zielbild ohne Trade-off-Begründung → wirkt unrealistisch/teuer.
- Klartext-Legacy nur „geduldet" statt isoliert (compensating control).
