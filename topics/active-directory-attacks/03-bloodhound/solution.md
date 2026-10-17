# Lösung – Übung 03: BloodHound / SharpHound

`<DC>` = DC-IP/Hostname, Domäne `lab.local`.

## 1. Daten sammeln

**Von Kali (bloodhound-python):**
```bash
bloodhound-python -u mmuster -p 'Passwort' -d lab.local -ns <DC> -c all -o bh_
# erzeugt *.json (users/groups/computers/...)
```
**Auf Windows (SharpHound):**
```powershell
.\SharpHound.exe -c All -d lab.local
# bzw. Import-Module Sharphound.ps1; Invoke-BloodHound -CollectionMethod All
```

## 2. Import

```bash
# Neo4j starten + BloodHound-GUI:
sudo neo4j start
bloodhound        # GUI -> Login -> Upload Data (JSON/ZIP)
```
(BloodHound CE nutzt Docker-Compose + bloodhound-cli; Legacy nutzt die GUI direkt.)

## 3. Shortest Path to Domain Admins

In der GUI: *Analysis → Pre-Built Queries → „Find Shortest Paths to Domain Admins"*. Der Graph zeigt z. B.:
```
mmuster -MemberOf-> IT-Support -GenericAll-> svc_admin -MemberOf-> Domain Admins
```

## 4. Gefährliche Kante

Kanten wie:
- **GenericAll / GenericWrite / WriteDacl / WriteOwner** auf ein Objekt → man kann es übernehmen (Passwort setzen, zur Gruppe hinzufügen).
- **DCSync** (GetChanges/GetChangesAll) → Übung 09.
- **AdminTo / HasSession** → Lateral Movement.

## 5. Ausnutzung (konzeptionell) + Fix

Beispiel `GenericAll` auf einen User: Passwort über RPC/LDAP neu setzen → als dieser User weiter. `WriteDacl` auf eine Gruppe: sich selbst hinzufügen. **Fix:** überflüssige ACLs entfernen, **Tiering** (Admin-Accounts getrennt), least privilege, Gruppenhygiene → der Pfad bricht.

## Härtung

- Regelmäßig **selbst** mit BloodHound auditieren → Pfade vor dem Angreifer kappen.
- Tiering/PAW, ACL-Reviews, keine Schatten-Admin-Rechte.

## Häufige Fehler / Troubleshooting

- **Neo4j-Login:** Default `neo4j/neo4j`, muss initial geändert werden.
- **bloodhound-python Clock-Skew/DNS:** Zeit sync, `-ns <DC>` als DNS.
- **Collector-Version ≠ GUI-Version:** kompatible SharpHound-/BloodHound-Versionen nutzen (CE vs. Legacy).
- **Keine Pfade:** frisches Lab ohne Misconfigs → ein paar ACL-/Gruppen-Beziehungen setzen, um Pfade zu erzeugen.
