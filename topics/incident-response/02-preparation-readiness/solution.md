# Lösung – Übung 02: Preparation & Readiness

## 1. IR-Plan (Kurzform)

```
Phasen:        NIST 1–4 (Übung 01)
Rollen:        Incident Commander, Analyst/Forensik, Comms, Management-Kontakt
Eskalation:    SEV1 -> sofort IC + Management; SEV2 -> IC; SEV3 -> Analyst
Befugnisse:    Wer darf Systeme isolieren/abschalten? (vorab festlegen!)
Doku:          durchgängig Zeitstempel + Aktionen protokollieren
```

## 2. Playbook (Beispiel: kompromittierter Host)

```
Identification: Alert bestätigen (SIEM/IDS), Host + Scope bestimmen
Containment:    Host isolieren (VLAN/Firewall), NICHT ausschalten (Memory!)
                Beweise sichern (Übung 05/06)
Eradication:    Malware/Persistence entfernen, Ursache schließen (Patch/Config)
Recovery:       aus Known-Good wiederherstellen, verschärft überwachen
Lessons Learned: Postmortem (Übung 09)
```

## 3. Kommunikation

Kontaktliste (Rollen, Rufnummern), definierte Trigger (wer wird bei welcher Severity informiert). **Out-of-band**, weil der normale Kanal (E-Mail/Chat im Firmennetz) **kompromittiert/mitgelesen** sein könnte oder bei Ransomware ausfällt → separate Nummern/Messenger/Telefon.

## 4. Readiness-Checkliste

- [ ] Zentrales Logging aktiv + ausreichend Retention (`logging-siem`)
- [ ] Detection/Alerting funktioniert (`ids-ips`)
- [ ] **Backups vorhanden UND getestet** (Restore geprüft)
- [ ] Snapshots der kritischen VMs
- [ ] Asset-Inventar + Netz-/Baseline-Doku (Known-Good)
- [ ] Forensik-Tools bereit, Rollen/Kontakte definiert
→ Lab dagegen prüfen und Lücken notieren.

## 5. Jump Bag (Toolkit)

Imaging (`dd`/`dc3dd`), Hashing, Memory-Acquisition (avml/LiME), Live-Response-Scripts (UAC), bootfähiges Analyse-Medium, write-blocker (bzw. read-only-Mount-Prinzip), Dokumentationsvorlagen (Chain of Custody), saubere Datenträger für Images.

## Häufige Fehler / Troubleshooting

- **Backups nie getestet:** im Ernstfall nicht wiederherstellbar → Restore regelmäßig üben.
- **Keine Out-of-band-Comms:** bei Kompromittierung/Ransomware kommunikationsunfähig.
- **Befugnisse unklar:** niemand traut sich zu isolieren/abzuschalten → vorab klären.
- **Kein Playbook:** Improvisation unter Stress = Fehler/Beweisverlust.
