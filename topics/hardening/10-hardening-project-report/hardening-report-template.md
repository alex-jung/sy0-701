# Hardening-Report – <System/Scope>

**Autor:** <Name> · **Datum:** <YYYY-MM-DD> · **Version:** 1.0

---

## 1. Summary

<2–4 Sätze: was wurde gehärtet, wichtigste Verbesserungen (Index/Ports/CVEs), Rest-Risiko.>

---

## 2. Scope & Baseline

- **System:** <OS/Rolle> · **Referenz:** <CIS/MS Baseline> · **Autorisierung:** eigenes Lab
- **Vorher-Messung:**
  - Lynis Hardening-Index: __ / 100
  - Offene Ports (nmap): __
  - Vuln-Scan: __ Critical / __ High

---

## 3. Umgesetzte Maßnahmen

| Bereich | Maßnahme | Übung |
|---------|----------|-------|
| SSH | key-only, kein root, fail2ban | 04 |
| Dienste | Telnet/FTP/rpcbind entfernt | 05 |
| Accounts | Policy+Lockout, sudo minimiert, MFA | 06 |
| Linux | SUID/sysctl/Mounts/Module | 03 |
| (Windows/Netz) | SMBv1 aus, LLMNR aus / OPNsense | 07/09 |

---

## 4. Vorher/Nachher (Nachweis)

| Metrik | Vorher | Nachher |
|--------|--------|---------|
| Lynis Hardening-Index | __ | __ |
| Offene Ports | __ | __ |
| Critical/High CVEs | __ | __ |
| SSH-Brute-Force (hydra) | erfolgreich | scheitert |

---

## 5. Automatisierung / CM

- **Umsetzung als Code:** <Ansible-Playbook/Skript-Pfad>
- **Drift-Erkennung:** <wie – erneuter Lauf/Audit>

---

## 6. Rest-Risiko & Ausnahmen

| Finding | warum nicht gehärtet | kompensierende Kontrolle |
|---------|----------------------|--------------------------|
| <Legacy-Dienst> | betrieblich nötig | Segmentierung / IPS-Regel |

---

## 7. Anhang

- Lynis-/SCAP-Reports (vorher/nachher), nmap-Diffs, Vuln-Scan-Reports, Playbook/Skript, Tool-Versionen
