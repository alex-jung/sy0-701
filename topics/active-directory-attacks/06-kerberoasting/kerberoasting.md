# Übung 06 – Kerberoasting

**Schwierigkeit: 6/10 · Dauer: ca. 50 Min.**

## Lernziele

- Kerberoasting verstehen (Service-Tickets für SPN-Accounts cracken)
- TGS-Hashes für SPN-Accounts anfordern und extrahieren
- Offline cracken (hashcat 13100)
- Warum Service-Accounts besonders gefährdet sind + Härtung

## Theorie

Jeder authentifizierte Domänen-User darf für einen **SPN** ein **Service-Ticket (TGS)** anfordern. Das TGS ist mit dem **Passwort-Hash des Service-Accounts** (NTLM) verschlüsselt → man kann es offline angreifen und das **Service-Account-Passwort** cracken = **Kerberoasting**. Da Service-Accounts oft **schwache, selten geänderte** Passwörter und **hohe Rechte** haben, ist das ein Top-Weg zur Eskalation.

Voraussetzung: **ein** gültiger (auch Low-Priv-)Domänen-Account. Hashcat-Mode **13100**.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Impacket `GetUserSPNs.py` | TGS für SPN-Accounts anfordern (`-request`) |
| `netexec` | `--kerberoasting` |
| `hashcat -m 13100` | TGS cracken |

## Lab-Setup

- Test-AD mit einem Service-Account mit SPN (Übung 01, z. B. `svc_sql`). Low-Priv-Creds. `rockyou.txt`.

## Aufgabe (selbst lösen)

1. Liste mit `GetUserSPNs.py` alle **SPN-Accounts** der Domäne (mit Low-Priv-Creds).
2. Fordere die **TGS-Hashes** an (`-request`) und speichere sie.
3. Cracke einen TGS-Hash offline mit **hashcat -m 13100**.
4. Prüfe die Rechte des gecrackten Service-Accounts (ist er privilegiert?).
5. Erkläre, warum Service-Accounts so lohnend sind und wie man Kerberoasting erschwert.

**Ziel:** das Passwort eines SPN-Service-Accounts per Kerberoasting erbeutet und seine Rechte bewertet.

## SY0-701 Prüfungsbezug

- **Kerberoasting** als Kerberos-Angriff; SPN/TGS.
- **Service-Account-Hygiene**: lange/zufällige Passwörter, **gMSA** (automatisch rotiert).
- **Detection:** ungewöhnlich viele TGS-Requests (Event 4769).
- Begriffe: *Kerberoasting*, *SPN*, *TGS/service ticket*, *gMSA*, *hashcat 13100*.
