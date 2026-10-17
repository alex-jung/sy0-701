# Lösung – Übung 02: Suricata aufsetzen

## 1. Aktivieren + Interface

**Services → Intrusion Detection → Administration:**
- „Enabled" ✓, **IPS mode**: zunächst **aus** (reiner IDS).
- **Interfaces:** das zu überwachende wählen. Zum Lernen oft das **LAN/internes** Interface (sieht entschlüsselten internen Traffic + Angriffe aus dem Lab); **WAN** für Perimeter-Sicht (aber hinter NAT begrenzt). Begründung dokumentieren.

## 2. ET-Open-Regeln

**Download-Tab:** „ET open/rules" (und ggz. abuse.ch, PT) auswählen → **Download & Update Rules**. Danach im **Rules-Tab** Kategorien aktivieren (z. B. `scan`, `exploit`, `trojan`, `malware`). Policy/„Installed Rulesets" prüfen.

## 3. IDS-Modus sicherstellen

„IPS mode" **deaktiviert** = Suricata alarmiert nur (Detect), blockt nichts. Sicher zum Lernen; Blocking kommt in Übung 06.

## 4. Start + Status

Apply/Start → **Services**-Status prüfen; Log unter **Services → Intrusion Detection → Alerts** bzw. System-Log. `suricata`-Prozess läuft.

## 5. Test

Von Kali einen Scan gegen ein überwachtes Ziel:
```bash
sudo nmap -sS -p 1-1000 <ZIEL-im-überwachten-Segment>
```
→ im **Alerts-Tab** erscheinen „ET SCAN …"-Einträge (Quelle = Kali). Bestätigt: Suricata sieht den Traffic + Regeln greifen.

## Härtung/Betrieb

- Regel-Updates **automatisieren** (Scheduler), RAM ausreichend, nur relevante Kategorien (Performance), später IPS + Tuning.

## Häufige Fehler / Troubleshooting

- **Keine Alerts:** falsches Interface (sieht den Traffic nicht), Regeln nicht aktiviert/geladen, Suricata nicht gestartet.
- **Suricata startet nicht / OOM:** zu wenig RAM → VM aufstocken, weniger Regeln.
- **WAN sieht nur NAT-IP:** internes Interface überwachen, wenn interne Quellen/Ziele interessieren.
- **Hoher CPU:** Kategorien eingrenzen, Hyperscan/Threads prüfen.
