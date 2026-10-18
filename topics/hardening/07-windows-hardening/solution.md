# Lösung – Übung 07: Windows-Hardening

> Snapshot vorher. Ohne Windows-Lab: Maßnahmen konzeptionell + Nachweis-Idee.

## 1. SMBv1 aus + Signing

```powershell
Disable-WindowsOptionalFeature -Online -FeatureName SMB1Protocol
Set-SmbServerConfiguration -EnableSMB1Protocol $false
Set-SmbServerConfiguration -RequireSecuritySignature $true
Get-SmbServerConfiguration | select EnableSMB1Protocol,RequireSecuritySignature
```

## 2. LLMNR/NBT-NS deaktivieren

- **GPO:** Computer Config → Admin Templates → Network → DNS Client → *Turn off multicast name resolution = Enabled*.
- **NBT-NS:** pro Adapter „NetBIOS over TCP/IP deaktivieren" (bzw. Registry/DHCP-Option).
Test: **Responder** auf Kali läuft → kein NetNTLM-Hash mehr vom gehärteten Host (vgl. `ad-attacks` 07).

## 3. Credential Guard / LSA Protection

- **Credential Guard:** per GPO „Turn On Virtualization Based Security" + Credential Guard (benötigt VBS/UEFI).
- **RunAsPPL:** `HKLM\SYSTEM\CurrentControlSet\Control\Lsa\RunAsPPL = 1`.
Test: `mimikatz sekurlsa::logonpasswords` → **scheitert**/keine Klartext-Creds (vgl. `ad-attacks` 08).

## 4. Least Privilege

- User aus lokaler **Administratoren**-Gruppe entfernen (Standard-User), **UAC** auf Standard/hoch.
- Domäne: **LAPS** (eindeutige, rotierende lokale Admin-PW) → ein Hash gilt nicht überall (stoppt PtH-Reuse).

## 5. Baseline + Makros

- **Microsoft Security Baseline** (SCT/LGPO) oder CIS-GPOs importieren (Teilmenge).
- **Makros aus Internet blockieren:** GPO „Block macros from running in Office files from the Internet"; **ASR-Regeln** in Defender aktivieren.

## Nachweis

Vorher/Nachher: Responder (kein Hash), mimikatz (kein Dump), `nmap --script smb-protocols` (kein SMBv1), Makro-Testdokument wird blockiert.

## Häufige Fehler / Troubleshooting

- **Credential Guard-Voraussetzungen fehlen:** VBS/UEFI/Secure Boot nötig; ältere Hardware/VM ggf. nicht.
- **SMBv1-Abschaltung bricht Altgeräte:** Abhängigkeiten prüfen (alte NAS/Drucker).
- **GPO greift nicht:** `gpupdate /force`, richtige OU/Verknüpfung.
- **Kein Windows-Lab:** konzeptionell dokumentieren; Nachweise beschreiben.
