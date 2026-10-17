# Active Directory Pentest & Defense Report – <Domäne>

**Tester:** <Name> · **Datum:** <YYYY-MM-DD> · **Version:** 1.0
**Klassifizierung:** Vertraulich

---

## 1. Executive Summary

<3–6 Sätze: Einstieg (ohne Creds?), wie schnell Domain Admin erreicht wurde, Hauptursachen, Top-Maßnahmen.>

**Ergebnis:** Einstieg ohne Credentials → **Domain Admin** in <Schritte/Zeit>.

---

## 2. Scope & Methodik

- **Domäne/Hosts:** <lab.local, DC, Clients> · **Autorisierung:** eigenes Lab
- **Methodik:** Enum → BloodHound → Roasting/Relay → Dumping/PtH → DCSync
- **Tools:** netexec, Impacket, BloodHound, Responder, kerbrute, mimikatz

---

## 3. Angriffskette (MITRE ATT&CK + Event-IDs)

| Schritt | ATT&CK | Aktion | Tool | Nachweis | Detection (Event) |
|---------|--------|--------|------|----------|-------------------|
| Einstieg | TA0006 | Spraying/AS-REP | kerbrute/GetNPUsers | erste Creds | 4625/4768 |
| Mapping | TA0007 | BloodHound | SharpHound | Pfad zu DA | 4662/LDAP |
| Eskalation | TA0004 | Kerberoasting | GetUserSPNs | svc-PW | 4769 (RC4) |
| Lateral | TA0008 | PtH/Relay | netexec/ntlmrelayx | Zugriff Host B | 4624/4776 |
| Dumping | TA0006 | LSASS/secretsdump | mimikatz | DA-Hash | LSASS-Access |
| Dominance | TA0003 | DCSync/Golden | secretsdump/ticketer | krbtgt | 4662 (Nicht-DC) |

---

## 4. Findings

| # | Finding | Ursache | Risiko |
|---|---------|---------|--------|
| 1 | Schwache Service-Account-PW | kein gMSA | 🔴 |
| 2 | LLMNR aktiv / SMB-Signing aus | Default | 🔴 |
| 3 | DA-Login auf Tier-2-Host | kein Tiering | 🔴 |
| 4 | Account ohne Preauth | Legacy | 🟠 |
| 5 | Überprivilegierte ACLs | Gruppenhygiene | 🟠 |

---

## 5. Härtung (priorisiert)

| Prio | Maßnahme |
|------|----------|
| P1 | **Tiering/PAW**, kein DA auf Low-Tier-Hosts; **Credential Guard** |
| P1 | **gMSA**/starke Service-PW; **LLMNR aus** + **SMB-Signing** erzwingen |
| P1 | **MFA**, LAPS |
| P2 | Preauth überall; ACL-Reviews (BloodHound); AES erzwingen |
| P2 | Monitoring: 4625/4768/4769/4662, SIEM-Alerts, krbtgt-Reset-Prozess |

---

## 6. Anhang

- Befehle je Schritt (reproduzierbar), BloodHound-Export, Hashes/Tickets (sicher), Tool-Versionen, Snapshots
