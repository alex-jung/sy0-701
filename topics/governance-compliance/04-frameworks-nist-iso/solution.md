# Lösung – Übung 04: Frameworks

## 1. Charakterisierung

- **NIST CSF:** funktions-/risikoorientiert (Identify/Protect/Detect/Respond/Recover/Govern); steuert & kommuniziert Security-Risiken; nicht zertifizierend.
- **NIST RMF (800-37):** formaler Risiko-/Autorisierungsprozess (Categorize→…→Monitor); v. a. US-Behörden; sehr prozessual.
- **ISO 27001:** zertifizierbares **ISMS** (PDCA + Annex-A-Controls); Fokus Governance/Prozess + international anerkannter Nachweis.
- **COBIT:** IT-Governance-Framework (ISACA); richtet IT an Geschäftszielen aus, trennt Governance/Management; stark im Audit/Steuerungskontext.

## 2. Zuordnung

| Bedürfnis | Framework |
|-----------|-----------|
| Zertifizierung anstreben | ISO 27001 |
| IT an Business ausrichten/Audit | COBIT |
| Risiken ans Management berichten | NIST CSF |
| priorisierte Quick Wins | CIS Controls |
| behördlicher Autorisierungsprozess | NIST RMF |

## 3. Leitframework (Beispiel)

Fürs Lab: **NIST CSF** als Steuerungsrahmen (verständlich, funktionsorientiert) + **CIS Controls v8** für die konkrete Umsetzung. Bei Zertifizierungsabsicht: **ISO 27001**.

## 4. Komplementär

Frameworks adressieren unterschiedliche Ebenen: CSF **steuert** (Funktionen), 800-53/ISO Annex A liefern **Detail-Controls**, COBIT verbindet mit **Business/Governance**, CIS gibt **Priorisierung**. Man nutzt sie kombiniert (Crosswalk, `security-controls` 09), nicht als Entweder-oder.

## Hinweise / Troubleshooting

- Nur ISO 27001 ist (für Organisationen) klassisch **zertifizierbar**; CSF/COBIT sind Rahmen.
- CSF 2.0 ergänzte die Funktion **Govern** – prüfungsrelevant.
- Framework wählt man nach **Ziel** (Zertifizierung/Audit/Kommunikation), nicht nach Popularität.
