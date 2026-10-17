# BloodHound / SharpHound

**Kategorie:** AD-Angriffspfad-Analyse (Graph)

Modelliert Active Directory als **Graph** (Knoten: User/Computer/Gruppen; Kanten: `MemberOf`, `AdminTo`, `HasSession`, `GenericAll`, `DCSync` …) und findet nicht offensichtliche **Angriffspfade** zu Domain Admin. **SharpHound** ist der Collector, **BloodHound** die GUI (Neo4j).

## Collector

```bash
# von Kali:
bloodhound-python -u <user> -p '<pw>' -d lab.local -ns <DC> -c all -o bh_
# auf Windows:
.\SharpHound.exe -c All -d lab.local
```

## GUI / Analyse

```bash
sudo neo4j start
bloodhound                 # Daten (JSON/ZIP) hochladen
```
Wichtige Queries: **„Find Shortest Paths to Domain Admins"**, „Find Principals with DCSync Rights", „Kerberoastable Users", „AS-REP Roastable Users".

## Gefährliche Kanten

`GenericAll` / `GenericWrite` / `WriteDacl` / `WriteOwner` (Objektübernahme), `DCSync`, `AdminTo`, `HasSession` (Lateral Movement).

## Hinweis

Auch defensiv: regelmäßig selbst auditieren → Pfade vor dem Angreifer kappen (Tiering, ACL-Hygiene, least privilege). Collector-/GUI-Version müssen zusammenpassen (BloodHound CE vs. Legacy). Neo4j-Default `neo4j/neo4j` initial ändern. Nur eigenes AD-Lab.

## Verwendet in

active-directory-attacks 03, 10.
