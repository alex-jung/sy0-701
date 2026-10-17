# Übung 07 – Dashboards & Alerting

**Schwierigkeit: 7/10 · Dauer: ca. 60 Min.**

## Lernziele

- Dashboards/Visualisierungen für Security-Monitoring bauen
- Alerting-Kanäle einrichten (E-Mail/Webhook/Slack)
- Sinnvolle KPIs/Panels wählen (Signal statt Rauschen)
- Alert-Schwellen und Eskalation definieren

## Theorie

Rohdaten werden erst durch **Visualisierung** und **Alerting** operativ nutzbar:
- **Dashboards:** aggregierte Sicht (Top-Quellen, fehlgeschlagene Logins über Zeit, Alerts nach Severity/ATT&CK, geblockte Firewall-Flows). Für **Monitoring/Lagebild** und schnelle Triage.
- **Alerting:** aktive Benachrichtigung bei relevanten Events (hohe Severity, bestimmte Regeln) über E-Mail/Webhook/Chat. Ohne Alerting muss jemand ständig hinsehen.

Kunst dabei: **actionable** bleiben – nur bei echtem Handlungsbedarf alarmieren (sonst Alert Fatigue, Bezug `ids-ips` 07). Schwellen/Severity-Grenzen und ein **Eskalationspfad** (wer wird wann informiert) gehören definiert.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Wazuh Dashboard (OpenSearch Dashboards) | Visualisierungen/Dashboards |
| Wazuh Integrations / `integratord` | Alerting (Slack/Webhook/E-Mail) |

## Lab-Setup

- Wazuh mit Alerts aus den vorherigen Übungen. Ein Alert-Ziel (Test-Webhook/Mailpit/Slack-Webhook).

## Aufgabe (selbst lösen)

1. Baue ein **Dashboard** mit mindestens drei Panels: fehlgeschlagene Logins über Zeit, Top-Quell-IPs, Alerts nach Severity (und optional ATT&CK).
2. Richte **Alerting** ein: bei Alerts ab einem bestimmten **Level** (z. B. ≥ 10) geht eine Benachrichtigung an einen Test-Webhook/E-Mail.
3. Löse einen hochstufigen Alert aus (z. B. Brute-Force aus Übung 06) und verifiziere Dashboard-Update **und** Benachrichtigung.
4. Definiere sinnvolle **Schwellen**: was alarmiert sofort, was landet nur im Dashboard?
5. Skizziere einen **Eskalationspfad** (L1 Triage → L2 → IR).

**Ziel:** ein aussagekräftiges Security-Dashboard + funktionierendes Alerting ab definierter Severity, inkl. Eskalationslogik.

## SY0-701 Prüfungsbezug

- **Dashboards/Monitoring**, **Alerting**, KPIs, Severity-Schwellen.
- **Alert Fatigue** vermeiden; **Eskalation** (SOC-Tiers), Anbindung an IR.
- Begriffe: *dashboard/visualization*, *alerting*, *SIEM KPIs*, *escalation*, *alert fatigue*.
