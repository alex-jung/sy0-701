# kerbrute

**Kategorie:** AD – Kerberos User-Enum & Password Spraying

Nutzt Kerberos-**AS-REQ**, um gültige Domänen-User zu enumerieren und Passwort-Spraying durchzuführen – **ohne** klassische Fehllogins (4625) zu erzeugen, also leiser und lockout-schonender bei der Enum.

```bash
kerbrute <command> -d <domain> --dc <DC> [Argumente]
```

## Kommandos

| Kommando | Zweck |
|----------|-------|
| `userenum <userliste>` | gültige Usernamen finden (leise) |
| `passwordspray <userliste> <pw>` | ein PW gegen viele User |
| `bruteuser <passliste> <user>` | viele PW gegen einen User (Lockout-Gefahr!) |
| `bruteforce` | User:Pass-Kombiliste |

## Beispiele

```bash
kerbrute userenum -d lab.local --dc <DC> users.txt
kerbrute passwordspray -d lab.local --dc <DC> valid_users.txt 'Frühling2024!'
```

## Hinweis

User-Enum erzeugt **keine** fehlgeschlagenen Logons → gut für leise Erkundung. **Spraying** dennoch lockout-bewusst (Policy aus der Enum beachten). Clock-Skew vermeiden (Zeit zu DC sync). Detection: Event **4768** (Kerberos preauth). Release-Binary (GitHub). Nur eigenes AD-Lab.

## Verwendet in

active-directory-attacks 04 (Spraying/User-Enum), 10.
