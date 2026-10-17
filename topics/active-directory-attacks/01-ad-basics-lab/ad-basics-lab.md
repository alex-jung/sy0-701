# Übung 01 – AD-Grundlagen & Lab-Setup

**Schwierigkeit: 1/10 · Dauer: ca. 90 Min. (inkl. Setup)**

## Lernziele

- Active-Directory-Grundbegriffe verstehen (Domain, OU, DC, GPO)
- Die Authentifizierung einordnen: Kerberos vs. NTLM
- Ein Test-AD aufsetzen (DC + Client + Test-User)
- Die späteren Angriffsflächen (SPN, Preauth) bewusst anlegen

## Theorie

**Active Directory (AD)** ist Microsofts Verzeichnis-/Identitätsdienst. Kernbegriffe:
- **Domain/Forest**, **Domain Controller (DC)**, **OU** (Organizational Unit), **GPO** (Group Policy), **Objekte** (User, Computer, Groups), **SID/RID**.
- **LDAP** (389/636) für Verzeichnisabfragen, **Kerberos** (88) + **NTLM** für Authentifizierung, **SMB** (445), **DNS** (53, AD-integriert).

**Kerberos** (bevorzugt): Client holt vom KDC/DC ein **TGT**, damit **Service-Tickets (TGS)** für Dienste. **SPN** (Service Principal Name) identifiziert einen Dienst/Account → Angriffsfläche (Kerberoasting). Accounts **ohne Kerberos-Preauth** sind AS-REP-roastbar. **NTLM** ist der ältere Fallback (Pass-the-Hash, Relay).

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Windows Server | DC (`dcpromo`/Server Manager → ADDS) |
| `Set-ADUser`/GUI | Test-User + SPN/Preauth konfigurieren |
| `netexec`/`ldapsearch` | spätere Enum |

## Lab-Setup

- **DC:** Windows Server, Rolle *Active Directory Domain Services*, Domäne `lab.local`.
- **Client:** Windows 10/11 oder Server, der Domäne beigetreten.
- **Test-User:** normaler User, ein **Service-Account mit SPN** (für Übung 06), ein User mit **„Kerberos-Preauth deaktiviert"** (für Übung 05).
- Kali im selben Lab-Netz.

## Aufgabe (selbst lösen)

1. Richte den DC ein (Domäne `lab.local`) und tritt einen Client bei.
2. Lege Test-User an: einen Standard-User, einen **Service-Account mit SPN**, einen User mit **deaktivierter Kerberos-Preauth**.
3. Erkläre den Kerberos-Ablauf (TGT → TGS) in eigenen Worten.
4. Grenze **Kerberos vs. NTLM** ab und nenne je einen zugehörigen Angriff.
5. Dokumentiere dein Lab (Hosts, IPs, Accounts) als Grundlage für die folgenden Übungen.

**Ziel:** ein funktionierendes Test-AD mit bewusst gesetzten Angriffsflächen (SPN, kein Preauth) + Verständnis der AD-Authentifizierung.

## SY0-701 Prüfungsbezug

- **Directory services / Active Directory**, **Kerberos vs. NTLM**, SPN, TGT/TGS.
- **Authentifizierungs-Grundlagen** (1.0); AD als zentrale Identitätsquelle.
- Begriffe: *Active Directory*, *domain controller*, *Kerberos (TGT/TGS)*, *NTLM*, *SPN*, *LDAP*.
