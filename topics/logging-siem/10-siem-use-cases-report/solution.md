# Lösung – Übung 10: SIEM-Use-Cases & Report

`siem-report-template.md` ist das Gerüst; hier der Denkweg.

## 1. Use-Cases definieren

Je Use-Case das Schema **Ziel → Quellen → Logik → Response → ATT&CK** (siehe Template Abschnitt 3). Beispiel UC1:
```
Ziel:    SSH-Brute-Force erkennen
Quellen: auth.log (Wazuh-Agent)
Logik:   Frequency-Rule >=6 Fehllogins/60s/IP (Übung 06, rule 100110)
Response: Quelle blocken, Konto prüfen
ATT&CK:  T1110
```
Mindestens UC1–UC4 (Brute-Force, PrivEsc, Lateral Movement, C2).

## 2. Testen

```bash
hydra -l root -P pass.txt <host> ssh      # UC1
sudo -s                                    # UC2
# PtH/SMB zwischen Hosts                    # UC3
# Sliver/Meterpreter-C2                     # UC4
```
Je Use-Case den ausgelösten Alert belegen (Rule-ID/Nachweis) → Status „getestet".

## 3. Coverage vs. ATT&CK

Use-Cases ins **MITRE-Modul** mappen; sichtbar machen, welche Taktiken abgedeckt sind und wo **Gaps** bleiben (z. B. TLS-C2 nur über Zeek-Metadaten, Exfil ungetestet). Gaps nach Risiko priorisieren.

## 4. Response-Playbooks

Pro Use-Case kurz: **Triage → Investigate → Contain** (siehe Template Abschnitt 6). Verweis auf das IR-Thema für die vollständige Behandlung.

## 5. Report

`siem-report-template.md` ausfüllen: Logging-Governance (Quellen/Retention/Integrität), Use-Case-Bibliothek, Test-Ergebnisse, Coverage-Gaps + Maßnahmen, Playbooks.

## Kernaussagen (Prüfung)

- **Use-Case-getrieben**: nicht „alles loggen", sondern gezielt erkennen (Ziel → Quelle → Logik → Response).
- **Coverage gegen ATT&CK** messen und Gaps schließen (Detection Engineering, fortlaufend).
- **Governance**: Quellen-Coverage, **Retention**, Integrität, Zeitsync, Zugriff.
- **Response-Anbindung**: SIEM-Alert ohne Playbook/IR ist halbe Miete.

## Häufige Fehler / Troubleshooting

- **Use-Case ohne Test:** jeder Use-Case muss mit einem realen Angriff belegt sein.
- **Coverage nur behauptet:** ATT&CK-Mapping + Nachweis, nicht Bauchgefühl.
- **Keine Retention/Governance:** Compliance-/Forensik-Lücke.
- **Alert ohne Response:** Playbook + Eskalation (Übung 07) ergänzen.
