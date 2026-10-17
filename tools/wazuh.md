# Wazuh

**Kategorie:** SIEM / HIDS / XDR (Blue Team)

Open-Source-SIEM/XDR: sammelt Logs zentral, normalisiert (Decoder) + bewertet (Rules), erzeugt Alerts und bietet Dashboards – plus HIDS-Funktionen über Agents (FIM, SCA, Rootcheck). Läuft auf OpenSearch.

## Komponenten

| Komponente | Zweck |
|------------|-------|
| **Manager** | empfängt Events, Decoder+Rules, Alerts |
| **Indexer** (OpenSearch) | Speicherung/Index |
| **Dashboard** | UI/Suche/Visualisierung |
| **Agent** | Endpoint: Log-Collection, FIM, SCA |

## Setup (All-in-one)

```bash
curl -sO https://packages.wazuh.com/4.x/wazuh-install.sh
sudo bash ./wazuh-install.sh -a          # Dashboard: https://<host>
```

## Wichtige Pfade/Dateien

| Pfad | Zweck |
|------|-------|
| `/var/ossec/etc/ossec.conf` | Manager-/Agent-Konfiguration, Syslog-Input, Integrationen |
| `/var/ossec/etc/rules/local_rules.xml` | eigene Rules (ID ≥ 100000) |
| `/var/ossec/etc/decoders/local_decoder.xml` | eigene Decoder |
| `/var/ossec/bin/wazuh-logtest` | Decoder/Rule gegen Logzeile testen |

## Konzepte

- **Decoder** parsen Rohlogs → Felder; **Rules** bewerten (Level) + korrelieren (`frequency`/`timeframe`).
- **MITRE-ATT&CK**-Mapping, FIM, Vulnerability Detection, Alerting-Integrationen (Slack/Webhook/Mail).

## Hinweis

RAM-/Disk-hungrig; Retention/Backups planen; Dashboard-Zugang härten. Nur eigenes Lab.

## Verwendet in

logging-siem 03–08, 10.
