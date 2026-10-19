# Übung 10 – Capstone: Deception-Konzept + Report + SIEM-Anbindung

**Schwierigkeit: 10/10 · Dauer: ca. 3–4 Std.**

## Lernziele

- Alles kombinieren: Honeypots + Honeytokens + Visualisierung + IOCs + SIEM/IR
- Ein durchgängiges, betreibbares Deception-Setup bauen und betreiben
- Einen professionellen Deception-/Threat-Report schreiben

## Theorie

Deception entfaltet Wert erst als **Gesamtsystem**: Köder an den richtigen Stellen → zentrales Alerting → Anreicherung zu Threat Intel → Einspeisung in Abwehr (Firewall/IDS) und **Reaktion** (IR). Dieses Capstone verlangt, die Kette End-to-End aufzubauen und zu beweisen, dass ein Angriff **erkannt, ausgewertet und operationalisiert** wird. Nutze die Vorlage `deception-report-template.md`.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Cowrie / Dionaea / OpenCanary / (T-Pot) | Honeypots |
| Canarytokens / Honeyfiles | interne Deception |
| Wazuh/ELK | Zentralisierung, Dashboards, Alerts |
| Suricata / OPNsense | IOC-Verwertung, Einhegung |
| `jq` | IOC-Extraktion |

## Lab-Setup

- Isoliertes Honeypot-VLAN + ein interner „Produktiv"-Host mit Honeytokens; SIEM, IDS, OPNsense wie in den Blue-Team-Themen.

## Aufgabe (selbst lösen)

1. **Deploye** mindestens: einen interaktiven Honeypot (Cowrie) **und** drei Honeytokens (Datei/Account/Token) an begründeten Stellen; hege den Honeypot per OPNsense ein (Egress-Deny).
2. **Binde** alle Quellen an dein SIEM an; baue ein Dashboard und **mind. zwei** Detection-/Alert-Regeln (eine davon TTP-basiert).
3. **Simuliere** von Kali einen realistischen Angriff (Brute-Force → Login → Befehle → „Download"; zusätzlich Zugriff auf eine Honeyfile) und weise nach, dass SIEM-Alarme auslösen.
4. **Extrahiere IOCs**, verwerte sie (Blocklist/IDS/YARA) und **mappe** die beobachtete Kette auf MITRE ATT&CK.
5. **Schreibe** einen Deception-Report (Vorlage): Setup, Timeline des Angriffs, IOCs, ATT&CK-Mapping, Alerts/Detections, Risiken/Einhegung, Empfehlungen.

**Ziel:** ein funktionierendes End-to-End-Deception-System (Erkennung nachgewiesen) + ein vollständiger, teilbarer Report.

## SY0-701 Prüfungsbezug

- **Domänen 1.0/2.0/3.0/4.0/5.0** kombiniert: Deception-Technologie, IOCs/TTPs, Segmentierung, Detection/Monitoring/Threat Intel, Reporting/Governance.
- Prüfungsnah: Technologie-Auswahl begründen, Alarme interpretieren, Reaktion/Report ableiten.
- Begriffe: *honeypot/honeynet/honeytoken*, *IOC/TTP*, *SIEM/correlation*, *egress filtering*, *MITRE ATT&CK*, *incident response*.
