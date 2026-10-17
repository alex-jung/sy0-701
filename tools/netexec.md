# netexec (nxc) / crackmapexec (cme)

**Kategorie:** Netzwerk-Credential-Angriffe (SMB/WinRM/…)

Swiss-Army-Knife für Credential-Angriffe über viele Protokolle (SMB, WinRM, LDAP, MSSQL, SSH, RDP …). Testet Credentials/Hashes **flächendeckend** gegen Hosts, macht **Pass-the-Hash**, Command Execution, Enumeration. **`netexec` (nxc)** ist der aktive Nachfolger von **crackmapexec (cme)**.

```bash
netexec <protokoll> <ziel> -u <user> (-p <pass> | -H <NThash>) [Optionen]
```

## Wichtigste Optionen

| Option | Bedeutung |
|--------|-----------|
| `<protokoll>` | `smb`, `winrm`, `ldap`, `mssql`, `ssh`, `rdp` … |
| `-u` / `-p` | User / Passwort (Listen möglich) |
| `-H <hash>` | NT-Hash → **Pass-the-Hash** |
| `--local-auth` | lokaler Account statt Domäne |
| `-x '<cmd>'` / `-X` | Befehl ausführen (cmd / PowerShell) |
| `--shares`, `--users`, `--sam`, `--lsa` | Enumeration / Credential-Dump |

## Beispiele

```bash
netexec smb 192.168.56.0/24 -u Administrator -H <NT> --local-auth     # PtH-Sweep
netexec smb <ZIEL> -u admin -p 'Pass123' --shares
netexec smb <ZIEL> -u Administrator -H <NT> --local-auth -x "whoami"
```
`(Pwn3d!)` in der Ausgabe = administrativer Zugriff.

## Hinweis

Sehr laut, PtH/Spraying → nur eigenes Windows-/SMB-Lab. `crackmapexec` ist veraltet → `netexec` nutzen.

## Verwendet in

password-attacks 09 (Pass-the-Hash), 10.
