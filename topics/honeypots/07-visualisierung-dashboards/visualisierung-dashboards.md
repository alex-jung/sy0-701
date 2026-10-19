# Übung 07 – Honeypot-Daten visualisieren (Dashboards)

**Schwierigkeit: 7/10 · Dauer: ca. 90 Min.**

## Lernziele

- Cowrie/Dionaea-Logs an einen ELK/Wazuh-Stack anbinden
- Felder parsen und sinnvolle Visualisierungen bauen
- Kennzahlen/Trends ableiten (Top-Angreifer, Zeitverlauf, Geo)

## Theorie

Rohlogs sind schwer zu überblicken. Mit **ELK (Elasticsearch/Logstash/Kibana)** oder **Wazuh** aus `logging-siem` lassen sich Honeypot-Events **zentralisieren**, **parsen** und **visualisieren**: Filebeat/Logstash liest `cowrie.json`, ein GeoIP-Filter ergänzt Länderdaten, Kibana zeigt Zeitreihen, Top-N-Tabellen und Karten. T-Pot (Übung 05) bringt das fertig mit; hier baust du es für einen einzelnen Honeypot selbst – das zeigt, *wie* die Pipeline funktioniert.

Nützliche Visualisierungen: Angriffe über Zeit (erkennt Kampagnen/Wellen), Top-Quell-IPs/-ASNs, Top-Credentials (zeigt genutzte Wortlisten), Top-Befehle/Download-URLs, Geo-Map.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Filebeat/Logstash | Cowrie-JSON einlesen/parsen (GeoIP) |
| Elasticsearch/Kibana | Speichern & Visualisieren |
| Wazuh (Alternative) | Decoder/Rules + Dashboards |

## Lab-Setup

- ELK- oder Wazuh-Stack aus `logging-siem`. Cowrie-Honeypot aus Übung 02/03 liefert `cowrie.json`. GeoIP-DB (MaxMind/GeoLite) für Länderdaten.

## Aufgabe (selbst lösen)

1. Richte eine Pipeline ein, die `cowrie.json` nach Elasticsearch bringt (Filebeat→Logstash oder Wazuh-Decoder).
2. Stelle sicher, dass `src_ip`, `username`, `password`, `input`, `eventid` als Felder indexiert sind; ergänze **GeoIP**.
3. Baue in Kibana mindestens **vier** Visualisierungen: Angriffe/Zeit, Top-IPs, Top-Credentials, Geo-Map; fasse sie in einem Dashboard zusammen.
4. Ziehe **zwei** Schlussfolgerungen aus den Daten (z. B. „Brute-Force-Welle aus Land X", „genutzte Wortliste ähnelt rockyou").

**Ziel:** ein funktionierendes Honeypot-Dashboard mit ≥4 Panels + zwei datenbasierten Aussagen.

## SY0-701 Prüfungsbezug

- **4.0** Zentrales Logging/SIEM, Dashboards, Korrelation, Threat Hunting.
- **2.0** Angriffstrends/TTPs sichtbar machen.
- Begriffe: *log aggregation*, *parsing/normalization*, *GeoIP enrichment*, *dashboard*, *data correlation*.
