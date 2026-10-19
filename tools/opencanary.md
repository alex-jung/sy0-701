# OpenCanary

**Kategorie:** Honeypot (leichtgewichtig, Multi-Protocol) / Canary

Schlanker Daemon (Thinkst) mit vielen emulierten Diensten (FTP, HTTP, SSH, SMB, MySQL, MSSQL, SNMP, RDP, VNC …) und einfachem **Alerting** (Log/Mail/Webhook/Syslog). Gut für breite, günstige interne Frühwarnung und **Canary-Dienste**.

```bash
pip install opencanary
opencanaryd --copyconfig     # ~/.opencanary.conf
opencanaryd --start
```

## Wichtige Konfig (~/.opencanary.conf)

| Schlüssel | Zweck |
|-----------|-------|
| `"<svc>.enabled": true` | Dienst aktivieren (ftp/http/ssh/mysql …) |
| `"logger"` → handlers | Alert-Ziel (File/SMTP/Webhook/Syslog) |
| `/var/tmp/opencanary.log` | JSON-Alerts (src_host, logtype) |

## Hinweise

Ideal **intern** platziert (jeder Zugriff = Breach-Signal). An SIEM (Syslog/Webhook) koppeln. Kein echtes OS – geringes Risiko. Verwandt: Thinkst Canary (Appliance), Canarytokens.

## Verwendet in

honeypots 04 (Dienst-Honeypots), 06 (Canaries), 09, 10.
