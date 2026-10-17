# Lösung – Übung 07: Floating, Schedules, Shaping

## 1. Egress-Filtering (Floating Rule)

**Firewall → Rules → Floating → Add:**
```
Action: Pass | Interface: WAN | Direction: out | Quick: yes
Protocol TCP/UDP | Source: any | Dest: any | Dest port: 53,80,443 (Alias Allowed_Egress)
```
Darunter:
```
Action: Block | Interface: WAN | Direction: out | Quick: yes | Source any -> any  (+Log)
```
Effekt: eine Reverse-Shell auf Port 4444 (aus `exploitation`) nach außen wird **geblockt**; nur erlaubte Egress-Ports gehen. Test: Listener auf 4444 extern → Verbindungsversuch scheitert; `curl https://...` geht.

## 2. Schedule

**Firewall → Settings → Schedules → Add:** z. B. `Guest_Hours` Mo–Fr 08:00–18:00. Dann in der Guest-Pass-Regel das Feld **Schedule = Guest_Hours** setzen → außerhalb der Zeit greift die Regel nicht (Default-Deny → kein Internet).

## 3. Traffic Shaping

**Firewall → Shaper → Pipes:** Pipe mit z. B. 5 Mbit. **Queues** optional. **Rules:** Pipe einem Segment/Protokoll zuweisen. Messen mit `iperf3`/Speedtest vom Segment → Durchsatz gedeckelt.

## 4. Floating vs. normal / Quick

- **Normale Regel:** nur auf **einem** Interface, Richtung „in".
- **Floating:** mehrere Interfaces, Richtung wählbar (auch „out").
- **Quick (Floating):** first-match, greift sofort. **Ohne Quick:** wirkt erst, wenn keine spätere Interface-Regel passt (last-match-artig). Für harte Blocks → Quick.

## 5. Warum Egress-Filtering

Die meisten Angriffe brauchen einen **Rückkanal nach außen** (Reverse Shell, C2-Beacon, Exfiltration). Erlaubt man ausgehend nur das Nötige (53/80/443 zu definierten Zielen), bricht man diese Kanäle oder zwingt den Angreifer auf wenige, überwachbare Ports → deutlich bessere Abwehr/Erkennung.

## Häufige Fehler / Troubleshooting

- **Egress-Block sperrt legitime Dienste:** erst beobachten (Log), dann Allowlist erweitern; Updates/NTP/DNS nicht vergessen.
- **Floating ohne Quick wirkt „nicht":** Quick setzen oder Reihenfolge/Interface-Regeln beachten.
- **Schedule-Zeitzone:** OPNsense-Zeitzone/NTP korrekt.
- **Shaper greift nicht:** Pipe + Rule beide nötig; Richtung/Interface prüfen.
