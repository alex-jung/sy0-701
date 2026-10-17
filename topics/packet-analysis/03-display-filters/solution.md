# Lösung – Übung 03: Display-Filter

## 1. Host + HTTP-POST

```
ip.addr == 192.168.56.100
ip.addr == 192.168.56.100 && http.request.method == "POST"
```

## 2. DNS + Domain

```
dns
dns.qry.name contains "example"
dns.qry.name matches "(?i)(evil|malware|c2)"
```

## 3. SYN-only + RST

```
tcp.flags.syn == 1 && tcp.flags.ack == 0      # SYN -> Scan-Indikator
tcp.flags.reset == 1                           # RST -> geschlossen/Fehler
```
Viele SYN von einer Quelle an viele Ports = Portscan.

## 4. Klartext-Suche

```
frame contains "password"
http contains "login"
# gezielter auf Felder:
http.authorization || ftp.request.command == "PASS"
```

## 5. Verkettung + Capture vs. Display

```
ip.src == 192.168.56.50 && (http || dns) && !icmp
```
- **Capture-Filter (BPF, Übung 01):** vor dem Mitschnitt, andere Syntax (`host`, `port`), Verworfenes ist weg.
- **Display-Filter (hier):** nachträglich, feldbasiert (`ip.src`, `http.request.method`), ändert nur die Anzeige. **Rechtsklick auf ein Feld → Apply as Filter** baut Filter automatisch.

## Häufige Fehler / Troubleshooting

- **BPF-Syntax in Display-Zeile:** `host x` funktioniert **nicht** als Display-Filter → `ip.addr == x`.
- **Filter rot:** Syntaxfehler (fehlendes `==`, Tippfehler im Feldnamen).
- **`contains` vs `matches`:** `contains` = Substring, `matches` = Regex.
- **Nichts angezeigt:** Protokoll nicht erkannt (falscher Port) → „Decode As" oder Feldname prüfen.
