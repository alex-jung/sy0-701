# Roadmap – Themen

Übersicht aller geplanten Themen für SY0-701-Praxis + allgemeine Cybersecurity-/Hacking-Übungen. Jedes Thema wird ein `topics/<slug>/` mit 10 Übungen (Schwierigkeit 1→10). Status pflegen, sobald ein Thema begonnen/fertig ist.

**Status-Legende:** ⬜ offen · 🟡 in Arbeit · ✅ fertig

**SY0-701-Domänen:** 1.0 General Security Concepts · 2.0 Threats, Vulnerabilities & Mitigations · 3.0 Security Architecture · 4.0 Security Operations · 5.0 Program Management & Oversight

**Lab:** Proxmox · OPNsense · Kali · Metasploitable/DVWA. ⚠️ = braucht zusätzliches Setup (nicht im aktuellen Lab).

## Offensive / Pentest-Praxis

| Status | Thema (slug) | Inhalt | Domäne | Lab |
|--------|--------------|--------|--------|-----|
| ✅ | `reconnaissance` | Passive OSINT, DNS/WHOIS, Google Dorking, theHarvester, Shodan | 2.0 | |
| ✅ | `network-scanning` | Host/Port/Service/OS-Scan, NSE, Evasion | 2.0 / 4.0 | |
| ✅ | `enumeration` | SMB, SNMP, LDAP, NFS, SMTP, RPC gezielt ausnutzen | 2.0 / 4.0 | |
| ✅ | `vulnerability-scanning` | OpenVAS/Greenbone, Nessus, Nmap-vuln, CVSS-Bewertung | 4.0 | |
| ✅ | `exploitation-metasploit` | Metasploit-Framework, Payloads, Meterpreter | 2.0 | |
| ✅ | `web-exploitation` | DVWA/OWASP Top 10: SQLi, XSS, CSRF, LFI/RFI, Command Injection | 2.0 | |
| ✅ | `password-attacks` | Hashcat, John, Hydra, Wortlisten, Hash-Typen, Salting | 2.0 / 1.0 | |
| ✅ | `privilege-escalation` | Linux/Windows PrivEsc, SUID, Kernel-Exploits, Misconfigs | 2.0 | |
| ✅ | `post-exploitation-pivoting` | Lateral Movement, Pivoting, Persistence, C2-Grundlagen | 2.0 / 4.0 | |
| ✅ | `wireless-security` | WPA2-Handshake, aircrack-ng, Evil Twin | 2.0 / 3.0 | ⚠️ WLAN-Adapter |
| ✅ | `social-engineering` | Phishing-Mechanik, SET, Pretexting, Payload-Delivery | 2.0 | |
| ✅ | `active-directory-attacks` | Kerberoasting, Pass-the-Hash, BloodHound | 2.0 | ⚠️ Windows/AD-VM |

## Defensive / Blue Team & Security Operations

| Status | Thema (slug) | Inhalt | Domäne | Lab |
|--------|--------------|--------|--------|-----|
| ✅ | `firewall-opnsense` | Regeln, NAT, Zonen, Segmentierung, Logging | 3.0 / 4.0 | |
| ✅ | `ids-ips` | Suricata/Snort auf OPNsense, Signaturen, Tuning, Alerts | 4.0 | |
| ✅ | `logging-siem` | Log-Analyse, Wazuh/ELK, Korrelation, Alerting | 4.0 | ⚠️ SIEM-VM |
| ✅ | `packet-analysis` | Wireshark/tcpdump: Protokolle, Anomalien, IoCs | 4.0 | |
| ✅ | `incident-response` | IR-Lifecycle, Triage, Containment, Forensik-Grundlagen | 4.0 | |
| ✅ | `hardening` | CIS-Benchmarks, Dienste abschalten, Baselines, Patch-Mgmt | 1.0 / 4.0 | |
| ✅ | `malware-analysis` | Statische/dynamische Analyse in isolierter VM | 2.0 / 4.0 | ⚠️ isolierte VM + Snapshots |
| ✅ | `honeypots` | Cowrie/T-Pot aufsetzen, Angriffe beobachten | 4.0 | ⚠️ Honeypot-VM |

## Kryptografie & Identität

| Status | Thema (slug) | Inhalt | Domäne | Lab |
|--------|--------------|--------|--------|-----|
| ✅ | `cryptography-basics` | Symmetrisch/asymmetrisch, Hashing, HMAC, openssl-Praxis | 1.0 | |
| ✅ | `pki-certificates` | CA aufbauen, CSR, X.509, TLS, Cert-Chains | 1.0 / 3.0 | |
| ✅ | `authentication` | MFA, FIDO2, RADIUS, Kerberos, Credential-Hashing | 1.0 | |
| ✅ | `vpn-tunneling` | IPsec/WireGuard/OpenVPN auf OPNsense, Traffic prüfen | 3.0 | |

## Governance, Risk & Compliance (szenario-/theorielastig)

| Status | Thema (slug) | Inhalt | Domäne | Lab |
|--------|--------------|--------|--------|-----|
| ✅ | `security-controls` | Control-Typen (preventive/detective…), Defense in Depth | 1.0 | |
| ✅ | `risk-management` | Risk Assessment, BIA, RTO/RPO, Risk Register | 5.0 | |
| ✅ | `governance-compliance` | Policies, Frameworks (NIST/ISO 27001), Audits | 5.0 | |
| ✅ | `threat-concepts` | Threat Actors, TTPs, MITRE ATT&CK, Indicators | 2.0 | |
| ✅ | `security-architecture` | Zero Trust, Segmentierung, Cloud/On-Prem, SASE | 3.0 | |
| ✅ | `data-protection` | Klassifizierung, DLP, Verschlüsselung at-rest/in-transit | 3.0 | |
| ✅ | `physical-security` | Physische Kontrollen, Zutritt, Sensoren | 1.0 / 2.0 | |

## Empfohlene Reihenfolge

Ein sinnvoller Pfad, der thematisch aufeinander aufbaut (Angreifer-Kill-Chain → dann Defense → dann Krypto/GRC):

1. `reconnaissance` → `network-scanning` ✅ → `enumeration` → `vulnerability-scanning`
2. `exploitation-metasploit` → `web-exploitation` → `password-attacks`
3. `privilege-escalation` → `post-exploitation-pivoting`
4. Blue Team: `firewall-opnsense` → `ids-ips` → `packet-analysis` → `logging-siem` → `incident-response`
5. Krypto/Identität: `cryptography-basics` → `pki-certificates` → `authentication` → `vpn-tunneling`
6. GRC/Theorie zum Prüfungs-Feinschliff: `security-controls`, `risk-management`, `threat-concepts`, `security-architecture`, `data-protection`, `governance-compliance`, `physical-security`
