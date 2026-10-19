# Lösung – Übung 06: Honeytokens & Canaries

## 1./2. Canarytokens erzeugen + auslösen

Auf canarytokens.org (oder self-hosted Docker `thinkst/canarytokens`):
- **DNS-Token:** eindeutiger Hostname → wird bei DNS-Auflösung getriggert. Platzieren z. B. in einem Script/Config-Kommentar.
- **Web-URL-Token:** eingebettet als „interner Link"/Bild-URL. Abruf → Alarm.
- **MS-Word/Excel-Token:** Köder-Dokument; Öffnen löst aus (beacon).

Auslösen:
```bash
nslookup <dns-token-host>           # DNS-Token
curl https://canarytokens.com/<id>  # URL-Token
# Office-Doc einfach öffnen
```
Jeder Trigger → Alert-Mail/Webhook mit Quell-IP/Zeit.

## 3. Honeyfile + SIEM-Audit (Linux, auditd → Wazuh)

```bash
sudo apt install -y auditd
echo "streng vertraulich" | sudo tee /srv/share/gehaelter_2026.xlsx
sudo auditctl -w /srv/share/gehaelter_2026.xlsx -p r -k honeyfile
# Test: cat /srv/share/gehaelter_2026.xlsx
sudo ausearch -k honeyfile
```
Wazuh-Agent liest auditd → Regel/Alert auf `key=honeyfile`. (Windows: Objekt-SACL + Event-ID 4663.)

## 4. Canary-Account (AD)

- Benutzer `svc-backup-legacy` anlegen, **nie** verwenden, in Beschreibung glaubwürdig.
- Wazuh/SIEM-Regel: Alarm bei **jedem** Logon/Kerberos-Request (Event 4624/4768/4625) für diesen Account → sofortiges Breach-Signal.

## Härtung/Betrieb

- Token-Platzierung dokumentieren (sonst verwirren sie später das eigene Team).
- Alerts an IR-Prozess koppeln (`incident-response`): Honeytoken-Alarm = High Priority.

## Häufige Fehler / Troubleshooting

- Token zu „offensichtlich" platziert → unglaubwürdig; realistisch benennen/verorten.
- auditd-Regel nicht persistent → in `/etc/audit/rules.d/` eintragen.
- Eigene Admin-/Backup-Prozesse lösen Token aus → Köder bewusst außerhalb legitimer Pfade.
