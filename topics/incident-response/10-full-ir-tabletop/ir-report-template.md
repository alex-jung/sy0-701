# Incident Response Report (After-Action) – <Vorfall>

**Incident Commander:** <Name> · **Datum:** <YYYY-MM-DD> · **Incident-ID:** <INC-...> · **Severity:** <SEV1–3>
**Klassifizierung:** Vertraulich

---

## 1. Executive Summary

<3–6 Sätze: was ist passiert, Impact (CIA/Daten), wie lange, aktueller Status, Top-Maßnahmen.>

---

## 2. Scope & Beteiligte

- **Betroffene Systeme/Konten/Daten:** <…>
- **Rollen:** IC <…>, Analyst/Forensik <…>, Comms <…>
- **Zeitraum:** Initial Access <…> → Entdeckung <…> → Abschluss <…>

---

## 3. Timeline (Angriffskette)

| Zeit (UTC) | Phase (ATT&CK) | Ereignis | Quelle/Nachweis |
|------------|----------------|----------|-----------------|
| t0 | Recon | Scan von <IP> | Firewall/IDS |
| t1 | Initial Access | Exploit/Upload | FS-Timeline/IDS |
| … | … | … | … |

---

## 4. Response-Maßnahmen (Phasen)

- **Detection/Triage:** <wie erkannt, TP-Verifikation, Severity>
- **Containment:** <Isolation/Account – mit Zeit>
- **Beweissicherung:** <Images/Hashes, Chain of Custody-IDs>
- **Eradication/Recovery:** <Root Cause geschlossen, rebuild/restore, Monitoring>

---

## 5. Root Cause & Impact

- **Root Cause:** <wie kam der Angreifer rein>
- **Impact:** <C/I/A, Daten, Systeme, Geschäft>
- **Dwell Time / MTTD / MTTR:** <Werte>

---

## 6. IoCs

- IPs/Domains: <…> · Hashes: <…> · Konten: <…> · JA3/Signaturen: <…>

---

## 7. Lessons Learned & Action Items

| Kategorie | Maßnahme | Owner | Frist | Status |
|-----------|----------|-------|-------|--------|
| Prevention | <…> | <> | <> | offen |
| Detection | <…> | <> | <> | offen |
| Process | <…> | <> | <> | offen |

---

## 8. Meldepflichten / Kommunikation

- <Meldepflicht (z. B. DSGVO 72h) ja/nein, an wen, Frist> · <interne/externe Kommunikation>

## 9. Anhang

- Evidence-Liste (IDs/Hashes), Forensik-Outputs, Befehle, Tool-Versionen, Snapshots
