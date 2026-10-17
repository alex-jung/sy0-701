# Lösung – Übung 03: Wazuh-Stack

## 1. Installation (All-in-one)

```bash
curl -sO https://packages.wazuh.com/4.x/wazuh-install.sh
sudo bash ./wazuh-install.sh -a
# am Ende: Admin-Passwort fürs Dashboard wird ausgegeben (notieren!)
```
Dashboard: `https://<wazuh-IP>` → Login `admin` + ausgegebenes Passwort (Zertifikatswarnung akzeptieren).

## 2. Dienste prüfen

```bash
sudo systemctl status wazuh-manager wazuh-indexer wazuh-dashboard
```
Alle „active (running)". Das Dashboard lädt die Overview-Seite.

## 3. Überblick (Dashboard)

- **Agents:** verbundene Endpunkte (noch keine → Übung 04).
- **Security events / Threat Hunting:** eingehende Events/Alerts.
- **Management → Rules / Decoders:** mitgelieferte Regelsätze.
- **Modules:** FIM, SCA, Vulnerability Detection, MITRE ATT&CK.

## 4. SIEM-Phasen ↔ Wazuh

1. **Collection:** Agent/Syslog → Manager.
2. **Indexing:** Manager schreibt Alerts in den **Indexer** (OpenSearch).
3. **Analysis/Correlation:** Manager **Decoder** (parsen) + **Rules** (bewerten/korrelieren) → Alerts.
4. **Visualization/Alerting:** **Dashboard** zeigt/durchsucht, Alerting per Integration.

## 5. Logserver vs. SIEM

- **Logserver (rsyslog, Übung 02):** sammelt/speichert Logs, sortiert – aber **analysiert/alarmiert nicht**.
- **SIEM (Wazuh):** normalisiert, wendet **Detection-Regeln + Korrelation** an, erzeugt **Alerts**, bietet **Dashboards/Hunting**. Der Logserver kann als **Input** dienen (Syslog → Wazuh).

## Härtung/Betrieb

Dashboard-Zugang härten (starke Passwörter, nur Management-Netz), Indexer-Speicher/Retention planen, Backups, ausreichend RAM/Disk.

## Häufige Fehler / Troubleshooting

- **Install bricht ab / OOM:** zu wenig RAM/Disk → VM aufstocken.
- **Dashboard nicht erreichbar:** Dienste-Status, Port 443, Firewall; Indexer gestartet?
- **Zertifikatswarnung:** self-signed (normal im Lab).
- **Passwort vergessen:** `wazuh-passwords-tool` zum Zurücksetzen.
