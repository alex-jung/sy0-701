# Lösung – Übung 05: Eigene Suricata-Regeln

Eigene Regeln in **IDS → Administration → User-defined rules** (bzw. Custom-Rules), dann Regeln neu laden. Eigene SIDs ≥ **1000000**.

## 1. ICMP-Ping-Alert

```
alert icmp $EXTERNAL_NET any -> $HOME_NET any (msg:"LOCAL ICMP Ping ins HOME_NET"; itype:8; sid:1000001; rev:1; classtype:misc-activity;)
```
Test: `ping <HOME-Host>` von Kali → Alert.

## 2. HTTP: URL / User-Agent

```
# Zugriff auf /admin:
alert http $EXTERNAL_NET any -> $HOME_NET any (msg:"LOCAL Zugriff auf /admin"; flow:to_server,established; http.uri; content:"/admin"; nocase; sid:1000002; rev:1; classtype:web-application-activity;)
# verdächtiger User-Agent:
alert http any any -> $HOME_NET any (msg:"LOCAL Scanner User-Agent (sqlmap/nikto)"; http.user_agent; pcre:"/(sqlmap|nikto|nmap)/i"; sid:1000003; rev:1; classtype:attempted-recon;)
```
Test: `curl http://<ZIEL>/admin`, `nikto -h http://<ZIEL>`.

## 3. Threshold (Scan/Brute-Force)

```
alert tcp $EXTERNAL_NET any -> $HOME_NET 22 (msg:"LOCAL moegliches SSH-Brute-Force"; flow:to_server; flags:S; threshold:type threshold, track by_src, count 20, seconds 60; sid:1000004; rev:1; classtype:attempted-dos;)
```
Alarmiert erst ab 20 SYN/60 s pro Quelle. Test: `hydra`/`nmap` gegen 22.

## 4. Honeytoken

```
alert http $HOME_NET any -> $HOME_NET any (msg:"LOCAL Honeytoken-Zugriff /secret-backup.zip"; flow:to_server,established; http.uri; content:"/secret-backup.zip"; nocase; sid:1000005; rev:1; classtype:policy-violation;)
```
Eine Datei/URL, die **niemand legitim** aufruft → jeder Zugriff = starkes Angriffssignal.

## 5. Verifikation

Nach jeder Regel: Regeln neu laden → Traffic auslösen → **Alerts-Tab/eve.json** prüfen (`jq 'select(.alert.signature_id>=1000000)'`). Saubere `msg`/`sid` erleichtern späteres Tuning/SIEM.

## Häufige Fehler / Troubleshooting

- **Regel feuert nicht:** HOME_NET/Interface; `flow`/`http.*` nur bei erkanntem Protokoll; Regeln neu geladen?
- **SID-Kollision:** eigene SIDs ≥ 1000000, eindeutig.
- **`http.uri` ohne Treffer:** Suricata muss HTTP parsen (Port/app-layer); bei HTTPS unsichtbar (TLS).
- **Threshold falsch:** `count/seconds/track` prüfen; zu niedrig = FP, zu hoch = verpasst.
