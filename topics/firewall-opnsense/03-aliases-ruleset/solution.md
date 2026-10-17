# Lösung – Übung 03: Aliases & Regelwerk

## 1. Aliases anlegen

**Firewall → Aliases → Add:**
- `Servers` · Typ **Host(s)** · Inhalt `192.168.30.50`, `192.168.30.51`
- `Web_Ports` · Typ **Port(s)** · Inhalt `80 443`

## 2. Regel mit Aliases

Statt zweier IP-Regeln eine:
```
Pass | Interface OPT1 | TCP | Source OPT1 net | Destination Servers | Dest port Web_Ports
```
Test wie in Übung 02 (`nmap`) → gleiche Wirkung, aber eine wartbare Regel. Neue Server künftig nur im Alias ergänzen.

## 3. URL-Table-Blockliste

**Firewall → Aliases → Add:** Typ **URL Table (IPs)**, URL einer (Test-)Blockliste, Refresh-Intervall (z. B. 1 Tag), Name `Blocklist_Threat`.
Regel ganz oben auf WAN/Segment:
```
Block | Source Blocklist_Threat | Destination any   (und umgekehrt Dest Blocklist_Threat)
+ Log aktivieren
```

## 4. Alias-Inhalt prüfen

**Firewall → Diagnostics → Aliases:** `Blocklist_Threat` auswählen → zeigt die tatsächlich geladenen IPs + Aktualität. So verifiziert man, dass die externe Liste wirklich gezogen wurde.

## 5. Dokumentation & Nutzen

Jede Regel bekommt eine **Beschreibung** („OPT1 → interne Webserver"). Aliases sind sicherer, weil:
- eine Änderung (IP/Port) an **einer** Stelle statt in vielen Regeln,
- weniger Copy-Paste-Fehler, lesbares Regelwerk (Audit!),
- externe Threat-Feeds automatisch eingebunden (URL-Table).

## Häufige Fehler / Troubleshooting

- **URL-Table leer/alt:** URL/Format (eine IP/CIDR pro Zeile), Refresh abwarten, Internet-Zugang der Firewall; Diagnostics prüfen.
- **Port-Alias-Format:** Ports mit Leerzeichen/Zeilen, keine Kommas im Feld (UI-abhängig).
- **Alias greift nicht:** nach Änderung Filter neu laden; in der Regel wirklich den Alias (nicht die alte IP) referenziert?
- **Zu große Listen:** sehr große URL-Tables kosten RAM/Ladezeit – maßvoll.
