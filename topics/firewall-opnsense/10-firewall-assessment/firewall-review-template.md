# Firewall Review / Assessment Report – <OPNsense/Scope>

**Autor:** <Name> · **Datum:** <YYYY-MM-DD> · **Version:** 1.0

---

## 1. Summary

<2–4 Sätze: Gesamtzustand des Regelwerks, größte Exposure/Findings, Top-Maßnahmen.>

**Gesamtbewertung:** 🔴 / 🟡 / 🟢

---

## 2. Scope & Methodik

- **Firewall:** <OPNsense-Version, Interfaces/Segmente>
- **Vorgehen:** Exposure-Review · Regel-Hygiene · Segmentierungs-Test (nmap) · Egress/Betrieb
- **Autorisierung:** eigenes Lab · **Backup erstellt:** ja

---

## 3. Exposure (WAN / North-South)

| Port Forward / WAN-Regel | Ziel | Quelle | Nötig? | Risiko |
|--------------------------|------|--------|--------|--------|
| WAN:8080 → 192.168.30.50:80 | Webserver | any | ? | 🟠 (Quelle any) |

---

## 4. Regel-Hygiene

| Finding | Ort | Risiko |
|---------|-----|--------|
| `any/any`-Regel | LAN | 🔴 |
| tote Regel (Hit-Count 0) | OPT1 | 🟡 |
| fehlende Beschreibung | mehrere | 🟢 |
| Reihenfolge (breit über spezifisch) | GUEST | 🟠 |

---

## 5. Segmentierung (East-West, verifiziert)

| Von → Nach | Soll | Ist (nmap) | OK? |
|------------|------|------------|-----|
| GUEST → LAN | block | filtered | ✅ |
| IoT → LAN | block | **open** | ❌ Finding |

---

## 6. Egress & Betrieb

- Egress-Filtering: <ja/nein> · Logging: <…> · Remote-Syslog: <…>
- Backup aktuell: <…> · Updates/Patches: <…> · HA/CARP: <…> · Management-Härtung/2FA: <…>

---

## 7. Findings & Empfehlungen (priorisiert)

| Prio | Finding | Empfehlung |
|------|---------|------------|
| P1 | IoT→LAN nicht isoliert | Block-Regel korrigieren/Reihenfolge |
| P1 | Port Forward Quelle any | auf benötigte Quelle einschränken |
| P2 | any/any LAN | least-privilege-Regeln |
| P2 | kein Egress-Filter | Egress-Policy (Floating) |
| P3 | tote/undokumentierte Regeln | entfernen/dokumentieren |

---

## 8. Anhang

- Regel-Export, nmap-Ergebnisse je Segment, Screenshots/States, Tool-/Firmware-Versionen
