# Lösung – Übung 02: Stateful Firewall-Regeln

Beispiel: Segment `OPT1` (192.168.20.0/24), Zielhost `192.168.30.50`.

## 1. Nur HTTP/HTTPS erlauben

**Firewall → Rules → OPT1**, Regel oben:
```
Action: Pass | Interface: OPT1 | Direction: in | Protocol: TCP
Source: OPT1 net | Destination: 192.168.30.50 | Dest port: 80, 443 (HTTP/HTTPS)
```
Darunter optional explizit:
```
Action: Block | Source: OPT1 net | Destination: any
```
(ist aber durch default-deny ohnehin abgedeckt). Test von einem OPT1-Host:
```bash
nmap -Pn -p 22,80,443,445 192.168.30.50
# -> 80,443 open ; 22,445 filtered
```

## 2. Reihenfolge-Fehler

Legt man eine `Pass OPT1 net -> any` **über** die `Block`-Regel, gewinnt sie (first match) → alles erlaubt. In OPNsense Regeln per Drag&Drop ordnen: **spezifische pass-Regeln oben, breite/block unten**. Nach Korrektur erneut `nmap` → nur 80/443 offen.

## 3. block vs. reject

- **Block** auf Port 22: `nmap` → `filtered` (keine Antwort).
- **Reject** auf Port 22: `nmap` → `closed`/`filtered` mit `admin-prohibited` (ICMP/RST kommt).
→ Intern nutzt man oft **reject** (schnelleres Feedback), nach außen (WAN) **block** (weniger Info für Angreifer).

## 4. Stateful-Verhalten

Eine erlaubte ausgehende HTTP-Verbindung bekommt die Antwortpakete **automatisch** zurück – es ist **keine** eingehende „Rückregel" nötig. Sichtbar unter **Firewall → Diagnostics → States** (aktive Verbindungen).

## 5. Regeln auf eingehendem Interface

pf wertet Traffic dort aus, wo er **in die Firewall eintritt**. Eine Verbindung von OPT1 nach OPT2 wird auf dem **OPT1**-Interface (Richtung „in") gefiltert, nicht auf OPT2. Deshalb: Regeln immer auf dem **Quell-Interface** definieren.

## Häufige Fehler / Troubleshooting

- **Regel wirkt nicht:** falsches Interface (Quelle!) oder weiter oben steht eine breitere Regel (first match) → Live View zeigt die greifende Regel.
- **Alte States:** nach Regeländerung bestehende States killen (Diagnostics → States → reset), sonst gilt die alte Verbindung weiter.
- **Kein Log:** pro Regel „Log" aktivieren (Übung 06).
- **„any/any" vergessen zu entfernen:** default LAN-allow verschleiert Tests.
