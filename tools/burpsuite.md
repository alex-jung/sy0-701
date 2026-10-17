# Burp Suite

**Kategorie:** Web-Pentest (Intercepting Proxy)

Die Standard-Plattform für Web-App-Tests. Sitzt als Proxy zwischen Browser und Server und erlaubt, Requests abzufangen, zu analysieren, zu verändern und zu wiederholen. Kali enthält die **Community Edition** (Repeater/Proxy; Intruder gedrosselt, kein aktiver Scanner).

```bash
burpsuite        # GUI starten
```

## Wichtigste Module

| Modul | Zweck |
|-------|-------|
| **Proxy** | Requests abfangen (Intercept) / mitschneiden (HTTP history) |
| **Repeater** | einzelnen Request manuell ändern + wiederholt senden |
| **Intruder** | Payloads automatisiert einsetzen (Fuzzing/Brute; Community gedrosselt) |
| **Decoder / Comparer** | En-/Decoding, Responses vergleichen |
| **Target / Site map** | App-Struktur, Scope |

## Setup

- Browser-Proxy auf `127.0.0.1:8080` (z. B. FoxyProxy).
- Burp-CA-Zertifikat im Browser importieren (für HTTPS) – `http://burp` → CA Certificate.

## Typischer Ablauf

1. *Proxy → Intercept on*, Request im Browser auslösen.
2. Request lesen (Methode, Parameter, Cookies).
3. *Send to Repeater* → Parameter ändern, Response prüfen (Injection/IDOR/…).

## Hinweis

Alternative: **OWASP ZAP** (`zaproxy`, voll Open Source, inkl. aktivem Scanner). Nur eigene/freigegebene Web-Ziele.

## Verwendet in

web-exploitation 01–10 (durchgehend).
