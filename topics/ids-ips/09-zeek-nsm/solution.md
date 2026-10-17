# Lösung – Übung 09: Zeek NSM

## 1. Zeek laufen lassen

```bash
# live:
sudo zeek -i eth0
# oder auf einem Capture (z.B. aus tcpdump/Übung 08):
zeek -r capture.pcap
ls   # conn.log dns.log http.log ssl.log files.log notice.log weird.log ...
```

## 2. conn.log analysieren

```bash
zeek-cut id.orig_h id.resp_h id.resp_p proto duration orig_bytes resp_bytes < conn.log | head
# Top-Ziele:
zeek-cut id.resp_h < conn.log | sort | uniq -c | sort -rn | head
```
Auffällig: ein interner Host, der **immer wieder** dasselbe externe Ziel kontaktiert (viele kurze Verbindungen) → Beaconing-Verdacht.

## 3. dns/http/ssl

```bash
zeek-cut query < dns.log | sort | uniq -c | sort -rn | head      # verdächtige Domains
zeek-cut user_agent < http.log | sort | uniq -c | sort -rn       # Scanner-UAs
zeek-cut id.resp_h server_name ja3 < ssl.log | head              # JA3/SNI
```
Ungewöhnliche Domains (DGA-artig), Scanner-User-Agents, auffällige JA3-Fingerprints (z. B. von C2-Tools) fallen auf.

## 4. C2-Beaconing (auch TLS)

```bash
# Intervalle zwischen Verbindungen zu einem Ziel betrachten:
zeek-cut ts id.resp_h < conn.log | grep <C2-IP> | awk '{print $1}' | \
  awk 'NR>1{print $1-prev} {prev=$1}'
```
Nahezu **konstante Abstände** (± Jitter) zu einem Ziel = Beaconing – sichtbar **über Metadaten**, obwohl der Inhalt TLS-verschlüsselt ist (Suricata sieht hier nur „TLS").

## 5. Zeek vs. Suricata

- **Suricata:** signaturbasiert – präzise bei bekanntem, **blind bei TLS/0-Day**.
- **Zeek:** protokolliert **Metadaten/Verhalten** aller Verbindungen → findet Beaconing/Anomalien/JA3 auch ohne Signatur, ideal fürs **Threat Hunting**.
→ Zusammen: Signaturen (Suricata) + Verhaltens-/Metadaten-Analyse (Zeek) + HIDS/EDR = Defense in Depth.

## Härtung/Detection-Ausbau

Zeek-Logs ins SIEM (Bezug `logging-siem`), Baselines/Beaconing-Analytics, JA3-Blocklisten, regelmäßiges Threat Hunting.

## Häufige Fehler / Troubleshooting

- **Keine Logs:** Zeek sieht den Traffic nicht (Interface/Mirror) oder im aktuellen Verzeichnis keine Schreibrechte.
- **`zeek-cut` fehlt:** Teil von Zeek; Pfad/`$PATH` prüfen.
- **Zu viele Daten:** gezielt filtern (`grep`/`zeek-cut`/`jq` auf JSON-Logs), Zeitfenster eingrenzen.
- **Beaconing unklar:** Jitter berücksichtigen; über längeren Zeitraum betrachten.
