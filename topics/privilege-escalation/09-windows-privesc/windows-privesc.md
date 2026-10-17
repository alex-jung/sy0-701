# Übung 09 – Windows Privilege Escalation

**Schwierigkeit: 9/10 · Dauer: ca. 80 Min.**

## Lernziele

- Windows systematisch auf PrivEsc-Vektoren enumerieren (winPEAS)
- Service-Misconfigurations ausnutzen (unquoted path, schwache Service-Rechte, writable binary)
- AlwaysInstallElevated und Token-/Privilege-Abuse verstehen
- Windows-spezifische Härtung ableiten

## Theorie

Windows-PrivEsc zielt von einem normalen User auf **SYSTEM/Administrator**. Häufige Vektoren:

- **Unquoted Service Path:** Dienstpfad mit Leerzeichen ohne Anführungszeichen (`C:\Program Files\...`) → Windows sucht `C:\Program.exe` → du legst dort eine EXE ab, die als SYSTEM startet.
- **Schwache Service-Permissions:** du darfst einen (als SYSTEM laufenden) Dienst **rekonfigurieren** (`binPath`) oder sein **Binary überschreiben**.
- **AlwaysInstallElevated:** zwei Registry-Flags gesetzt → MSI-Pakete laufen als SYSTEM → eigenes MSI.
- **Token-/Privilege-Abuse:** `SeImpersonatePrivilege` (Service-Accounts) → „Potato"-Exploits (JuicyPotato/PrintSpoofer) → SYSTEM.
- **Unattended/Config-Creds**, gespeicherte Passwörter, DLL-Hijacking.

**winPEAS**/**PowerUp** automatisieren die Erkennung; **LOLBAS** ist das Windows-Pendant zu GTFOBins.

> ⚠️ Braucht eine Windows-Lab-VM. Ohne eine solche: konzeptionell durchspielen.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `winPEASx64.exe` | Auto-Enum (Services/Reg/Creds) |
| `PowerUp.ps1` | PrivEsc-Checks in PowerShell |
| `sc`/`accesschk.exe` | Service-Rechte prüfen |
| PrintSpoofer/JuicyPotato | Token-Abuse (SeImpersonate) |
| `msfvenom` | SYSTEM-Payload/MSI |

## Lab-Setup

- Windows-Lab-VM mit niedrig privilegiertem User + mindestens einer gesetzten Misconfiguration (unquoted service / schwache Service-Perms / AlwaysInstallElevated). Snapshot.

## Aufgabe (selbst lösen)

1. Führe **winPEAS** aus und sammle die gemeldeten PrivEsc-Vektoren.
2. Finde einen **Unquoted Service Path** (oder einen Dienst, dessen Binary/Config du überschreiben darfst) und eskaliere zu SYSTEM.
3. Prüfe **AlwaysInstallElevated** und – falls gesetzt – eskaliere per eigenem MSI.
4. Prüfe deine **Privileges** (`whoami /priv`): hast du `SeImpersonatePrivilege`? Skizziere/führe den Potato-Weg zu SYSTEM.
5. Nenne für jeden Vektor die Härtung.

**Ziel:** auf der Windows-VM von User zu SYSTEM eskaliert (mind. ein Vektor) und die Windows-PrivEsc-Landschaft verstanden.

## SY0-701 Prüfungsbezug

- **Windows privilege escalation**, Service-/Registry-Misconfigurations, Token/Privilege-Abuse.
- **Least privilege**, sichere Service-Konfiguration, Patch-Management, LOLBAS.
- **AppLocker/WDAC**, Entfernen gefährlicher Privilegien.
- Begriffe: *privilege escalation*, *unquoted service path*, *AlwaysInstallElevated*, *token impersonation*, *least privilege*.
