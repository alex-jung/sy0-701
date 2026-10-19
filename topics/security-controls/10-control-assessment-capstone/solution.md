# Lösung – Übung 10: Control-Assessment (Capstone)

Muster-Lösungspfad; die Qualität liegt in der **Durchgängigkeit** (Inventar→Gaps→Mapping→Wirksamkeit→Empfehlung) und in den **Belegen**.

## 1. Scope & Methodik
- Scope: OPNsense + Lab-VLANs + Kali + Ziel-VMs + SIEM/IDS. Leitframework: **CIS v8 IG1** (Baseline), Mapping zusätzlich NIST CSF/ISO.

## 2. Inventar & Klassifizierung
- Tabelle aus Übung 04 (≥15 Controls), je Kategorie (technical/managerial/operational/physical) × Typ (preventive/detective/…).

## 3. Gap-Analyse
- Gegen CIS IG1 (Übung 05): Top-Gaps z. B. MFA fehlt, kein Vuln-Mgmt-Zyklus, Secure-Config lückenhaft; mit Lynis/nmap/Greenbone belegt; nach Risiko sortiert.

## 4. Mapping
- ATT&CK-Coverage für ein Szenario (Übung 07) + Framework-Crosswalk für Kern-Controls (Übung 09).

## 5. Wirksamkeit
- 3 Controls aktiv getestet (Übung 08): preventive (Scan/Exploit blockiert), detective (SIEM-Alarm + MTTD), corrective (Restore). Beweise beilegen.

## 6. Compensating Controls
- Für nicht schließbare Gaps (z. B. Legacy, kein HSM) dokumentierte Ersatzmaßnahmen (Übung 06) mit Rest-Risiko/Review.

## 7. Empfehlungen & Roadmap
- **Quick Wins:** MFA erzwingen, Lynis-Suggestions, Egress-Filter.
- **Mittelfristig:** Vuln-Mgmt-Zyklus, Detect/Respond stärken (EDR/Sysmon, Playbooks).
- **Langfristig:** Framework-Zertifizierungsreife, Continuous Validation.
- Rest-Risiko je Empfehlung benennen.

## 8. Report
`control-assessment-template.md` vollständig (Management Summary verständlich für Nicht-Techniker, Details im Anhang).

## Bewertungs-Checkliste
- [ ] Scope + Leitframework definiert
- [ ] ≥15 Controls inventarisiert + zweidimensional klassifiziert
- [ ] Gap-Analyse mit Tool-Belegen, risikopriorisiert
- [ ] ATT&CK- **und** Framework-Mapping
- [ ] ≥3 Controls aktiv validiert (Beweis) + KPIs
- [ ] ≥2 Compensating Controls dokumentiert
- [ ] Priorisierte Roadmap + Rest-Risiko
- [ ] Vollständiger, management-tauglicher Report

## Häufige Fehler / Troubleshooting
- Inventar ohne Wirksamkeitsnachweis (alles „aktiv", nichts getestet).
- Gaps unpriorisiert / ohne Risiko → kein Entscheidungswert fürs Management.
- Nur „Protect"-Controls; Detect/Respond/Recover vergessen.
- Report zu technisch ohne Management Summary → Adressaten verfehlt.
