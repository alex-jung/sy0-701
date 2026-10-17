# Lösung – Übung 07: Dashboards & Alerting

## 1. Dashboard bauen

Im Wazuh/OpenSearch Dashboard: **Visualize → Create** je Panel, dann in ein **Dashboard** zusammenfassen:
- **Line:** Count von `rule.id:5710` (SSH failed) über Zeit.
- **Data table / Pie:** Top `data.srcip` (Quell-IPs).
- **Bar:** Count nach `rule.level` (Severity) bzw. `rule.mitre.id`.
Speichern als „SOC Overview".

## 2. Alerting (Webhook/E-Mail)

`/var/ossec/etc/ossec.conf` (Integration, Beispiel Slack/Webhook):
```xml
<integration>
  <name>slack</name>
  <hook_url>https://hooks.slack.com/services/XXX</hook_url>
  <level>10</level>            <!-- erst ab Level 10 benachrichtigen -->
  <alert_format>json</alert_format>
</integration>
```
E-Mail alternativ via `<global><email_notification>yes</email_notification>...` + `<email_alerts>`. Manager neu starten.

## 3. Auslösen + verifizieren

```bash
hydra -l root -P pass.txt <host> ssh      # Brute-Force -> Level-12-Alert (Übung 06)
```
→ Dashboard-Panel „failed logins" schlägt aus, **und** die Benachrichtigung trifft am Webhook/Mail ein.

## 4. Schwellen

- **Sofort-Alert (Benachrichtigung):** Level ≥ 10 (Brute-Force, PrivEsc, Exploit, C2).
- **Nur Dashboard:** niedrige Level (Info/Policy), zur Lagebild-/Trendsicht.
So bleibt das Alerting **actionable**, Rauschen landet im Dashboard, nicht im Posteingang.

## 5. Eskalationspfad

```
L1 (Triage): sichtet Alerts, TP/FP, Standardfälle
   ↓ (bestätigter/unklarer Vorfall)
L2 (Analyst): Investigation/Korrelation (Übung 08)
   ↓ (bestätigter Incident)
Incident Response: Containment/Eradication (Thema incident-response)
```

## Härtung/Betrieb

Nur relevante Alerts benachrichtigen (Alert Fatigue), Dashboards rollenbezogen, Schwellen regelmäßig justieren, Alert-Kanal zuverlässig/überwacht.

## Häufige Fehler / Troubleshooting

- **Keine Benachrichtigung:** `level`-Schwelle zu hoch / Hook-URL falsch / Manager nicht neu gestartet / `integratord` läuft nicht.
- **Panel leer:** Zeitfenster/Index-Pattern/Feldname falsch (`data.srcip` vs `srcip`).
- **Alert-Flut:** Schwelle anheben, FP tunen.
- **Mail geht nicht:** SMTP-Relay/Firewall.
