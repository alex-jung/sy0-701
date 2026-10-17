# Thema: Active Directory Attacks

Praxis-Übungen zu **Active-Directory-Angriffen** – dem Herzstück fast jeder Unternehmens-IT. Von Domain-Enumeration über AS-REP-Roasting, Kerberoasting, NTLM-Relay und Credential Dumping bis DCSync/Domain Dominance. Mit Angriff **und** Erkennung/Härtung.

> ⚠️ **Nur dein eigenes AD-Lab.** AD-Angriffe gegen fremde Domänen sind strafbar. Betreibe ein **eigenes Test-AD** (Windows Server als Domain Controller + ein/zwei Member/Clients) in deinem isolierten Proxmox-Lab. **Snapshots** anlegen.

## Lernziele

- AD-Grundlagen verstehen (Kerberos, NTLM, LDAP, SPN, Tickets)
- Die Domäne enumerieren und Angriffspfade finden (BloodHound)
- Die klassischen AD-Angriffe durchführen: Spraying, AS-REP/Kerberoasting, LLMNR-Relay, PtH, DCSync
- Attack Paths zu Domain Admin nachvollziehen
- Zu jedem Angriff Erkennung + Härtung kennen

## Abgedeckte SY0-701-Domänen

- **2.0 Threats, Vulnerabilities & Mitigations** – AD-/Kerberos-Angriffe, Lateral Movement, Privilege Escalation
- **1.0 General Security Concepts** – Authentifizierung (Kerberos/NTLM), Directory Services
- **4.0 Security Operations** – Detection (Event-IDs), Hardening, Monitoring

## Übungen (Schwierigkeit 1 → 10)

| #  | Übung | Schwierigkeit |
|----|-------|---------------|
| 01 | AD-Grundlagen & Lab-Setup | 1/10 |
| 02 | Domain Enumeration | 2/10 |
| 03 | BloodHound / SharpHound (Attack Paths) | 3/10 |
| 04 | Password Spraying & User-Enum (kerbrute) | 4/10 |
| 05 | AS-REP Roasting | 5/10 |
| 06 | Kerberoasting | 6/10 |
| 07 | LLMNR/NBT-NS Poisoning & NTLM Relay | 7/10 |
| 08 | Credential Dumping & Pass-the-Hash | 8/10 |
| 09 | DCSync & Domain Dominance (Golden/Silver Ticket) | 9/10 |
| 10 | Vollständige AD-Attack-Chain + Defense-Report | 10/10 |

## Lab-Voraussetzungen

- **Windows Server** als **Domain Controller** (Test-Domäne, z. B. `lab.local`) + mindestens ein **Member-Host/Client**, einige Test-User (einer mit SPN, einer ohne Kerberos-Preauth) – in Proxmox
- **Kali Linux** (Angreifer) + ein Domänen-/Low-Priv-Account für authentifizierte Enum
- Tools: `netexec`, **Impacket** (GetNPUsers/GetUserSPNs/secretsdump/psexec), **BloodHound + SharpHound**, **Responder** + ntlmrelayx, `kerbrute`, **mimikatz** (auf Windows), `ldapdomaindump`
- **Snapshots** von DC + Clients

> Dieses Thema setzt ein Windows/AD-Lab voraus (siehe ROADMAP ⚠️). Ohne AD-Lab lassen sich die Übungen nur konzeptionell nachvollziehen.

Reihenfolge: starte bei `01-ad-basics-lab/`. Pro Übung erst die `.md` lösen, dann `solution.md`.
