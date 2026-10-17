# Lösung – Übung 09: ELK/OpenSearch

## 1. Stack aufsetzen (Docker-Compose)

Ein Compose mit Elasticsearch/OpenSearch + Kibana/Dashboards + (optional) Logstash starten; Kibana unter `http://<host>:5601`. (Im Lab reicht ein Single-Node; `vm.max_map_count=262144` setzen.)

## 2. Filebeat

Auf dem Quell-Host `filebeat.yml`:
```yaml
filebeat.inputs:
  - type: filestream
    paths: [ /var/log/auth.log ]
output.logstash:          # oder direkt output.elasticsearch
  hosts: ["<elk>:5044"]
```
```bash
sudo filebeat -e        # bzw. als Dienst; Modul "system" aktivieren: filebeat modules enable system
```

## 3. Logstash-Grok

`pipeline.conf`:
```
input { beats { port => 5044 } }
filter {
  grok { match => { "message" => "%{SYSLOGTIMESTAMP:ts} %{HOSTNAME:host} sshd\[%{NUMBER:pid}\]: Failed password for %{USERNAME:user} from %{IP:srcip}" } }
}
output { elasticsearch { hosts => ["<elk>:9200"] index => "lab-%{+YYYY.MM.dd}" } }
```
Grok extrahiert `user`/`srcip` (analog Wazuh-Decoder, Übung 05).

## 4. Index-Pattern + Discover

In Kibana **Stack Management → Index Patterns** `lab-*` anlegen → **Discover**: nach `srcip:"1.2.3.4"`/`user:"root"` filtern. **Visualize**: z. B. „Failed logins over time", „Top srcip".

## 5. ELK vs. Wazuh

| | ELK/OpenSearch | Wazuh |
|---|----------------|-------|
| Parsing/Detection | selbst bauen (Grok, ElastAlert) | fertige Decoder/Rules |
| HIDS/FIM/SCA | nein (nur mit Beats/Zusatz) | integriert (Agent) |
| Flexibilität | sehr hoch | hoch, aber vorgegeben |
| Aufwand | höher | geringer (batteries included) |

→ **Wazuh** für schnellen SIEM/HIDS-Einstieg; **ELK** für maximale Flexibilität/eigene Pipelines. Beide nutzen OpenSearch/Elasticsearch als Basis.

## Häufige Fehler / Troubleshooting

- **ES startet nicht:** `vm.max_map_count`, RAM/Heap zu klein.
- **Keine Daten:** Filebeat-Output-Ziel/Port (5044 Logstash vs 9200 ES), Index-Pattern falsch.
- **Grok matcht nicht:** mit Grok-Debugger testen; Pattern an echte Zeile anpassen.
- **Kein Detection-Alerting out-of-the-box:** ElastAlert/Detection-Rules nötig (anders als Wazuh).
