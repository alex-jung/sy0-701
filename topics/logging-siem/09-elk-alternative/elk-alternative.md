# Übung 09 – ELK/OpenSearch als Alternative

**Schwierigkeit: 9/10 · Dauer: ca. 80 Min.**

## Lernziele

- Den ELK/OpenSearch-Stack und seine Komponenten verstehen
- Logs via Beats/Logstash ingestieren und parsen (Grok)
- Index-Patterns/Mappings und Discover/Visualize nutzen
- ELK vs. Wazuh einordnen (wann was)

## Theorie

Neben Wazuh ist der **ELK-Stack** (Elasticsearch, Logstash, Kibana) bzw. **OpenSearch** (offener Fork) der verbreitetste Logging-/SIEM-Unterbau:

- **Beats** (Filebeat/Winlogbeat/Packetbeat): leichtgewichtige Collectoren auf den Hosts.
- **Logstash:** Ingest-Pipeline (Input → **Filter/Grok-Parsing** → Output).
- **Elasticsearch/OpenSearch:** Index/Suche.
- **Kibana/OpenSearch Dashboards:** Visualisierung/Discover.

ELK ist **flexibler/baukastenartiger** (du baust Parsing/Detection selbst, z. B. mit **ElastAlert**/Detection Rules), Wazuh ist **batterien-inklusive** (Decoder/Rules/HIDS fertig). In der Praxis läuft Wazuh **auf** OpenSearch – die Konzepte (Index, Mapping, Query) sind dieselben.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Filebeat | Logs an ELK senden |
| Logstash (Grok) | Parsing-Pipeline |
| Elasticsearch/OpenSearch | Index/Suche |
| Kibana/Dashboards | Discover/Visualize |

## Lab-Setup

- Ein ELK-/OpenSearch-Stack (Docker-Compose eignet sich gut) + ein Host mit Filebeat. Alternativ konzeptionell + die OpenSearch-Basis aus Wazuh nutzen.

## Aufgabe (selbst lösen)

1. Setze einen **ELK/OpenSearch**-Stack auf (z. B. via Docker-Compose) und öffne Kibana/Dashboards.
2. Sende mit **Filebeat** Logs eines Hosts (z. B. auth.log) an den Stack.
3. Baue eine **Logstash-Grok**-Pipeline, die eine Logzeile in Felder parst (analog zum Wazuh-Decoder, Übung 05).
4. Lege ein **Index-Pattern** an und durchsuche die Felder in **Discover**; baue eine Visualisierung.
5. Vergleiche **ELK vs. Wazuh**: Stärken/Schwächen, wann du was wählst.

**Ziel:** Logs über einen ELK/OpenSearch-Stack ingestiert, mit Grok geparst und durchsuchbar gemacht – plus eine fundierte Einordnung gegenüber Wazuh.

## SY0-701 Prüfungsbezug

- **SIEM-Stacks** (ELK/OpenSearch) und Ingest-Pipelines; **Beats/Logstash/Grok**.
- Flexibilität vs. „batteries included"; dieselben Grundkonzepte (Index/Query/Dashboard).
- Begriffe: *ELK/OpenSearch*, *log shipper (Beats)*, *ingest pipeline/Grok*, *index pattern*, *SIEM*.
