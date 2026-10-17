# PCAP Investigation Report – <Fall/Scope>

**Analyst:** <Name> · **Datum:** <YYYY-MM-DD> · **PCAP:** <datei + sha256>

---

## 1. Summary

<2–4 Sätze: was zeigt das Capture, welche Angriffskette, Schweregrad, Kernbefund.>

---

## 2. Überblick

- **Zeitraum:** <erste – letzte Paketzeit> · **Pakete/Größe:** <…>
- **Top-Protokolle:** <aus Protocol Hierarchy> · **Top-Talker:** <Conversations>
- **Beteiligte Hosts:** Angreifer <IP>, Ziel(e) <IP>, externes Ziel/C2 <IP/Domain>

---

## 3. Timeline (Angriffskette)

| Zeit | Phase (ATT&CK) | Beobachtung | Nachweis (Paket/Stream/Filter) |
|------|----------------|-------------|--------------------------------|
| t0 | Recon/Scan | SYN-Fächer von <IP> | `tcp.flags.syn==1&&ack==0` |
| t1 | Exploitation | vsftpd-Backdoor-Trigger | Stream #, Port 6200 |
| t2 | C2 | Beaconing zu <C2> | Conversations/IO-Graph |
| t3 | Exfiltration | großer Upload / DNS-Tunnel | `dns`/conn |

---

## 4. Befunde (mit Nachweis)

### Finding 1 – <Titel>
- **Beschreibung:** <…>
- **Nachweis:** <Paketnummer/Follow-Stream/tshark-Befehl + Ausgabe>
- **Bewertung:** <Schwere/Impact>

*(pro Finding wiederholen)*

---

## 5. Artefakte & IoCs

- **Extrahierte Dateien:** <Name, Hash>
- **Credentials (falls Klartext):** <Quelle/Protokoll – sensibel behandeln>
- **IoCs:** IPs <…>, Domains <…>, JA3 <…>, Ports/Signaturen <…>

---

## 6. Empfehlungen & Detection

| Bezug | Maßnahme |
|-------|----------|
| Klartext-Dienst | durch TLS/SSH ersetzen |
| C2-IP/JA3 | Block + Suricata-Regel / SIEM-Watchlist |
| Scan | IDS-Regel / Firewall-Rate-Limit |

---

## 7. Anhang

- Reproduzierbare tshark-Befehle, relevante Streams/Export-Objekte, PCAP-Hash, Tool-Versionen
