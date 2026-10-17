# Lösung – Übung 09: HA, Backup & Hardening

## 1. Backup + Config-History

- **System → Configuration → Backups:** „Download configuration" → XML sichern (optional verschlüsselt). Automatisch zu Nextcloud/Git möglich.
- **History-Tab:** jede Änderung ist versioniert → eine frühere Version auswählen und **„Revert"** (Rollback). Vorher einen kleinen Change machen, dann zurückrollen.

## 2. CARP-Failover (2 Knoten)

- **Interfaces → Virtual IPs → Add:** Typ **CARP**, virtuelle IP im Segment, VHID, Passwort (gleich auf beiden).
- **System → High Availability → Settings:** Backup-Peer-IP, **pfsync** (State-Sync) + **XMLRPC Sync** (Config) aktivieren.
- Clients nutzen die **CARP-VIP** als Gateway. Test: Master herunterfahren → Backup wird Master (CARP-Status „MASTER"), Verbindungen laufen weiter.

## 3. Hardening (Beispiele)

- **System → Access → Users:** TOTP-**2FA** fürs Web-UI.
- **System → Settings → Administration:** HTTPS, Web-UI nur LAN, SSH aus/key-only.
- **System → Firmware → Plugins:** ungenutzte Pakete entfernen; nur benötigte Dienste.
- Logging aktiv (Übung 06), starke Passwörter, kein WAN-Management.

## 4. Updates

**System → Firmware → Check for updates → Update.** Regelmäßig Patches einspielen (Firewall ist exponiert und kritisch → zeitnah patchen). Vorher Backup.

## 5. HA = Security (Availability)

Verfügbarkeit ist die **A** in CIA. Fällt die Firewall aus, ist das ganze Netz offline (oder – schlimmer – fällt in einen unkontrollierten Zustand). CARP sorgt für **Failover** → Dienst bleibt erreichbar, Sicherheitskontrollen bleiben aktiv. **Backups** sind Teil von **Recovery/IR**: nach Fehlkonfiguration/Kompromittierung schnell ein sauberer Stand.

## Häufige Fehler / Troubleshooting

- **CARP bleibt BACKUP/„both MASTER":** VHID/CARP-Passwort/Subnetz unterschiedlich; Layer-2 zwischen den Knoten nötig; Proxmox-Bridge erlaubt Multicast.
- **Sync greift nicht:** XMLRPC-Credentials/Interface; pfsync-Interface definiert.
- **Nach Restore kein Zugriff:** Interface-Zuordnung passt nicht zur neuen Hardware → Konsole.
- **Nur 1 VM:** CARP konzeptionell dokumentieren; Backup/Hardening/Updates praktisch durchführen.
