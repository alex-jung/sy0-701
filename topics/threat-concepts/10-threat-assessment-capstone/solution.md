# Lösung – Übung 10: Threat Assessment (Capstone)

Muster-Lösungspfad; Qualität = **Lagebild** mit realistischen Aktoren, belegten TTPs/IOCs und Control-Mapping inkl. Lücken.

## 1. Scope & Assets
- Lab-Kern: OPNsense, Ziel-/Analyse-VMs, Daten/Keys, Repo, Nutzerzugänge.

## 2. Threat Actors (realistisch, Ü01)
- Opportunistische externe (automatisierte Scans/Brute-Force), Supply-Chain (Image), fahrlässiger „Insider" (ich). Nation-state = unwahrscheinlich.

## 3. Attack Surface & Vektoren (Ü02/03)
- Offene Dienste (SSH/Web/SMB), verwundbare Legacy-VM, Phishing (Mensch), USB/Supply-Chain. Priorisiert nach Exposure.

## 4. Angriffsszenarien (ATT&CK, Ü07)
- Szenario A: SSH-Brute-Force (T1110) → Discovery (T1082) → Ingress Tool (T1105) → Execution (T1059) → Persistence (T1053).
- Szenario B: Phishing (T1566) → Credential Access → Lateral Movement (T1021) → Exfiltration (T1041).

## 5. IOCs/TTPs & TI (Ü06/08)
- IOCs aus Honeypot/SIEM (IPs/Hashes/Domains), TTPs wie oben; TI: CISA/CVE/KEV + eigene Lab-TI, bewertet nach Relevanz/Confidence.

## 6. Controls/Detection-Mapping (Ü07 security-controls)
| Stufe | Preventive | Detective | Lücke |
|-------|-----------|-----------|-------|
| Initial Access | MFA/Firewall | SIEM/Honeypot | FIDO2 fehlt |
| Execution | Hardening | EDR/Script-Log | kein EDR |
| Lateral Movement | Segmentierung | Zeek/SIEM | Detection dünn |
| Exfiltration | Egress-Filter | IDS/NetFlow | keine DLP |

## 7. Hunts & Empfehlungen
- Hunt: „wget+chmod+exec nach SSH-Login" (Ü09).
- Empfehlungen (priorisiert): FIDO2/MFA, EDR/Script-Logging, Lateral-Movement-Detection (Honeypot/Zeek), Egress-Filter.

## 8. Report
`threat-assessment-template.md`: Management Summary (Top-Bedrohungen, Reife, Prioritäten), Aktoren/Surface, Szenarien (ATT&CK), IOC/TTP/TI, Control-Lücken, Hunts, Roadmap.

## Bewertungs-Checkliste
- [ ] Scope/Assets + realistische Aktoren/Motivationen
- [ ] Attack Surface & Vektoren priorisiert
- [ ] ≥2 Szenarien als ATT&CK-Ketten
- [ ] IOCs/TTPs + bewertete TI
- [ ] Control-/Detection-Mapping mit Lücken
- [ ] ≥1 Hunt-Hypothese + priorisierte Empfehlungen
- [ ] Vollständiger Report + Management Summary

## Häufige Fehler / Troubleshooting
- Unrealistische Aktoren (APT fürs Heim-Lab) → Fehlpriorisierung.
- Szenarien ohne ATT&CK-Mapping → schwer auf Detection abzubilden.
- IOCs ohne TTP-Ebene → fragile Detection (Pyramid of Pain).
- Kein Control-Mapping → Assessment ohne Handlungswert.
