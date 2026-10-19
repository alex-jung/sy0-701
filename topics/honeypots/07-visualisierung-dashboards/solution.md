# Lösung – Übung 07: Visualisierung

## 1./2. Pipeline (Filebeat → Logstash → ES)

Filebeat auf dem Honeypot:
```yaml
# /etc/filebeat/filebeat.yml
filebeat.inputs:
  - type: filestream
    paths: ["/home/cowrie/cowrie/var/log/cowrie/cowrie.json"]
    parsers: [{ ndjson: { target: "" } }]
output.logstash: { hosts: ["<logstash-ip>:5044"] }
```
Logstash-Filter mit GeoIP:
```ruby
filter {
  date { match => ["timestamp","ISO8601"] }
  geoip { source => "src_ip" }
}
output { elasticsearch { hosts => ["http://<es>:9200"] index => "cowrie-%{+YYYY.MM.dd}" } }
```
Index-Pattern `cowrie-*` in Kibana anlegen; Felder `src_ip`, `username`, `password`, `input`, `eventid`, `geoip.*`.

*(Wazuh-Variante: eigener Decoder für `cowrie.json` + Rules, Daten landen im Wazuh-Index, Dashboard analog.)*

## 3. Visualisierungen (Kibana)

- **Angriffe/Zeit:** Date Histogram auf `@timestamp`.
- **Top-IPs:** Data Table / Bar auf `src_ip` (Terms, size 10).
- **Top-Credentials:** Terms auf `username` + `password`.
- **Geo-Map:** Maps/Coordinate Map auf `geoip.location`.
Alle in ein **Dashboard** „Cowrie Honeypot".

## 4. Beispiel-Schlüsse

- Scharfe Spitzen zu bestimmten Zeiten → koordinierte Brute-Force-Wellen (Botnet).
- `username`/`password`-Verteilung deckt sich mit Default-/rockyou-Listen → automatisierte Standard-Angriffe, kein gezielter Akteur.

## Härtung/Betrieb

- Nur ein Weg nach „innen": Honeypot sendet Logs zum SIEM, nicht umgekehrt.
- ILM/Retention setzen (Index wächst); Zeitzonen (Cowrie=UTC) konsistent halten.

## Häufige Fehler / Troubleshooting

- Felder „not indexed" → Index-Pattern refreshen; ndjson-Parser aktiv?
- GeoIP leer → private IPs (Lab) haben keine Geo; mit echten/Test-IPs prüfen oder GeoLite-DB einbinden.
- Doppelte Events → Filebeat-Registry/Offset prüfen.
