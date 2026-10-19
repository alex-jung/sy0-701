# Deception / Honeypot – Threat Report

**Autor:** ____  **Datum:** ____  **Zeitraum:** ____  **Klassifizierung:** intern

---

## 1. Management Summary
_2–4 Sätze: Was wurde deployed, was erkannt, Kernrisiko/-empfehlung._

## 2. Scope & Setup
| Komponente | Typ | Standort/VLAN | Zweck |
|-----------|-----|---------------|-------|
| Cowrie | medium-interaction | DMZ `HPOT` | SSH-TTPs |
| OpenCanary | low-interaction | Server-VLAN | interne Frühwarnung |
| Honeyfile | honeyfile | File-Share | Breach/Collection |
| Canary-Account | honeytoken | AD | Lateral Movement |

Einhegung (Egress/Segmentierung): ____

## 3. Angriffs-Timeline
| Zeit (UTC) | Quelle | Aktion | Quelle/Log |
|-----------|--------|--------|------------|
| | | | |

## 4. IOCs
| Typ | Wert | Pyramid-of-Pain | Verwertung |
|-----|------|-----------------|------------|
| IP | | | OPNsense-Block |
| Domain/URL | | | IDS/DNS |
| SHA256 | | | YARA/Watchlist |
| TTP | | hoch | SIEM/IDS-Regel |

## 5. MITRE ATT&CK Mapping
| Taktik | Technik (ID) | Beobachtung |
|--------|--------------|-------------|
| | | |

## 6. Ausgelöste Detections / Alerts
_Welche Regel, wann, Priorität, True Positive?_

## 7. Risiken & Einhegung
| Risiko | Bewertung | Maßnahme |
|--------|-----------|----------|
| Pivot | | Egress-Deny/Segmentierung |
| Recht/Datenschutz | | nur eigene Köder, kein Hack-back |
| Betrieb/Fingerprinting | | Wartung, Tarnung |

## 8. Empfehlungen
1. ____
2. ____

## 9. Anhang
_Konfigs, Dashboards, Roh-IOCs, Session-Logs._
