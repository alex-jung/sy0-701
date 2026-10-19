# Lösung – Übung 10: Governance-Programm (Capstone)

Muster-Lösungspfad; Qualität = **Konsistenz** über alle Bausteine (Policies↔Rollen↔Framework↔Compliance↔Audit↔Data↔Awareness).

## 1. Governance-Charta
- Zweck: sicherer, legaler, nachvollziehbarer Lab-Betrieb. Scope: gesamtes Lab. Prinzipien: Least Privilege, Nachweisbarkeit, Risikobasiertheit. Struktur/RACI aus Ü03 (Lab-Owner accountable).

## 2. Policy-Set
- „Lab Security & Acceptable Use Policy" (Ü02) + Standards (MFA/SSH/Passwort) + Procedures (MFA-Setup, VM-Onboarding). Hierarchie konsistent.

## 3. Framework & Regulierung
- Leitframework: **NIST CSF + CIS IG1** (Ü04). Regulierungen im Szenario: DSGVO (falls personenbezogene Daten), PCI (falls Kartendaten) – fürs reine Lab meist „nicht anwendbar, dokumentiert" (Ü05).

## 4. Compliance
- Compliance-Matrix (Ü06): Anforderung→Control→Evidence→Status; Score ~60 %; Monitoring via SIEM/Scanner + manuelle Reviews.

## 5. Audit
- Audit-Plan: Self-Audit halbjährlich gegen Policy/CIS; Findings (Ü07): MFA unvollständig (hoch), CVE-Backlog (mittel), fehlende Access-Reviews (mittel).

## 6. Data Governance
- Klassifizierung public/internal/confidential/restricted (Ü08); CA-/SSH-Keys = Restricted; Rollen Owner/Custodian; Lifecycle inkl. sicherer Löschung.

## 7. Awareness
- Jahresprogramm (Ü09) + Metriken (Klickrate < 5 %, Reporting > 70 %); Phishing-Sim nur im Lab.

## 8. Review & Roadmap
- Review halbjährlich + ad hoc; Roadmap: Quick Wins (MFA, Access-Reviews), mittel (Compliance-Automatisierung), lang (ISO-Reife). Management Summary oben.

## Bewertungs-Checkliste
- [ ] Charta (Zweck/Scope/Prinzipien/RACI)
- [ ] Policy + abgeleitete Standards/Procedures (konsistent)
- [ ] Leitframework + relevante Regulierungen zugeordnet
- [ ] Compliance-Matrix + Score + Monitoring
- [ ] Audit-Plan + Beispiel-Findings
- [ ] Data-Klassifizierung + Rollen + Lifecycle
- [ ] Awareness-Programm + Metriken
- [ ] Review-Zyklus + priorisierte Roadmap + Management Summary

## Häufige Fehler / Troubleshooting
- Policy-Hierarchie inkonsistent (Standard widerspricht Policy).
- Compliance „compliant" ohne Evidence.
- Owner/Custodian-Rollen vermischt.
- Programm ohne Review-Zyklus → veraltet; kein Management Summary → Adressaten verfehlt.
