# Übung 03 – Wazuh-Stack aufsetzen (SIEM/HIDS)

**Schwierigkeit: 3/10 · Dauer: ca. 75 Min. (inkl. Install)**

## Lernziele

- Die SIEM-Architektur verstehen (Collection → Indexing → Analysis → Visualization)
- Einen Wazuh-Stack (All-in-one) installieren
- Die Wazuh-Komponenten und das Dashboard kennen
- Den Unterschied Logserver vs. SIEM begreifen

## Theorie

Ein **SIEM** (Security Information and Event Management) sammelt Logs **zentral**, **normalisiert** sie, wendet **Detection-Regeln/Korrelation** an und bietet **Dashboards + Alerting**. Es ist mehr als ein Logserver (Übung 02): es *analysiert* und *alarmiert*.

**Wazuh** ist ein verbreitetes Open-Source-SIEM/XDR mit:
- **Wazuh Manager:** empfängt Events von Agents, wendet Decoder/Rules an, erzeugt Alerts.
- **Wazuh Indexer** (OpenSearch): speichert/indexiert.
- **Wazuh Dashboard:** Visualisierung/Suche.
- **Wazuh Agent:** auf den Endpunkten (Log-Collection, **FIM**, SCA, Rootcheck) = HIDS-Funktion.

Datenfluss: **Agent/Syslog → Manager (Decode+Rules) → Indexer → Dashboard**.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Wazuh All-in-one Installer | Manager+Indexer+Dashboard |
| Wazuh Dashboard | UI (`https://<wazuh>`) |

## Lab-Setup

- Eine VM ≥ 4 GB RAM (besser mehr) für Wazuh All-in-one. Internet für die Installation.

## Aufgabe (selbst lösen)

1. Installiere den **Wazuh All-in-one**-Stack und melde dich am Dashboard an.
2. Verifiziere, dass **Manager, Indexer, Dashboard** laufen (Status/Dienste).
3. Verschaffe dir einen Überblick: wo sieht man **Events, Alerts, Agents, Rules**?
4. Erkläre die vier SIEM-Phasen (Collection → Indexing → Analysis/Correlation → Visualization) anhand der Wazuh-Komponenten.
5. Grenze **zentralen Logserver (Übung 02) vs. SIEM** ab.

**Ziel:** ein laufender Wazuh-Stack mit erreichbarem Dashboard – die Analyse-Plattform für die folgenden Übungen.

## SY0-701 Prüfungsbezug

- **SIEM** (Definition/Zweck), SIEM-Architektur, **XDR/HIDS** (Wazuh-Agent).
- Abgrenzung Log-Aggregation vs. SIEM (Analyse/Korrelation/Alerting).
- Begriffe: *SIEM*, *log collection/indexing/correlation*, *XDR*, *HIDS*, *dashboard/alerting*.
