# Lösung – Übung 09: Privacy & Rechtliches

## 1. Privacy vs Security

- **Security:** schützt Daten (CIA) vor unbefugtem Zugriff/Verlust.
- **Privacy:** regelt den **rechtmäßigen Umgang** mit personenbezogenen Daten (Zweck, Einwilligung, Rechte).
- Beispiel „sicher, nicht konform": Eine Firma sammelt **mehr** personenbezogene Daten als nötig und speichert sie unbegrenzt – technisch verschlüsselt/zugriffsgeschützt (sicher), aber Verstoß gegen **Datenminimierung/Storage Limitation** (nicht datenschutzkonform).

## 2. Rollen (Szenario Onlineshop)

| Rolle | Aufgabe |
|-------|---------|
| Data Controller | der Shop (bestimmt Zweck/Mittel der Verarbeitung) |
| Data Processor | der Cloud-/Mailversand-Dienstleister (im Auftrag) |
| DPO | überwacht Datenschutz-Compliance, Ansprechpartner |
| Data Subject | der Kunde (betroffene Person mit Rechten) |

## 3. DSGVO-Prinzipien + Maßnahme

| Prinzip | Maßnahme |
|---------|----------|
| Data Minimization | nur nötige Felder erheben; Masking/Pseudonymisierung |
| Storage Limitation | Retention-/Lösch-Konzept (Übung 08) |
| Integrity/Confidentiality | Verschlüsselung at-rest/in-transit, Access Control |
| Accountability | Datenregister/DPIA, Nachweise (`governance-compliance`) |

## 4. Privacy by Design + DPIA

- **Privacy by Design/Default:** Datenschutz von Anfang an einbauen (minimale Datenerhebung, Defaults datensparsam, Betroffenenrechte vorgesehen: Auskunft/Löschung/Export).
- **DPIA (Data Protection Impact Assessment):** vor einem riskanten Verarbeitungsvorhaben Risiken für Betroffene bewerten + Maßnahmen festlegen → verhindert teure Nachbesserung und belegt Accountability.

## Hinweise / Troubleshooting

- Pseudonymisierung mindert Risiko, hebt DSGVO **nicht** auf (Übung 05).
- Löschung muss auch **Backups/Logs** berücksichtigen (Retention-Konzept).
- Data Sovereignty: Verarbeitungs-/Speicherort kann rechtlich entscheidend sein (Cloud-Region).
- Kein Rechtsrat – im Ernstfall juristische Prüfung.
