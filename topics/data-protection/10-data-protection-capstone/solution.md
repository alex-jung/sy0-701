# Lösung – Übung 10: Data-Protection-Strategie (Capstone)

Muster-Lösungspfad; Qualität = **durchgängige** Zuordnung Klasse→State→Control und belegte Entscheidungen.

## 1. Inventory & Classification
- ≥8 Datenarten (Keys/Secrets, OPNsense-Config, Logs, Übungen, README, Test-PII…), klassifiziert public→restricted (Übung 02).

## 2. Schutz je State (Beispiel-Auszug)
| Datenart | Klasse | At Rest | In Transit | In Use |
|----------|--------|---------|------------|--------|
| CA-/SSH-Keys | Restricted | LUKS/`chmod 400`/Passphrase | nur Public teilen | minimaler Zugriff |
| Logs | Confidential | FDE + Access | TLS zum SIEM | eingeschränkt |
| Test-PII | Confidential | verschlüsselt | TLS | Masking in Test |

## 3. Masking/Tokenization/DLP
- Test-DB: Masking/Pseudonymisierung (Übung 05); Egress/Mail: DLP-Policy „restricted-Tag → block" (Übung 06).

## 4. Key Management
- Lifecycle/Rotation/Storage (Übung 07): Keys getrennt, offline/Passphrase (bzw. HSM/KMS im realen Fall), Revocation vorgesehen.

## 5. Lifecycle/Retention/Sanitization
- Retention je Klasse; Löschung: Clear/Purge/Destroy bzw. Cryptographic Erase (Übung 08), Nachweis bei Entsorgung.

## 6. Privacy/Compliance
- Falls personenbezogen: Datenminimierung, Betroffenenrechte, Retention, Data Sovereignty (Übung 09); fürs reine Lab meist „keine echten PII – dokumentiert".

## 7. Schutz-Matrix + Report
`data-protection-template.md`: Management Summary, Classification-/Schutz-Matrix, Masking/DLP/Key-Mgmt/Sanitization, Privacy, Findings + priorisierte Maßnahmen.

## Bewertungs-Checkliste
- [ ] ≥8 Datenarten klassifiziert (Typ + Klasse)
- [ ] Schutz je State (at rest/in transit/in use) zugeordnet
- [ ] Masking/Tokenization/DLP wo nötig + Policy
- [ ] Key-Management (Lifecycle/Storage/Rotation)
- [ ] Retention + Sanitization je Klasse (NIST 800-88)
- [ ] Privacy/Compliance + Data Sovereignty berücksichtigt
- [ ] Vollständige Matrix + Report + Management Summary

## Häufige Fehler / Troubleshooting
- Nur „alles verschlüsseln" ohne Klassifizierung → ineffizient/Lücken; erst klassifizieren.
- „data in use" vergessen (nur at rest/in transit betrachtet).
- Retention/Sanitization fehlt → Daten-Hortung/Compliance-Risiko.
- Masking in Anzeige mit echtem Schutz verwechselt (Original dahinter ungeschützt).
