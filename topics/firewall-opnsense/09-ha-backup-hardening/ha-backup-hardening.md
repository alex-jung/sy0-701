# Übung 09 – High Availability (CARP) & Config-Backup/Hardening

**Schwierigkeit: 9/10 · Dauer: ca. 75 Min.**

## Lernziele

- High Availability mit CARP verstehen (Failover-Firewall-Paar)
- Config-Backup/-Restore und Versionierung beherrschen
- OPNsense-Hardening-Maßnahmen umsetzen
- Verfügbarkeit als Sicherheitsziel (Availability) einordnen

## Theorie

Die Firewall ist ein **Single Point of Failure** – fällt sie aus, steht das Netz. **Availability** ist Teil der CIA-Triade.

- **CARP (Common Address Redundancy Protocol):** zwei OPNsense-Knoten teilen sich eine **virtuelle IP**; der Backup übernimmt bei Ausfall des Masters (Failover). **pfsync** synchronisiert States, **XMLRPC** die Konfiguration → nahtloses Umschalten.
- **Config-Backup:** OPNsense sichert die gesamte Konfiguration als **XML** (lokal, verschlüsselt, Cloud/Nextcloud, Git). Vor jeder Änderung + regelmäßig; **Restore** stellt sie wieder her. OPNsense führt zudem ein **Config-History** (Rollback einzelner Änderungen).
- **Hardening:** Management-Zugang (nur LAN/2FA/HTTPS), ungenutzte Dienste/Pakete aus, aktuelle Updates/Patches, starke Passwörter, Logging aktiv, minimale Angriffsfläche.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Interfaces → Virtual IPs (CARP) | virtuelle IP/Failover |
| System → High Availability | pfsync/XMLRPC-Sync |
| System → Configuration → Backups | Backup/Restore/History |
| System → Firmware | Updates/Patches |

## Lab-Setup

- Idealerweise zwei OPNsense-VMs (Master/Backup) für CARP; sonst CARP konzeptionell + Backup/Hardening praktisch. Backup vorab.

## Aufgabe (selbst lösen)

1. Erstelle ein **Config-Backup** (Download der XML) und nutze die **Config-History**, um eine Änderung zu rollbacken.
2. (CARP, wenn 2 Knoten) richte eine **virtuelle CARP-IP** + HA-Sync ein und teste **Failover** (Master herunterfahren → Backup übernimmt).
3. Führe mindestens drei **Hardening-Maßnahmen** durch (z. B. 2FA fürs Web-UI, ungenutzte Dienste aus, Updates einspielen).
4. Prüfe den **Patch-/Update-Stand** (System → Firmware) und spiele Updates ein.
5. Erkläre, warum HA eine **Sicherheits**-Maßnahme ist (Availability) und wie Backups zu IR/Recovery gehören.

**Ziel:** ein gesichertes, aktualisiertes, gehärtetes OPNsense (+ nach Möglichkeit ein getestetes CARP-Failover).

## SY0-701 Prüfungsbezug

- **High Availability / Redundancy / Failover** (Availability, CIA); CARP/Active-Passive.
- **Backup/Restore, Configuration Management, Patch-Management**, Rollback.
- **Hardening / secure baseline** der Sicherheitsinfrastruktur selbst.
- Begriffe: *high availability*, *failover/redundancy*, *CARP*, *configuration management*, *patch management*, *hardening*.
