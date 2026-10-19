# Lösung – Übung 02: Control-Kategorien

## 1. Definitionen

- **Technical:** per Technik umgesetzt – Firewall, MFA.
- **Managerial:** per Governance/Management – Policy, Risk Assessment.
- **Operational:** durch Menschen im Betrieb – Awareness-Training, IR-Prozess.
- **Physical:** physischer Schutz – Schloss, Kamera.

## 2. Matrix (Kategorie × Typ)

| Control | Kategorie | Typ |
|---------|-----------|-----|
| MFA | technical | preventive |
| Kamera | physical | detective + deterrent |
| Security-Policy | managerial | directive |
| Awareness-Training | operational | preventive |
| Firewall | technical | preventive |
| Backup-Prozess | operational | corrective |
| Zaun | physical | preventive + deterrent |
| Verschlüsselung | technical | preventive |
| Hintergrundprüfung | managerial | preventive |
| IDS | technical | detective |

## 3. Managerial vs. Operational

- **Managerial** = Entscheidung/Vorgabe auf Papier/Governance-Ebene (z. B. „es gibt eine Patch-**Policy**", Risk Assessment).
- **Operational** = die **Durchführung** durch Menschen im Alltag (z. B. das Team, das die Patches **tatsächlich einspielt**, der Wachdienst). Dieselbe Sache kann als Vorgabe managerial und als Ausführung operational auftreten.

## 4. Lab-Beispiele

- **Technical:** OPNsense-Regeln/IDS. **Managerial:** deine schriftliche Lab-Policy/Scope. **Operational:** dein Patch-/Backup-/Snapshot-Routine. **Physical:** abgeschlossener Raum/Schrank für den Mini-PC.

## Hinweise / Troubleshooting

- Kamera ist **physical** (nicht „technical"), auch wenn sie digital ist – es geht um den **physischen** Schutzzweck.
- „Policy" ist managerial (directive); die **Umsetzung** der Policy ist oft operational.
