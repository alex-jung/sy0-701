# Lösung – Übung 10: Detection-Engineering & SOC

Beispiel-Konzept fürs eigene Lab. `detection-report-template.md` ist das Gerüst.

## 1. Coverage-Matrix

Angriffsphasen (ATT&CK) auflisten und je Phase die Erkennungsquelle eintragen (Suricata/Zeek/Firewall) — siehe Template Abschnitt 3. Ehrlich markieren, was ✅ / ⚠️ / ❌ ist.

## 2. Testfälle fahren

Je Phase einen realen Angriff aus den offensiven Themen:
```bash
sudo nmap -sS -p- <ZIEL>                       # Scan -> Suricata
# vsftpd/Samba-Exploit via Metasploit          # Exploit -> Suricata
# Sliver/Meterpreter-C2 (HTTPS)                 # C2 -> Zeek Beaconing
# DNS-Exfil (post-exploitation 08)             # Exfil -> Zeek dns.log
```
Erkennung je Fall prüfen (Alerts/Zeek-Logs) → Rot/Grün in die Matrix.

## 3. SOC-Workflow (ein Alert)

1. **Detect:** „ET MALWARE Possible C2 Beacon".
2. **Triage:** Quelle intern, Ziel unbekannt extern, regelmäßig → wahrscheinlich TP, Severity hoch.
3. **Investigate:** Zeek conn.log (Intervalle/Bytes), Firewall-Log (erlaubt?), Host (Prozess?). Umfang: nur ein Host?
4. **Respond:** Host isolieren (Firewall/Segment), C2-IP/Domain blocken, an **Incident Response** übergeben.
5. **Improve:** JA3/Domain in Blocklist, Beaconing-Analytic ergänzen.

## 4. Gap schließen

Beispiel: langsamer Scan (`-T0`) wird signaturbasiert nicht erkannt → Zeek-Analytic auf „ein Host kontaktiert viele Ports über langes Zeitfenster" ergänzen, oder Firewall-Log-Korrelation im SIEM. Neue Suricata-Custom-Regel (SID ≥ 1000000) für ein spezifisches IoC.

## 5. Report

`detection-report-template.md` ausfüllen: Setup, Coverage-Matrix, Testfälle (Rot/Grün + Nachweis), Gaps + Schließung, SOC-Workflow. Custom-Regeln/Zeek-Queries in den Anhang.

## Kernaussagen (Prüfung)

- **Mehrschichtig erkennen:** Signaturen (Suricata) + Metadaten/Verhalten (Zeek) + Logs (Firewall/Host) → zentral (SIEM).
- **Coverage gegen ATT&CK messen**, Gaps bewusst machen und schließen (Detection ist nie „fertig").
- **SOC-Prozess** (Detect→Triage→Investigate→Respond→Improve) + Anbindung an **Incident Response**.

## Häufige Fehler / Troubleshooting

- **Nur Signaturen:** TLS-C2/0-Day fehlen → Zeek/Anomaly/HIDS ergänzen.
- **Keine Zentralisierung:** ohne SIEM keine Korrelation → Logs zusammenführen (`logging-siem`).
- **Coverage nur behauptet:** jede Zeile mit einem Testfall belegen (Rot/Grün).
- **Kein Response-Pfad:** Detection ohne IR-Anbindung bringt wenig.
