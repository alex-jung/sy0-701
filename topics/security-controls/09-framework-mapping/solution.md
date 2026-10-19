# Lösung – Übung 09: Framework-Mapping

## 1. Charakterisierung

- **NIST 800-53:** sehr umfangreicher, granularer Control-Katalog (Families AC/AU/IA/SC/IR…); US-Behörden/Hochsicherheit; Referenz für detaillierte Anforderungen.
- **NIST CSF:** funktions-/risikoorientiert (Identify/Protect/Detect/Respond/Recover/Govern); gut zur Steuerung/Kommunikation; kein Detailkatalog.
- **CIS Controls v8:** 18 priorisierte, umsetzbare Controls mit IG1–IG3; ideal für pragmatischen Einstieg/KMU.
- **ISO 27001:** zertifizierbares **ISMS** (Management-System) + Annex-A-Controls; international, prozess-/governance-orientiert.

## 2. Crosswalk (Beispiel)

| Lab-Control | NIST 800-53 | CIS v8 | ISO 27001 Annex A |
|-------------|-------------|--------|-------------------|
| MFA | IA-2 | 6 (Access Mgmt) | A.8.5 |
| Audit-Logs/SIEM | AU-2/AU-6 | 8 | A.8.15 |
| Firewall/Segmentierung | SC-7 | 4/12 | A.8.20/8.22 |
| Backup/Restore | CP-9 | 11 | A.8.13 |
| Vuln-Mgmt (Greenbone) | RA-5 | 7 | A.8.8 |

## 3. Leitframework (Beispiel)

Fürs Lab: **CIS Controls v8 (IG1)** als Leit-/Einstiegsframework – priorisiert, praxisnah, klein genug. Bei Zertifizierungsziel/Unternehmenskontext: **ISO 27001** (ISMS) bzw. NIST CSF zur Steuerung.

## 4. Doppelarbeit sparen

Beispiel **MFA**: einmal umgesetzt + einmal getestet (Übung 08) → liefert gleichzeitig Nachweis für **NIST IA-2**, **CIS 6** und **ISO A.8.5**. Ein Crosswalk macht aus einer Maßnahme mehrere Compliance-Belege → weniger redundante Audits/Dokumentation.

## Hinweise / Troubleshooting

- Frameworks sind **komplementär**, nicht konkurrierend; CSF steuert, 800-53/ISO liefern Details.
- Crosswalk-Mappings sind „best effort" – 1:1-Entsprechungen gibt es selten, Kontext beachten.
- Compliance-Pflicht (PCI/HIPAA/DSGVO) kann das Framework **vorgeben** → zuerst Pflichten klären (`governance-compliance`).
