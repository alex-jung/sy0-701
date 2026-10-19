# Lösung – Übung 08: KRIs & Reporting

## 1./2. KRIs + Schwellen (Beispiel)

| KRI | Grün | Gelb | Rot | Quelle | Status |
|-----|------|------|-----|--------|--------|
| Offene kritische CVEs | 0 | 1–2 | ≥3 | Greenbone | z. B. gelb |
| Patch-Rückstand (Tage) | <7 | 7–30 | >30 | Update-Log | grün |
| Fehlgeschlagene Logins/Tag | <20 | 20–100 | >100 | Wazuh | grün |
| Überfällige Zugriffs-Reviews | 0 | 1 | ≥2 | Register | gelb |
| Backup-Alter (h) vs. RPO | ≤RPO | ≤2×RPO | >2×RPO | Backup-Log | grün |

## 3. KRI vs KPI

- „Mittlere Zeit bis Patch" als **KPI** = wie gut arbeitet mein Patch-Prozess; als **KRI** = je länger, desto höher das Angriffsrisiko. Blickwinkel entscheidet.
- „Phishing-Klickrate": KPI fürs Awareness-Programm (Wirksamkeit), KRI für das Social-Engineering-Risiko.

## 4. Risk-Dashboard (Skizze, 1 Seite)

```
RISK DASHBOARD – Lab           Stand: TT.MM.JJJJ   Gesamttrend: ↘ (sinkend)

[Heatmap 5x5]      TOP-5-RISIKEN              KRI-AMPELN
 rot: R1,R2,R5     1 R1 ungepatcht  (H) ↘    CVEs      🟡
 gelb: R3,R8...    2 R2 Backup      (H) ✅    Patch     🟢
 grün: R7          3 R5 OPNsense    (H) →     Logins    🟢
                   4 R8 Secrets     (M) ↘    Reviews   🟡
                   5 R3 Passwörter  (M) →     Backup    🟢
EMPFEHLUNG: MFA ausrollen (R3), CVE R1 schließen.
```
Management sieht Ampel/Trend/Top-5 + eine klare Empfehlung; Details im Register/Anhang.

## Hinweise / Troubleshooting

- KRIs müssen **messbar** und mit **Schwellen** versehen sein, sonst keine Steuerung.
- Leading (vorlaufend, z. B. Patch-Rückstand) vs. lagging (nachlaufend, z. B. Anzahl Incidents) Indikatoren mischen.
- Reporting adressatengerecht: Management will Entscheidung, nicht Rohdaten.
