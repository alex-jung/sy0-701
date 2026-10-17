# Übung 05 – AS-REP Roasting

**Schwierigkeit: 5/10 · Dauer: ca. 45 Min.**

## Lernziele

- AS-REP Roasting verstehen (Accounts ohne Kerberos-Preauth)
- Angreifbare Accounts finden und den AS-REP-Hash extrahieren
- Den Hash offline cracken (hashcat 18200)
- Die Gegenmaßnahme (Preauth erzwingen) kennen

## Theorie

Normalerweise schützt die **Kerberos-Preauthentication** die AS-REQ: der Client muss zuerst beweisen, dass er das Passwort kennt. Ist für einen Account **„Do not require Kerberos preauthentication"** gesetzt, liefert der DC die **AS-REP** (teilweise mit dem Passwort-Schlüssel des Users verschlüsselt) **ohne Vorbedingung** → jeder kann sie anfordern und den enthaltenen Teil **offline cracken** = **AS-REP Roasting**. Man braucht dafür **keine** gültigen Credentials, nur den/die betroffenen Usernamen.

Hashcat-Mode **18200**.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Impacket `GetNPUsers.py` | AS-REP-Hashes anfordern |
| `netexec` | angreifbare Accounts finden (`--asreproast`) |
| `hashcat -m 18200` | Hash cracken |

## Lab-Setup

- Test-AD mit einem User **ohne Preauth** (Übung 01). Userliste. `rockyou.txt`.

## Aufgabe (selbst lösen)

1. Finde die Accounts **ohne Preauth** (LDAP-Query/netexec/GetNPUsers mit Userliste).
2. Fordere die **AS-REP** für einen solchen Account an und extrahiere den Hash.
3. Cracke den Hash offline mit **hashcat -m 18200** + rockyou.
4. Prüfe das gefundene Passwort (z. B. netexec).
5. Erkläre, warum das **ohne** gültige Credentials möglich ist und wie man es verhindert.

**Ziel:** einen AS-REP-Hash eines Preauth-losen Accounts erbeutet und offline geknackt.

## SY0-701 Prüfungsbezug

- **AS-REP Roasting** als Kerberos-Angriff; **Preauthentication** als Schutz.
- **Offline-Cracking** → starke Passwörter wichtig.
- **Härtung:** Preauth überall erzwingen, starke/zufällige Passwörter, Monitoring (Event 4768).
- Begriffe: *AS-REP roasting*, *Kerberos pre-authentication*, *offline cracking*, *hashcat 18200*.
