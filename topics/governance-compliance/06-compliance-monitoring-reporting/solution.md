# Lösung – Übung 06: Compliance-Monitoring & Reporting

## 1./2. Compliance-Matrix (Beispiel)

| Anforderung | Control | Evidence | Autom.? | Status |
|-------------|---------|----------|---------|--------|
| MFA für Zugänge | MFA (TOTP/FIDO2) | IdP-Logs, Config | SIEM/automatisch | partial |
| Zentrales Logging | Wazuh/SIEM | laufende Alerts/Index | automatisch | compliant |
| Vuln-Mgmt | Greenbone-Scans | Scan-Reports | automatisch | partial |
| Backups/RPO | Snapshots/Backup | Backup-Log/Restore-Test | teils automatisch | compliant |
| Secure Config | Hardening/Lynis | Lynis-Report | automatisch | partial |
| Access Reviews | Policy/Review | Review-Protokoll | manuell | non-compliant |
| Awareness | Training | Teilnahme/Checkliste | manuell | partial |

## 3. Score + Gaps

- Beispiel: 2 compliant, 4 partial, 1 non-compliant → grob **~ 55–60 %**.
- Top-Gaps: Access Reviews (non-compliant), MFA/Vuln-Mgmt/Secure-Config (partial).

## 4. Report (intern, 1 Seite) + extern

```
COMPLIANCE-REPORT (intern)     Referenz: CIS IG1    Stand: TT.MM.
Score: 58 %  Trend: ↗         Top-Findings: Access Reviews fehlen; MFA unvollständig
Maßnahmen: MFA ausrollen (Q1), Review-Prozess etablieren, CVE-Backlog schließen
```
- **Intern:** ehrlich, detailliert, maßnahmenorientiert (fürs eigene Steuern).
- **Extern** (Regulator/Kunde/Auditor): formeller, auf nachgewiesene **Evidence** gestützt, oft nur bestätigte/zertifizierte Aussagen (Attestation/Audit); keine „offenen Interna" ohne Kontext.

## Hinweise / Troubleshooting

- „Compliant" ohne **Evidence** ist wertlos → immer Nachweis verlinken.
- Compliance ≠ Security: man kann compliant und trotzdem unsicher sein (Mindestanforderung ≠ gutes Risiko-Niveau).
- Automatisierung (Continuous Compliance) senkt Audit-Aufwand erheblich.
