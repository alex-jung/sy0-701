# Lösung – Übung 02: Risk Register

## 1./2./3. Risk Register (Auszug, Beispiel)

| ID | Beschreibung (Threat×Vuln→Asset) | Kategorie | Likelihood | Impact | Risiko | Owner | Control | Status |
|----|----------------------------------|-----------|-----------|--------|--------|-------|---------|--------|
| R1 | Angreifer nutzt ungepatchten Dienst → Ziel-VM | operational/legacy | Hoch | Hoch | Hoch | du | Segmentierung, Patch | offen |
| R2 | Kein Backup → Verlust Lab-Config | operational | Mittel | Hoch | Hoch | du | Snapshots/Backup | behandelt |
| R3 | Schwache Passwörter → Account-Takeover | internal | Mittel | Mittel | Mittel | du | MFA, Policy | offen |
| R4 | Malware-Ausbruch aus Analyse-VM | operational | Niedrig | Hoch | Mittel | du | Isolation (malware-analysis) | behandelt |
| R5 | OPNsense-Fehlkonfig → Exposure | internal | Mittel | Hoch | Hoch | du | Review, Backups | offen |
| R6 | Stromausfall → Ausfall | operational | Niedrig | Mittel | Niedrig | du | USV (geplant) | akzeptiert |
| R7 | Veraltete Abhängigkeit/Lizenz | software compliance | Niedrig | Niedrig | Niedrig | du | Update-Check | offen |
| R8 | Datenabfluss (Secrets im Repo) | reputational/IP | Mittel | Hoch | Hoch | du | .gitignore, Secret-Scan | behandelt |
| R9 | Fehlbedienung/Human Error | internal | Mittel | Mittel | Mittel | du | Doku, Snapshots | offen |
| R10 | Third-Party-Image kompromittiert | supply chain | Niedrig | Hoch | Mittel | du | Hash/Signatur prüfen | offen |

## 4. Quellen

- **Vuln-Scan (Greenbone/nmap):** R1, R5, R7.
- **Inventar/Review:** R2, R5, R8.
- **Incident-Historie/Brainstorming:** R3, R4, R6, R9, R10.
Oft am ergiebigsten: Kombination aus Scan (konkret, technisch) + Brainstorming (deckt nicht-technische Risiken ab).

## Hinweise / Troubleshooting

- Risk Register ist **lebend** – IDs stabil halten, Status/Updates pflegen.
- „Owner = ich" im Ein-Personen-Lab ist ok, aber die **Rolle** benennen (Accountability).
- Noch keine Zahlen/Treatment-Entscheidung – kommt in 03–05.
