# Thema: IDS / IPS

Praxis-Übungen zu **Intrusion Detection & Prevention** – mit **Suricata auf OPNsense** und **Zeek** als Network Security Monitor. Von den Grundlagen über Alert-Analyse, eigene Regeln, IPS-Blocking und Tuning bis zur Erkennung konkreter Angriffe aus den offensiven Themen und einem Detection-Engineering-Workflow. Ein **Blue-Team-/Defensive-Thema**.

> ⚠️ **Eigenes Lab.** Angriffe zum Testen der Erkennung nur gegen eigene Lab-Ziele (vgl. die offensiven Themen). IPS-Blocking kann legitimen Traffic stören → im Lab testen, Tuning beachten.

## Lernziele

- IDS vs. IPS, NIDS vs. HIDS, signature- vs. anomaly-based verstehen
- Suricata auf OPNsense aufsetzen (IDS- und IPS-Modus)
- Alerts auswerten, Regelsätze verwalten und eigene Regeln schreiben
- False Positives tunen; konkrete Angriffe erkennen (Scans, Exploits, C2)
- Zeek für Network Security Monitoring nutzen; Detection-Engineering + SOC-Workflow

## Abgedeckte SY0-701-Domänen

- **4.0 Security Operations** – IDS/IPS, Monitoring, Alerting, SIEM-Anbindung, Detection
- **3.0 Security Architecture** – Platzierung (inline/tap), NIDS/HIDS, Sensoren
- **2.0 Threats, Vulnerabilities & Mitigations** – Angriffserkennung, IoCs

## Übungen (Schwierigkeit 1 → 10)

| #  | Übung | Schwierigkeit |
|----|-------|---------------|
| 01 | IDS/IPS-Grundlagen (IDS vs. IPS, NIDS/HIDS, Platzierung) | 1/10 |
| 02 | Suricata auf OPNsense aufsetzen (IDS-Modus) | 2/10 |
| 03 | Alerts erzeugen & auswerten | 3/10 |
| 04 | Regelsätze verwalten (ET Open, SID, Kategorien) | 4/10 |
| 05 | Eigene Suricata-Regeln schreiben | 5/10 |
| 06 | IPS-Modus: inline Blocking/Drop | 6/10 |
| 07 | Tuning: False Positives, Thresholds, Suppress | 7/10 |
| 08 | Angriffserkennung in der Praxis (Scans/Exploits/C2) | 8/10 |
| 09 | Network Security Monitoring mit Zeek | 9/10 |
| 10 | Detection-Engineering & SOC-Workflow + Report | 10/10 |

## Lab-Voraussetzungen

- **OPNsense-VM** mit **Suricata**-Plugin (IDSage/IPS), auf dem richtigen Interface (meist WAN oder das zu überwachende Segment)
- **Kali** als Angreifer (erzeugt Scans/Exploits/C2 aus den offensiven Themen) + interne Ziele (Metasploitable/DVWA)
- Für Zeek (Übung 09): ein Linux-Host/VM mit **Zeek**, der den Traffic sieht (Mirror/Span oder Inline)
- Optional: SIEM/Syslog-Empfänger (Bezug zu `logging-siem`)
- Bezug: alle offensiven Themen (als „Angriffsquelle" zum Erkennen)

Reihenfolge: starte bei `01-ids-ips-basics/`. Pro Übung erst die `.md` lösen, dann `solution.md`.
