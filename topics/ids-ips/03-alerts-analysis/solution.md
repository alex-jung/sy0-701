# Lösung – Übung 03: Alerts auswerten

## 1. Drei Alert-Typen erzeugen

```bash
# Portscan:
sudo nmap -sS -p- <ZIEL>
# Web-Angriff:
nikto -h http://<DVWA>/        # bzw. sqlmap gegen DVWA
# bekannter Exploit/Backdoor-Muster:
sudo nmap --script vuln -p21,445 <METASPLOITABLE>
```

## 2. Alert lesen (UI)

**Services → Intrusion Detection → Alerts.** Beispiel:
```
Timestamp: ...  | Action: allowed
Signature: ET SCAN Nmap Scripting Engine User-Agent...   SID: 2024...  
Classtype: attempted-recon  | Severity: 2
Src: <KALI>:xxxx -> Dst: <ZIEL>:80
```
→ Signatur (was), SID (welche Regel), Classtype (Kategorie), Severity, Flow.

## 3. eve.json mit jq

```bash
# auf OPNsense (Shell) bzw. exportiert:
cat /var/log/suricata/eve.json | jq -c 'select(.event_type=="alert") | {ts:.timestamp, sig:.alert.signature, sid:.alert.signature_id, sev:.alert.severity, src:.src_ip, dst:.dest_ip}'
# nach Quelle filtern:
jq 'select(.event_type=="alert" and .src_ip=="<KALI>")' eve.json
```

## 4. Korrelation

Über **Timestamp + Src-IP (Kali)** die Alerts den eigenen Aktionen zuordnen: Scan-Zeitfenster → „ET SCAN"-Alerts; nikto-Zeit → „ET WEB_SERVER"/„ATTACK_RESPONSE"-Alerts; Exploit-Scan → passende Vuln/Scan-Signaturen.

## 5. Triage

- **Portscan von Kali:** True Positive (du warst es), Severity niedrig-mittel, Kontext „autorisierter Test".
- **nikto/SQLi:** True Positive, höher (aktiver Web-Angriff).
- Ein Alert von einer **unerwarteten** Quelle/Zeit wäre der echte Ernstfall → eskalieren.
In Produktion: TP/FP + Severity + Kontext bestimmen die Reaktion (Bezug `incident-response`).

## Häufige Fehler / Troubleshooting

- **eve.json nicht gefunden:** Pfad je Setup (`/var/log/suricata/`); EVE-Output in Suricata-Settings aktiviert?
- **Zu viele Alerts:** nach Severity/Signatur filtern (`jq`); Tuning folgt in Übung 07.
- **Kein Web-Alert:** Suricata sieht den DVWA-Traffic nur, wenn er über das überwachte Interface läuft.
- **Zeit falsch:** NTP → sonst Korrelation unmöglich.
