# Übung 09 – Netzwerkgerät-/OPNsense-Härtung

**Schwierigkeit: 9/10 · Dauer: ca. 60 Min.**

## Lernziele

- Netzwerkgeräte (Firewall/Router/Switch) systematisch härten
- Management-Plane absichern (Out-of-band, sichere Protokolle)
- Secure Defaults durchsetzen (keine Default-Creds, unsichere Dienste aus)
- Die OPNsense selbst als kritisches Asset härten

## Theorie

Netzwerkgeräte sind **hochprivilegierte** Assets – ihre Kompromittierung betrifft das ganze Netz. Härtung:

- **Management-Plane:** Admin-Zugang nur **out-of-band**/aus dem Management-Netz, **HTTPS/SSH** statt HTTP/Telnet, **2FA**, Session-Timeouts, keine Default-Credentials.
- **Protokoll-Härtung:** unsichere Dienste aus (Telnet, SNMPv1/2c → **SNMPv3**), **sichere Routing-/Management-Protokolle**, NTP gesichert.
- **Secure Defaults:** default-deny, unnötige Dienste/Features aus, Firmware aktuell (Übung 08).
- **AAA/Logging:** zentrale Auth (RADIUS/TACACS+ in Firmen), Änderungs-Logging ins SIEM, Config-Backup/Versionierung.
- **OPNsense-spezifisch:** Bezug zu `firewall-opnsense` 01/09 (Anti-Lockout, HA, Backup, Härtung).

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| OPNsense Web-UI | Management-/Dienst-Härtung |
| Lynis/manuelle Checks | Baseline |
| SIEM/Syslog | Änderungs-/Zugriffs-Logging |

## Lab-Setup

- OPNsense-Lab (aus `firewall-opnsense`). Snapshot/Config-Backup.

## Aufgabe (selbst lösen)

1. Härte den **Management-Zugang**: HTTPS erzwingen, Web-UI nur Management-Netz, 2FA, SSH key-only/aus, Session-Timeout, keine Default-Creds.
2. Schalte **unsichere Dienste** ab und stelle SNMP (falls genutzt) auf **SNMPv3**.
3. Prüfe **Secure Defaults**: default-deny, unnötige Plugins/Features aus, Firmware aktuell.
4. Richte **Config-Backup/Versionierung** + **Logging** der Admin-Änderungen (ins SIEM) ein.
5. Dokumentiere eine **Härtungs-Checkliste** für Netzwerkgeräte und wende sie auf die OPNsense an.

**Ziel:** eine gehärtete OPNsense (Management, Dienste, Defaults, Backup/Logging) + eine wiederverwendbare Netzgerät-Härtungs-Checkliste.

## SY0-701 Prüfungsbezug

- **Network device hardening**, **management plane security (out-of-band)**, secure protocols (SSH/SNMPv3), **AAA**.
- **No default credentials**, Firmware/Patch, Config-Backup, Logging.
- Begriffe: *management plane*, *out-of-band management*, *SNMPv3*, *default credentials*, *AAA (RADIUS/TACACS+)*.
