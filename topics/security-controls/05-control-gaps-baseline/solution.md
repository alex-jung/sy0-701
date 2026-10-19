# Lösung – Übung 05: Control-Gaps gegen CIS

## 1. Baseline (CIS v8 IG1, Auszug)

- CIS 1/2: Inventar Hardware/Software · 3: Datenschutz · 4: Secure Configuration · 5/6: Account-/Access-Mgmt · 7: Continuous Vuln-Mgmt · 8: Audit-Logs · 10: Malware-Abwehr · 11: Data Recovery/Backup · 14: Awareness.

## 2. Gap-Analyse (Beispiel)

| CIS-Anforderung | Ist | Status |
|-----------------|-----|--------|
| 1/2 Asset-Inventar | teils (Control-Inventar, aber kein HW/SW-Inventar) | teilweise |
| 4 Secure Config | Hardening teilweise | teilweise |
| 5/6 Account-/MFA | MFA geplant | fehlt |
| 7 Vuln-Mgmt | Greenbone vorhanden, kein Zyklus | teilweise |
| 8 Audit-Logs | Wazuh aktiv | erfüllt |
| 11 Backup | Snapshots | erfüllt |
| 14 Awareness | informell | teilweise |

## 3. Technische Belege

```bash
sudo lynis audit system            # Warnings/Suggestions = Config-Gaps (CIS 4)
nmap -sV <host>                    # unnötige offene Dienste (CIS 4)
# Greenbone-Scan -> offene CVEs (CIS 7)
```

## 4. Top-5 priorisiert (Beispiel)

| Gap | Risiko | Maßnahme |
|-----|--------|----------|
| MFA fehlt | hoch | MFA erzwingen (`authentication`) |
| Kein Vuln-Mgmt-Zyklus | hoch | monatlicher Greenbone-Scan + Remediation |
| Secure Config lückenhaft | mittel | Lynis-Suggestions abarbeiten, CIS-Benchmark |
| Kein HW/SW-Inventar | mittel | Inventar-Liste/Tool |
| Awareness informell | niedrig | kurzer Self-Check/Checkliste |

## Hinweise / Troubleshooting

- Baseline **realistisch** wählen (IG1 fürs Lab), sonst nur „rote" Liste ohne Nutzen.
- Lynis ist CIS-**nah**, aber kein zertifizierter CIS-CAT-Scan → als Indiz, nicht als Audit-Beweis.
- Gaps immer mit Risiko priorisieren (nicht alphabetisch/zufällig).
