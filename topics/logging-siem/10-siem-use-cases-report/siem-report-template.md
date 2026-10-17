# SIEM / Logging Report – <Scope>

**Autor:** <Name> · **Datum:** <YYYY-MM-DD> · **Version:** 1.0

---

## 1. Summary

<2–4 Sätze: Monitoring-Reifegrad, abgedeckte Use-Cases, größte Coverage-Gaps, Top-Maßnahmen.>

---

## 2. Logging-Governance

- **Quellen (Coverage):** <auth, OPNsense, Suricata, Sysmon, Web/DB …>
- **Zentralisierung/SIEM:** <Wazuh/ELK> · **Retention:** <z. B. 90 Tage hot / 1 Jahr cold>
- **Integrität/Zugriff:** <WORM/append-only, Rollen> · **Zeitsync:** NTP ✓

---

## 3. Use-Case-Bibliothek

| ID | Use-Case | Datenquellen | Detection-Logik | ATT&CK | Status |
|----|----------|--------------|-----------------|--------|--------|
| UC1 | SSH-Brute-Force | auth/Agent | Frequency ≥6/60s/IP | T1110 | ✅ getestet |
| UC2 | Privilege Escalation | auth/Sysmon | sudo-root / neuer Admin | T1548/T1136 | ✅ |
| UC3 | Lateral Movement (PtH) | Win/Sysmon/SMB | ungewöhnl. Logon/4624 | T1021/T1550 | ⚠️ teilweise |
| UC4 | C2-Beaconing | Zeek/Firewall | regelmäßige Outbound | T1071 | ⚠️ TLS-Gap |

---

## 4. Test-Ergebnisse

| Use-Case | Testangriff (Thema) | Alert ausgelöst? | Nachweis |
|----------|---------------------|------------------|----------|
| UC1 | hydra ssh (password-attacks) | ✅ | rule 100110 |
| UC4 | Sliver-C2 (post-exploitation) | ⚠️ nur Zeek-Metadaten | conn.log |

---

## 5. Coverage-Gaps & Maßnahmen

| Gap | Priorität | Maßnahme |
|-----|-----------|----------|
| TLS-C2 nur Metadaten | hoch | Zeek-Beaconing-Analytic, JA3-Feeds |
| Windows-Telemetrie dünn | mittel | Sysmon onboarden (Übung 04) |

---

## 6. Response-Playbooks (Kurz)

- **UC1 Brute-Force:** Triage (TP?) → Quelle blocken (Firewall) → Konto prüfen/sperren → IR.
- **UC4 C2:** Host isolieren → C2 blocken → Forensik → IR.

---

## 7. Anhang

- Regeln/Decoder (IDs), Dashboards, Queries, Tool-/Stack-Versionen
