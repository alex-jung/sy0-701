# Lösung – Übung 10: Physical-Security-Assessment (Capstone)

Muster-Lösungspfad; Qualität = **vollständige** Bewertung je Bereich + physisch/logische Verzahnung + priorisierte Maßnahmen.

## 1. Scope & Ist
- Facility: Lab-Raum/Wohnung, Mini-PC, OPNsense/Switch, Datenträger/Backups. Ist-Controls: Wohnungstür-Schloss, evtl. kein Rack/USV/Sensor.

## 2. Bewertung je Bereich (Auszug)
| Bereich | Ist | Lücke |
|---------|-----|-------|
| Perimeter | Wohnungstür | kein zusätzlicher Ring |
| Zutritt | Raum nicht abschließbar | kein gestufter Zutritt |
| Detection | keine Sensoren | kein Einbruch-/Umwelt-Alarm |
| Personal | Solo | Awareness/Clean Desk informell |
| Geräte/Medien | offen | kein Rack/Schloss, FDE? |
| Umwelt/Strom | keine USV | Ausfallrisiko |
| Phys. Angriffe | USB-Boot offen? | kein BIOS-Lock/Secure Boot |

## 3. Findings & Risiken
| # | Finding | Schwere |
|---|---------|---------|
| F1 | Keine FDE auf Mini-PC/Datenträger | hoch |
| F2 | USB-Boot/BIOS ungesichert | hoch |
| F3 | Raum/Rack nicht abschließbar | mittel |
| F4 | Keine USV/Umwelt-Monitoring | mittel |

## 4. Maßnahmen (Deter/Detect/Delay/Deny + logisch)
| Finding | Maßnahme | Ebene |
|---------|----------|-------|
| F1 | FDE/LUKS aktivieren | logisch (Deny Datenzugriff) |
| F2 | BIOS-Passwort + Secure Boot + Boot-Order sperren | logisch/phys |
| F3 | abschließbarer Schrank/Rack + Raum sichern | Delay/Deny |
| F4 | USV + Temp/Wasser-Sensor + Alarm | Detect/Verfügbarkeit |

## 5. Priorisierung & Report
`physical-security-assessment-template.md`: Management Summary, Bewertung je Bereich, Findings, Maßnahmen, Roadmap (Quick Wins: FDE, BIOS-Lock, Schrank-Schloss; mittel: USV/Sensoren).

## Bewertungs-Checkliste
- [ ] Scope + Ist-Aufnahme
- [ ] Bewertung aller Bereiche (02–08)
- [ ] Findings mit Schwere
- [ ] Maßnahmen nach Deter/Detect/Delay/Deny + logische Verzahnung
- [ ] Priorisierte Roadmap + Report + Management Summary

## Häufige Fehler / Troubleshooting
- Nur physisch **oder** nur logisch betrachtet – beides verzahnen (FDE + Zutritt).
- Detection ohne Response geplant.
- Maßnahmen nicht priorisiert/risikobasiert.
- „Game over bei physischem Zugriff" ignoriert (keine FDE/Secure Boot).
