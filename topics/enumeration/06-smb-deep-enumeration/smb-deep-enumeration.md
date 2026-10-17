# Übung 06 – SMB Deep Enumeration (User, Gruppen, Policies)

**Schwierigkeit: 6/10 · Dauer: ca. 60 Min.**

## Lernziele

- SMB/Samba systematisch tief enumerieren: User, Gruppen, RIDs, Passwort-Policy
- `enum4linux(-ng)` als All-in-one verstehen *und* die Einzelschritte mit `rpcclient` manuell nachvollziehen
- RID-Cycling als Technik begreifen
- Aus der Enumeration verwertbare Angriffsziele (Userliste, Policy) ableiten

## Theorie

Aufbauend auf der Null Session (Übung 02/05) holt man hier **alles** heraus:

- **Benutzer & RIDs:** Jedes Konto hat eine **RID** (Relative Identifier). Über **RID-Cycling** (`lookupsids` für RID 500, 501, 1000, 1001 …) lassen sich Namen auch dann aufzählen, wenn `enumdomusers` eingeschränkt ist. RID **500** = Administrator, **501** = Guest.
- **Gruppen & Mitglieder:** lokale/Domänengruppen und wer drin ist.
- **Passwort-Policy:** Mindestlänge, Lockout, Max-Age → entscheidend für realistische Brute-Force-/Spraying-Strategie.
- **Shares + Zugriff mit Creds:** mit gefundenen Credentials erneut Shares prüfen.

`enum4linux-ng` automatisiert das; `rpcclient` zeigt, *wie* es unter der Haube funktioniert.

## Verwendete Tools

| Tool | Zweck | Wichtige Optionen |
|------|-------|-------------------|
| `enum4linux-ng` | SMB-Komplett-Enum | `-A <ziel>` (all), `-u/-p` (mit Creds) |
| `enum4linux` | klassische Variante | `-a <ziel>` |
| `rpcclient` | manuelle RPC-Abfragen | `enumdomusers`, `queryuser <rid>`, `lookupnames`, `lookupsids`, `getdompwinfo` |
| `nmap` NSE | Ergänzung | `--script smb-enum-users,smb-enum-groups,smb-enum-shares` |

## Lab-Setup

- Metasploitable (Samba). `enum4linux-ng` ggf. per `pip`/GitHub oder Kali-Paket.

## Aufgabe (selbst lösen)

1. Führe mit `enum4linux-ng -A` eine Komplett-Enumeration durch. Sammle: **Benutzerliste**, **Gruppen**, **Passwort-Policy**, **Shares**, **OS/Workgroup**.
2. Reproduziere **manuell mit `rpcclient`**: `enumdomusers`, dann für einen User `queryuser`; lies die **Passwort-Policy** mit `getdompwinfo`.
3. Betreibe **RID-Cycling**: ermittle über `lookupnames`/`lookupsids` die RIDs und löse weitere Konten auf (prüfe RID 500/501).
4. Prüfe mit einem gefundenen Benutzer (falls Credentials bekannt/erratbar) erneut die Share-Zugriffe.
5. Fasse zusammen: Welche dieser Infos steuern eine spätere Brute-Force-/Spraying-Kampagne?

**Ziel:** eine vollständige User-/Gruppen-/Policy-Übersicht des SMB-Ziels – automatisiert und manuell nachvollzogen.

## SY0-701 Prüfungsbezug

- **Account enumeration / RID cycling** als Technik; **password policy** als Verteidigungs- und Angriffsfaktor.
- **least privilege / hardening:** anonyme Enumeration unterbinden, Policy stärken (Länge, Lockout), MFA.
- **Attack chain:** Enumeration → Password Spraying → Credential Access.
- Begriffe: *RID/SID*, *password policy (lockout, complexity)*, *account enumeration*, *password spraying*, *null session*.
