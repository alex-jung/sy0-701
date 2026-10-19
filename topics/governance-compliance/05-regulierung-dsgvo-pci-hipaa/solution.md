# Lösung – Übung 05: Regulierung

## 1. Zuordnung

| Regulierung | Datentyp/Zweck | Kategorie |
|-------------|----------------|-----------|
| DSGVO/GDPR | personenbezogene Daten (EU) | legal/regulatory |
| PCI DSS | Karteninhaberdaten (Kreditkarten) | industry/contractual |
| HIPAA | Gesundheitsdaten (PHI, US) | legal/regulatory |
| SOX | Finanzberichterstattung (börsennotiert, US) | legal/regulatory |

## 2. Controller vs Processor (DSGVO)

- **Controller:** bestimmt **Zweck und Mittel** der Verarbeitung (z. B. der Onlineshop, der Kundendaten erhebt).
- **Processor:** verarbeitet **im Auftrag** (z. B. der Cloud-/Mailversand-Dienstleister). Geregelt per **DPA (Auftragsverarbeitungsvertrag)**. Der Controller bleibt hauptverantwortlich.

## 3. Betroffenenrechte + Maßnahmen

| Recht | Maßnahme |
|-------|----------|
| Auskunft (Access) | Datenregister/Export-Funktion |
| Löschung (Right to be forgotten) | definierter Lösch-/Retention-Prozess, auch in Backups |
| Datenportabilität | strukturierter Export (maschinenlesbar) |
(+ Breach Notification binnen 72 h an die Aufsichtsbehörde.)

## 4. Szenario „EU-Onlineshop mit Kartenzahlung"

- **DSGVO:** verarbeitet personenbezogene Kundendaten in der EU → Pflichten (Rechtsgrundlage, Betroffenenrechte, DPA mit Dienstleistern, Breach-Notification).
- **PCI DSS:** akzeptiert Kreditkarten → vertraglich verpflichtet (sichere Speicherung/Übertragung, Netzsegmentierung, kein Speichern der CVV).
- Ggf. **SOC 2**, wenn er als Dienstleister Nachweise gegenüber Kunden braucht.

## Hinweise / Troubleshooting

- **PCI DSS ist vertraglich/industriell**, kein Gesetz – aber dennoch verpflichtend (Kartennetzwerke).
- „Right to be forgotten" betrifft auch **Backups/Logs** → Retention/Lösch-Konzept nötig.
- Data residency/sovereignty: **wo** Daten liegen, kann rechtlich entscheidend sein (Cloud-Region).
- Kein Rechtsrat – im Ernstfall juristische Prüfung.
