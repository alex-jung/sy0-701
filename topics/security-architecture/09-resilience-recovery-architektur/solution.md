# Lösung – Übung 09: Resilience & Recovery

## 1. Backup-Strategie (3-2-1, Beispiel)

| Asset | Typ | Frequenz (RPO) | Ziel (3-2-1) |
|-------|-----|----------------|--------------|
| OPNsense-Config | Export (full) | täglich (RPO 24 h) | lokal + offsite-Kopie |
| Repo/Doku | Git-Push (inkrementell) | laufend (RPO ~1 h) | GitHub (offsite) + lokal |
| VMs | Snapshot + Backup | vor Änderungen / wöchentlich | Proxmox + externes Medium |
→ 3 Kopien, 2 Medien, 1 offsite. Frequenz aus RPO abgeleitet.

## 2. Recovery-Sites

| Typ | Szenario | RTO |
|-----|----------|-----|
| Hot | geschäftskritisch, sofort | Minuten |
| Warm | wichtig, Stunden ok | Stunden |
| Cold | unkritisch, Tage ok | Tage |
Fürs Lab realistisch: eher **cold/warm** (Re-Deploy aus Backup/IaC) – Hot Site unwirtschaftlich.

## 3. Ransomware-Resilienz

- **Offline/immutable Backups** (nicht vom Produktivsystem beschreibbar) → Angreifer kann Backups nicht mitverschlüsseln.
- **Segmentierung** begrenzt Ausbreitung; **Least Privilege**; **Restore-Test** regelmäßig (Daten wirklich wiederherstellbar).
- Versionierte Snapshots → Rückkehr auf Stand vor Infektion.

## 4. Resilienz-Test (Beispiel)

- **Tabletop:** „OPNsense-Host fällt aus" durchspielen – Schritte/Runbook, Rollen, Lücken.
- **Failover/Restore-Test:** OPNsense aus Config-Backup neu aufsetzen, Zeit messen.
- **Erfolgskriterium:** wiederhergestellt **innerhalb RTO** (z. B. 2 h) mit max. **RPO** (24 h) Datenverlust; alle Dienste funktionsfähig.

## Hinweise / Troubleshooting

- **Backup ohne getesteten Restore = kein Backup** – regelmäßig üben.
- Immutable/offline ist der Schlüssel gegen Ransomware (online-only Backups werden mitverschlüsselt).
- Recovery-Site/HA an BIA/Kosten ausrichten (nicht alles „hot").
- Tests einplanen (Tabletop mindestens) – Pläne veralten sonst.
