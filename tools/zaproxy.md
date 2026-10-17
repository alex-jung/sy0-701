# OWASP ZAP (zaproxy)

**Kategorie:** Web-Pentest (Intercepting Proxy / Scanner)

Voll quelloffene Alternative zu Burp Suite. Intercepting Proxy **plus** aktiver/passiver Schwachstellenscanner und Spider – ohne Feature-Drosselung. Gut für automatisierte Baseline-Scans und manuelles Testen.

```bash
zaproxy          # GUI starten
# headless/CLI-Baseline-Scan:
zap-baseline.py -t http://<ziel>/
```

## Wichtigste Funktionen

| Funktion | Zweck |
|----------|-------|
| Proxy / Break | Requests abfangen/ändern |
| Spider / AJAX Spider | App-Struktur automatisch crawlen |
| Active Scan | aktiv auf Schwachstellen testen (laut!) |
| Passive Scan | mitlaufende Analyse ohne eigene Angriffe |
| Requester / Fuzzer | Requests wiederholen / fuzzen |

## Setup

- Browser-Proxy auf `127.0.0.1:8080` (ZAP-Default), ZAP-CA importieren (HTTPS).

## Beispiele

```bash
zaproxy
zap-baseline.py -t http://<ZIEL>/dvwa/ -r report.html
```

## Hinweis

Active Scan ist intrusiv/laut → nur eigene Ziele. Funktional vergleichbar mit Burp; Wahl nach Vorliebe.

## Verwendet in

web-exploitation 01, 10 (als Burp-Alternative).
