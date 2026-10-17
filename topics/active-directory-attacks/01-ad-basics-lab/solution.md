# Lösung – Übung 01: AD-Grundlagen & Lab-Setup

## 1. DC + Client

- Windows Server → Server Manager → *Add Roles* → **Active Directory Domain Services** → zum DC hochstufen, neue Forest-Domäne **`lab.local`**.
- Client: Systemeigenschaften → Domäne beitreten `lab.local` (DNS des Clients = DC-IP!).

## 2. Test-User (Angriffsflächen)

```powershell
# Standard-User
New-ADUser -Name "Max Muster" -SamAccountName mmuster -AccountPassword (Read-Host -AsSecureString) -Enabled $true

# Service-Account mit SPN (Kerberoasting-Ziel, Übung 06)
New-ADUser -Name "svc_sql" -SamAccountName svc_sql -AccountPassword (Read-Host -AsSecureString) -Enabled $true
setspn -s MSSQLSvc/dc.lab.local:1433 svc_sql

# User ohne Kerberos-Preauth (AS-REP-Roasting-Ziel, Übung 05)
Set-ADAccountControl -Identity mmuster -DoesNotRequirePreAuth $true
```

## 3. Kerberos-Ablauf

1. Client → KDC/DC: **AS-REQ** → bekommt **TGT** (mit Passwort-abgeleitetem Schlüssel verschlüsselt).
2. Client → DC: **TGS-REQ** mit TGT für einen Dienst (SPN) → bekommt **TGS** (Service-Ticket).
3. Client → Dienst: TGS vorlegen → Zugriff. (Preauth schützt AS-REQ; SPN identifiziert den Dienst.)

## 4. Kerberos vs. NTLM

- **Kerberos:** Ticket-basiert, bevorzugt; Angriffe: **Kerberoasting** (TGS für SPN offline cracken), **AS-REP-Roasting** (ohne Preauth), Golden/Silver Ticket.
- **NTLM:** Challenge-Response, älterer Fallback; Angriffe: **Pass-the-Hash**, **NTLM-Relay**, LLMNR-Poisoning.

## 5. Lab-Doku

Hosts/IPs (DC, Client), Domäne `lab.local`, Accounts + deren Rolle (SPN/kein-Preauth) festhalten → Grundlage für Übung 02–10.

## Härtung (Kontext)

- NTLM einschränken/Kerberos erzwingen, keine unnötigen SPNs, Preauth überall an, starke Service-Account-Passwörter/gMSA.

## Häufige Fehler / Troubleshooting

- **Client findet Domäne nicht:** Client-DNS muss auf den **DC** zeigen.
- **`setspn`-Duplikat:** SPN muss eindeutig sein.
- **Kein Windows-Lab:** Thema konzeptionell durchgehen; die Angriffe brauchen ein echtes AD.
- **Snapshots:** vor den Angriffsübungen DC + Client sichern.
