# Lösung – Übung 06: SMB Deep Enumeration

`<ZIEL>` = Metasploitable-IP.

## 1. enum4linux-ng (All-in-one)

```bash
enum4linux-ng -A <ZIEL>
# klassisch:
enum4linux -a <ZIEL>
```
Sammelt automatisch:
- **OS/Workgroup** (`METASPLOITABLE`, `WORKGROUP`)
- **Users:** `root`, `msfadmin`, `user`, `postgres`, `service`, `games`, …
- **Groups:** lokale/Domänengruppen + Mitglieder
- **Shares:** `tmp (RW)`, `opt`, `IPC$`, `print$`
- **Password Policy:** Min-Länge, Lockout, Max-Age

## 2. Manuell mit rpcclient

```bash
rpcclient -U "" -N <ZIEL>
rpcclient $> enumdomusers
# user:[msfadmin] rid:[0x3e9]  (0x3e9 = 1001)
rpcclient $> queryuser 0x3e9          # Details zu einem User (per RID)
rpcclient $> getdompwinfo            # Passwort-Policy (min length etc.)
rpcclient $> enumdomgroups
```
`queryuser` zeigt Flags (z. B. „Password never expires"), letzter Login, Logon-Count. `getdompwinfo` liefert `min_password_length` und Complexity-Flags.

## 3. RID-Cycling

```bash
rpcclient $> lookupnames administrator      # Name -> SID (RID)
rpcclient $> lookupsids S-1-5-21-...-500    # SID -> Name
```
Oder automatisiert:
```bash
for rid in 500 501 1000 1001 1002 1003; do
  rpcclient -U "" -N <ZIEL> -c "queryuser $rid" 2>/dev/null | grep -i 'User Name'
done
```
- **RID 500** = Administrator/root-Äquivalent, **501** = Guest.
- RID-Cycling findet Konten auch dann, wenn `enumdomusers` leer/eingeschränkt ist – man rät einfach die RIDs durch.

## 4. Zugriff mit Credentials

Falls Credentials bekannt/schwach (z. B. `msfadmin:msfadmin` auf Metasploitable):
```bash
smbmap -H <ZIEL> -u msfadmin -p msfadmin
smbclient //<ZIEL>/tmp -U msfadmin%msfadmin
```
Mit Auth sieht man oft mehr Shares/Rechte als anonym.

## 5. Was steuert die Folgeangriffe

- **Userliste** → Zielkonten für Spraying/Brute-Force.
- **Password-Policy (Lockout!)** → bestimmt, ob Brute-Force (riskant bei niedrigem Lockout) oder **Password Spraying** (ein Passwort gegen viele User, umgeht Lockout) sinnvoll ist.
- **Flags** wie „password never expires"/Service-Accounts → lohnende Ziele.

## Härtung

- Anonyme Enumeration/Null Sessions verbieten (`restrict anonymous`, `map to guest = Never`).
- Starke **Passwort-Policy** + **Account Lockout** + **MFA**.
- Guest deaktivieren, Service-Accounts härten, SMBv1 aus.

## Häufige Fehler / Troubleshooting

- **`enum4linux-ng` fehlt:** `pipx install enum4linux-ng` oder aus GitHub; `enum4linux` ist in Kali vorhanden.
- **`NT_STATUS_ACCESS_DENIED`:** Ziel gehärtet → mit Creds testen; dokumentiere, dass anonyme Enum blockiert ist (= gut).
- **SMBv1-Fehler:** `--option='client min protocol=NT1'` bei smbclient.
- **RID-Cycling leer:** Domäne/SID falsch; zuerst `lookupnames administrator` für die Basis-SID.
