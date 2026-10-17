# Detection & Monitoring Report – <Scope>

**Autor:** <Name> · **Datum:** <YYYY-MM-DD> · **Version:** 1.0

---

## 1. Summary

<2–4 Sätze: Detection-Reifegrad, abgedeckte vs. nicht abgedeckte Phasen, Top-Verbesserungen.>

---

## 2. Setup

- **Sensoren:** Suricata (IDS/IPS, Interface) · Zeek (NSM) · Firewall-Logs
- **Zentralisierung:** <Syslog/SIEM?> · **Regel-Feeds:** ET Open (+ custom)
- **HOME_NET:** <…> · **Update-Rhythmus:** <…>

---

## 3. Detection-Coverage (ATT&CK)

| Phase / Technik | Quelle | Erkannt? | Hinweis |
|-----------------|--------|----------|---------|
| Recon/Scan (TA0043) | Suricata ET SCAN | ✅ | `-T0` entgeht |
| Exploitation (TA0002) | Suricata Exploit-Sig | ✅ | nur Klartext |
| Lateral Movement (TA0008) | Firewall + Zeek | ⚠️ | SMB intern |
| C2 (TA0011) | Zeek Beaconing/JA3 | ⚠️ | TLS → nur Metadaten |
| Exfiltration (TA0010) | Zeek conn/dns | ⚠️ | DNS-Exfil prüfen |

---

## 4. Testfälle (Rot/Grün)

| Angriff (aus Thema) | erwartet | erkannt | Nachweis |
|---------------------|----------|---------|----------|
| nmap -sS (network-scanning) | ET SCAN | ✅ | Alert SID … |
| vsftpd-Exploit (exploitation) | Exploit-Sig | ✅ | Alert … |
| Sliver-C2 HTTPS (post-exp) | Beaconing | ⚠️ | Zeek conn.log |

---

## 5. Detection-Gaps & Schließung

| Gap | Maßnahme |
|-----|----------|
| langsamer Scan (`-T0`) | Zeek-Analytic / längeres Zeitfenster |
| TLS-C2 | JA3-Blocklist, Beaconing-Analytic, TLS-Inspection |
| <…> | neue Suricata-Regel SID 100xxxx |

---

## 6. SOC-Workflow (Beispiel-Alert)

1. **Detect:** <Alert> · 2. **Triage:** TP/FP, Severity, Kontext ·
3. **Investigate:** Korrelation (Firewall+IDS+Zeek+Host), Umfang ·
4. **Respond:** block/isolate, IR-Übergabe · 5. **Improve:** Regel/Tuning.

---

## 7. Anhang

- Custom-Regeln (SIDs), Zeek-Queries, eve.json-Auszüge, Tool-/Feed-Versionen
