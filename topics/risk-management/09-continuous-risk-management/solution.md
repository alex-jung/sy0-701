# Lösung – Übung 09: Continuous Risk Management

## 1. Zyklus + Übungs-Mapping

```
Identify (Ü02) -> Assess/Analyze (Ü03/04) -> Treat (Ü05) -> Monitor/Report (Ü08) -> Review -> (zurück zu Identify)
                      ^ BIA (Ü06), Third-Party (Ü07) fließen in Assess/Treat ein
```

## 2. Review-Rhythmus (Beispiel)

| Assessment | Typ | Rhythmus/Trigger |
|-----------|-----|------------------|
| Voll-Risk-Review | recurring | halbjährlich |
| Vuln-Scan/Gap | recurring | monatlich |
| KRI-Dashboard | continuous | laufend/wöchentlich |
| Ad-hoc-Review | ad hoc | nach Vorfall / große Änderung / neue CVE |

## 3. NIST RMF + Continuous Monitoring

- **Prepare → Categorize** (Assets/Impact, BIA) → **Select** (Controls, `security-controls`) → **Implement** → **Assess** (Wirksamkeit, Ü08 security-controls) → **Authorize** (Risk Acceptance, Ü05) → **Monitor** (continuous).
- **Continuous Monitoring im Lab:** Greenbone (offene CVEs), Wazuh/Suricata (Alerts), Patch-/Backup-Stand, KRIs aus Übung 08 → automatische/regelmäßige Aktualisierung des Registers.

## 4. Ad-hoc-Trigger (Beispiele)

1. **Security-Incident** (etwas ist passiert) → Re-Assessment betroffener Assets.
2. **Große Änderung** (neues System/Netzsegment, Architektur-Umbau) → Change-getriebenes Assessment.
3. **Neue kritische Vulnerability/Threat-Intel** (z. B. 0-day in eingesetztem Produkt).

## Hinweise / Troubleshooting

- „Einmal im Jahr" reicht nicht für schnelllebige Threats → continuous + ad hoc kombinieren.
- Change-Management ist der wichtigste Re-Assessment-Trigger (Risiken ändern sich mit dem System).
- Register konsequent pflegen, sonst veraltet und wertlos.
