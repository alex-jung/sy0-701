# Übung 09 – DCSync & Domain Dominance (Golden/Silver Ticket)

**Schwierigkeit: 9/10 · Dauer: ca. 75 Min.**

## Lernziele

- DCSync verstehen (Replikation missbrauchen, um alle Hashes zu ziehen)
- Den krbtgt-Hash erbeuten und ein Golden Ticket einordnen
- Silver Ticket (dienstspezifisch) abgrenzen
- Persistence/Domain-Dominance-Risiken und Abwehr kennen

## Theorie

Mit ausreichenden Rechten (Domain Admin oder `GetChanges/GetChangesAll`-ACL) kann ein Angreifer **DCSync**: er gibt sich als DC aus und fordert per **DRSUAPI-Replikation** die Passwort-Hashes **beliebiger** Accounts an – inklusive **krbtgt**.

- **krbtgt-Hash** = Schlüssel, mit dem alle TGTs signiert werden. Wer ihn hat, kann **Golden Tickets** fälschen: beliebige TGTs für beliebige Identitäten (inkl. erfundenem DA) → **vollständige Domänenkontrolle** und **Persistence** (gilt bis krbtgt **zweimal** zurückgesetzt wird).
- **Silver Ticket:** gefälschtes **TGS** für **einen** Dienst (mit dessen Service-Account-Hash) → leiser, begrenzt auf den Dienst.

Das ist die **Spitze** der AD-Angriffskette (Domain Dominance).

> ⚠️ Nur im eigenen Lab; krbtgt-Manipulation ist invasiv → Snapshots.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Impacket `secretsdump.py` | DCSync (`-just-dc`, `-just-dc-user krbtgt`) |
| mimikatz `lsadump::dcsync` | DCSync auf Windows |
| mimikatz `kerberos::golden` / Impacket `ticketer.py` | Golden/Silver Ticket |

## Lab-Setup

- Domain-Admin-Credential/-Hash (aus Übung 08) **oder** ein Account mit DCSync-Rechten (aus BloodHound). DC. Snapshots.

## Aufgabe (selbst lösen)

1. Führe **DCSync** aus und ziehe die Hashes – gezielt den **krbtgt**-Hash + die Domänen-Admins.
2. Erkläre, wofür der **krbtgt**-Hash ausreicht (Golden Ticket) und warum das Persistence bedeutet.
3. Skizziere/erzeuge (Lab) ein **Golden Ticket** und grenze es vom **Silver Ticket** ab.
4. Zeige, wie man mit dem Ticket auf Ressourcen zugreift (konzeptionell/Lab).
5. Erkläre Erkennung + Abwehr (krbtgt-Reset, DCSync-Monitoring, Tier-0-Schutz).

**Ziel:** per DCSync den krbtgt-/DA-Hash erbeutet und Domain Dominance (Golden Ticket) verstanden/demonstriert.

## SY0-701 Prüfungsbezug

- **DCSync**, **Golden/Silver Ticket**, **krbtgt**, Domain Dominance/Persistence.
- **Mitigation:** DCSync-Rechte strikt (nur DCs), **krbtgt-Passwort-Reset (2×)**, Tier-0-Schutz, Monitoring (Event 4662/Replikation von Nicht-DCs), AES.
- Begriffe: *DCSync*, *golden/silver ticket*, *krbtgt*, *domain dominance*, *persistence*, *tier 0*.
