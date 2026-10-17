# Lösung – Übung 01: Logging-Grundlagen

## 1. Linux-Logs sichten

```bash
sudo journalctl -u ssh --since "1 hour ago"
sudo cat /var/log/auth.log | grep -Ei 'sshd.*(Failed|Accepted)'
# Failed password ... = Fehllogin ; Accepted password/publickey = Erfolg
```
Fehlgeschlagene SSH-Logins → `Failed password` (auth.log / journal). Erfolgreiche → `Accepted`.

## 2. logger-Testmeldung

```bash
logger -p auth.warning "SY0701-TEST: Übung Logging"
sudo journalctl | grep SY0701-TEST
# oder: grep SY0701-TEST /var/log/syslog
```
`-p facility.severity` setzt z. B. `auth.warning`.

## 3. Formate vergleichen

- **Syslog-Zeile:** `Oct 17 10:00:00 host sshd[123]: Failed password for root from 1.2.3.4` – menschenlesbar, aber unstrukturiert (Parsing nötig).
- **JSON (eve.json):** `{"timestamp":"...","event_type":"alert","src_ip":"...","alert":{"signature":"..."}}` – **maschinenlesbar**, feldbasiert → SIEM kann direkt indexieren/filtern. JSON gewinnt für Automatisierung.

## 4. Zeitsync prüfen

```bash
timedatectl           # "System clock synchronized: yes", NTP active
```
Ohne synchrone Zeit stimmen Zeitstempel verschiedener Quellen nicht überein → man kann Ereignisse (Firewall-Block + IDS-Alert + Host-Login) nicht korrekt **korrelieren** und die Forensik-Timeline ist falsch.

## 5. Quellen-Inventur (Beispiel)

| Quelle | Nutzen |
|--------|--------|
| auth.log / Security-Event | Logins, PrivEsc, Brute-Force |
| OPNsense Syslog | geblockte/erlaubte Flows, Scans |
| Suricata eve.json | IDS/IPS-Alerts |
| Web/DB-Logs | App-Angriffe (SQLi/Upload) |
| Sysmon (Win) | Prozess-/Netz-/Datei-Events |

## Häufige Fehler / Troubleshooting

- **Zeit nicht synchron:** NTP aktivieren (`timedatectl set-ntp true`) – zuerst, sonst ist alles Weitere unzuverlässig.
- **Log rotiert/weg:** lokale Logs sind flüchtig → zentral sammeln (Übung 02).
- **Severity verwechselt:** 0 = schlimmste (emerg), 7 = debug.
- **Windows:** Security-Log braucht passende Audit-Policy, sonst fehlen Login-Events.
