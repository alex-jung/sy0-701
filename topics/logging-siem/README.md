# Thema: Logging & SIEM

Praxis-Übungen zu **zentralem Logging, SIEM und Detection** – die analytische Schaltzentrale des Blue Teams. Von Log-Grundlagen über zentrales Syslog, einen **Wazuh**-Stack (SIEM/HIDS/XDR), Log-Onboarding, Parsing/Normalisierung, Detection-Regeln, Dashboards/Alerting bis zu Korrelation, Threat Hunting und SIEM-Use-Cases. Ein **Blue-Team-/SecOps-Thema**.

> ⚠️ **Eigenes Lab.** Angriffe zum Erzeugen von Log-/Alert-Daten nur gegen eigene Lab-Ziele (aus den offensiven Themen). Logs können sensible Daten enthalten → im Lab unkritisch, aber das Prinzip (Zugriffsschutz/Aufbewahrung) mitdenken.

## Lernziele

- Log-Quellen, -Formate und die Rolle zentralen Loggings verstehen
- Syslog zentralisieren und einen SIEM-Stack (Wazuh) aufsetzen
- Log-Quellen onboarden, parsen/normalisieren (Common Schema)
- Detection-Regeln, Dashboards und Alerting bauen
- Ereignisse korrelieren, Threat Hunting betreiben, Use-Cases dokumentieren

## Abgedeckte SY0-701-Domänen

- **4.0 Security Operations** – Logging, SIEM, Monitoring, Alerting, Correlation, Threat Hunting, Retention
- **2.0 Threats, Vulnerabilities & Mitigations** – Erkennung von Angriffen/IoCs
- **5.0 Program Management** – Log-Policy, Aufbewahrung, Reporting

## Übungen (Schwierigkeit 1 → 10)

| #  | Übung | Schwierigkeit |
|----|-------|---------------|
| 01 | Logging-Grundlagen (Quellen, Formate, Uhrzeit) | 1/10 |
| 02 | Zentrales Syslog einrichten | 2/10 |
| 03 | Wazuh-Stack aufsetzen (SIEM/HIDS) | 3/10 |
| 04 | Log-Quellen onboarden (Agents, Firewall, Windows) | 4/10 |
| 05 | Parsing & Normalisierung | 5/10 |
| 06 | Detection-Regeln schreiben | 6/10 |
| 07 | Dashboards & Alerting | 7/10 |
| 08 | Korrelation & Threat Hunting | 8/10 |
| 09 | ELK/OpenSearch als Alternative | 9/10 |
| 10 | SIEM-Use-Cases & Report | 10/10 |

## Lab-Voraussetzungen

- **Log-Collector/SIEM-VM** (≥ 4 GB RAM): **Wazuh** (All-in-one: Manager + Indexer + Dashboard) empfohlen; alternativ ELK/OpenSearch (Übung 09)
- **Log-Quellen:** OPNsense (Syslog, Bezug `firewall-opnsense`/`ids-ips`), Linux-Hosts (rsyslog/Wazuh-Agent), optional Windows (Sysmon/Agent)
- **Kali** als Angreifer, um Log-/Alert-Daten zu erzeugen (aus den offensiven Themen)
- Korrekte **Zeitsynchronisation (NTP)** auf allen Quellen – Grundvoraussetzung für Korrelation

Reihenfolge: starte bei `01-logging-basics/`. Pro Übung erst die `.md` lösen, dann `solution.md`.
