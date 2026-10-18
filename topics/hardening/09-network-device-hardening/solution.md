# Lösung – Übung 09: Netzwerkgerät-/OPNsense-Härtung

> Config-Backup + Snapshot vorher.

## 1. Management-Zugang

- **System → Settings → Administration:** HTTPS erzwingen, „Listen Interfaces" = **nur Management/LAN** (nicht WAN), Session-Timeout, HTTP→HTTPS-Redirect.
- **Users:** starkes Admin-PW, **TOTP-2FA**; SSH nur bei Bedarf **key-only** (Passwort aus) oder ganz aus.
- **Default-Credentials**: kein `root/opnsense`-Standard – ändern.

## 2. Unsichere Dienste / SNMP

- Telnet/unnötige Dienste aus. Falls SNMP genutzt: **SNMPv3** (Auth+Priv) statt v1/v2c-Community (vgl. `enumeration` 03).

## 3. Secure Defaults

- Firewall **default-deny** (WAN), unnötige **Plugins/Features** entfernen, **Firmware aktuell** (System → Firmware, Übung 08), Anti-Lockout bewusst (firewall-opnsense 01).

## 4. Backup/Versionierung + Logging

- **System → Configuration → Backups:** automatische Backups (Nextcloud/Git), Config-History (Rollback).
- Admin-Änderungen/Logins per **Syslog ins SIEM** (`logging-siem` 02) → Nachvollziehbarkeit/Alerting.

## 5. Härtungs-Checkliste (Netzgeräte)

```
[ ] keine Default-Credentials, starke PW + 2FA
[ ] Management nur out-of-band/Management-Netz, HTTPS/SSH
[ ] unsichere Protokolle aus (Telnet, SNMPv1/2c, HTTP)
[ ] default-deny, unnötige Dienste/Features/Plugins aus
[ ] Firmware aktuell (Patch-Prozess)
[ ] Config-Backup + Versionierung + Rollback
[ ] zentrale AAA (Firmen: RADIUS/TACACS+), Logging ins SIEM
[ ] NTP gesichert, Zeitsync
[ ] HA/Redundanz wo nötig (CARP)
```
Auf die OPNsense anwenden + Lücken dokumentieren.

## Häufige Fehler / Troubleshooting

- **Management auf WAN erreichbar:** gravierende Fehlkonfig → Listen-Interface/Regeln prüfen.
- **Ausgesperrt:** Anti-Lockout/Konsole/Snapshot (firewall-opnsense 01/09).
- **SNMPv2c „public" vergessen:** klassischer Enumeration-Einstieg → v3 oder aus.
- **Kein Backup vor Härtung:** erst sichern.
