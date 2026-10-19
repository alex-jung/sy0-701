# Lösung – Übung 06: IOCs

## 1. Kategorisierung (Beispiele)

| IOC | Kategorie | stark? |
|-----|-----------|--------|
| C2-Domain/IP | Netz | ja (bei frischer TI) |
| SHA256 bekannter Malware | Host | mittel (leicht änderbar) |
| Beaconing alle 60 s zu fremder IP | Netz/Verhalten | ja |
| neuer Autostart/Scheduled Task | Host | ja |
| Login 03:00 aus anderem Land | Account | ja (impossible travel) |
| viele Fehl-Logins + Lockout | Account | mittel |
| fremder User-Agent | Netz | schwach allein |
| Massen-Dateiänderungen | Host | ja (Ransomware) |
| fehlende/gelöschte Logs | Host | ja (Anti-Forensik) |
| hohe CPU (Miner) | Host | mittel |

## 2. Echte IOCs aus Lab-Daten

```bash
# Honeypot (cowrie.json):
jq -r '.src_ip' cowrie.json | sort -u                 # Quell-IPs
jq -r 'select(.shasum!=null).shasum' cowrie.json       # Hashes
# PCAP:
tshark -r capture.pcap -T fields -e dns.qry.name | sort -u   # DNS/Domains
```
→ IPs, Hashes, Domains, SSH-Client-Versionen, Befehlssequenzen.

## 3. SY0-701-Indicators → Szenario

| Indicator | Szenario |
|-----------|----------|
| Impossible travel | Login DE 10:00 + US 10:05 → gekapertes Konto |
| Account lockout | Brute-Force/Spraying |
| Out-of-cycle logging | Aktivität außerhalb Geschäftszeiten |
| Missing logs | Angreifer deckt Spuren |
| Resource consumption | Cryptominer/DoS |

## 4. Operationalisieren + Abgrenzung

- IPs/Domains → OPNsense-Blocklist/Suricata-Drop; Hash → YARA/Watchlist; Verhalten (impossible travel) → SIEM-Korrelationsregel.
- **IOC** = Beleg, dass etwas passiert **ist** (reaktiv, atomar). **IOA** = laufendes Angriffs**verhalten** (proaktiv). **TTP** = die generelle **Vorgehensweise** (am robustesten, Übung 07/09).

## Hinweise / Troubleshooting

- Atomare IOCs (Hash/IP) altern schnell → mit TTPs ergänzen (Pyramid of Pain, Übung 09).
- Einzelne schwache Indikatoren erst durch **Korrelation** aussagekräftig (SIEM).
- Zeitzonen/False Positives beachten (Lab-Scanner erzeugt eigene „IOCs").
