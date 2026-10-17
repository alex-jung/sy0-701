# Zeek

**Kategorie:** Network Security Monitoring (NSM) · früher „Bro"

Kein klassisches Signatur-IDS, sondern ein **Network Security Monitor**: protokolliert strukturierte **Metadaten** zu allen Verbindungen – unabhängig von Signaturen. Stark für Anomalie-/Beaconing-Analyse und Threat Hunting, auch bei TLS (Metadaten bleiben sichtbar).

```bash
sudo zeek -i eth0          # live auf Interface
zeek -r capture.pcap       # aus einer pcap
```

## Wichtige Logs

| Log | Inhalt |
|-----|--------|
| `conn.log` | jede Verbindung (Dauer, Bytes, Zustand) |
| `dns.log` | DNS-Anfragen/-Antworten |
| `http.log` | HTTP (Host, URI, User-Agent) |
| `ssl.log` | TLS inkl. **JA3**/SNI/Zertifikat |
| `files.log` / `x509.log` | übertragene Dateien / Zertifikate |
| `notice.log` / `weird.log` | Zeeks Auffälligkeiten |

## Auswertung

```bash
zeek-cut id.orig_h id.resp_h id.resp_p duration < conn.log
zeek-cut query < dns.log | sort | uniq -c | sort -rn
zeek-cut id.resp_h server_name ja3 < ssl.log
```

## Hinweis

Ergänzt Suricata (Signaturen) um **Verhalten/Metadaten** → findet Beaconing/Anomalien, die signaturbasiert unsichtbar sind. Logs ins SIEM (Bezug `logging-siem`). Braucht Sicht auf den Traffic (Mirror/Span/inline). Nur eigenes Lab.

## Verwendet in

ids-ips 09 (NSM), 10 (Detection-Engineering); Bezug post-exploitation-pivoting (C2/Beaconing).
