# Übung 03 – BloodHound / SharpHound (Attack Paths)

**Schwierigkeit: 3/10 · Dauer: ca. 60 Min.**

## Lernziele

- BloodHound verstehen: AD-Beziehungen als Graph
- Mit SharpHound/bloodhound-python Daten sammeln
- Angriffspfade zu Domain Admin finden (Shortest Path Queries)
- ACL-/Gruppen-Misconfigurations erkennen

## Theorie

**BloodHound** modelliert AD als **Graph**: Knoten (User, Computer, Gruppen) + Kanten (Beziehungen wie `MemberOf`, `AdminTo`, `HasSession`, `GenericAll`, `WriteDacl`). So werden **nicht offensichtliche Angriffspfade** sichtbar – z. B. „User A → Gruppe → ACL auf User B → der ist DA-fähig". Die berühmte Query **„Shortest Path to Domain Admins"** zeigt die kürzeste Eskalationskette.

Daten sammelt ein **Collector**: **SharpHound** (auf Windows) oder **bloodhound-python** (von Kali, mit Credentials). Danach lädt man das JSON/ZIP in die BloodHound-GUI (Neo4j).

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `bloodhound-python` | Collector von Linux (`-c all`) |
| SharpHound (`.exe`/`.ps1`) | Collector auf Windows |
| BloodHound GUI + Neo4j | Graph/Queries |

## Lab-Setup

- Test-AD + Low-Priv-Credentials. BloodHound (CE/Legacy) + Neo4j auf Kali. Für realistische Pfade ein paar ACL-/Gruppen-Beziehungen setzen.

## Aufgabe (selbst lösen)

1. Sammle die AD-Daten mit **bloodhound-python** (`-c all`) oder SharpHound.
2. Importiere sie in die BloodHound-GUI.
3. Führe **„Find Shortest Paths to Domain Admins"** aus – welche Kette ergibt sich?
4. Finde mindestens eine **gefährliche ACL-/Gruppen-Kante** (z. B. `GenericAll`, `WriteDacl`, `DCSync`-Rechte).
5. Erkläre, wie du den gefundenen Pfad (konzeptionell) ausnutzen würdest und wie man ihn kappt.

**Ziel:** einen konkreten Angriffspfad zu Domain Admin im Graph identifiziert + die zugrundeliegende Misconfiguration benannt.

## SY0-701 Prüfungsbezug

- **Attack path mapping / lateral movement** in AD; ACL-/Gruppen-Misconfigurations.
- **least privilege / tiering** als Gegenmaßnahme (Pfade kappen).
- Begriffe: *attack path*, *privilege escalation*, *ACL abuse (GenericAll/WriteDacl)*, *lateral movement*, *tiering*.
