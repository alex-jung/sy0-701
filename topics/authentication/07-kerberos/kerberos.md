# Übung 07 – Kerberos (KDC, TGT, Tickets)

**Schwierigkeit: 7/10 · Dauer: ca. 85 Min.**

## Lernziele

- Kerberos-Ablauf verstehen (AS, TGS, TGT, Service-Ticket)
- Ein kleines MIT-Kerberos-Realm aufsetzen und `kinit` nutzen
- Den Bezug zu AD-Angriffen (Kerberoasting/AS-REP) herstellen

## Theorie

**Kerberos** ist ein ticketbasiertes SSO-Authentifizierungsprotokoll (Basis von Active Directory). Zentrale Instanz ist das **KDC (Key Distribution Center)** mit **AS (Authentication Server)** und **TGS (Ticket Granting Server)**:

1. **AS-REQ/AS-REP:** Client authentisiert sich (Pre-Auth, mit Passwort-abgeleitetem Schlüssel) und erhält ein **TGT (Ticket Granting Ticket)**, verschlüsselt mit dem Schlüssel des `krbtgt`-Kontos.
2. **TGS-REQ/TGS-REP:** Mit dem TGT fordert der Client ein **Service-Ticket** für einen bestimmten Dienst (SPN) an.
3. **AP-REQ:** Der Client legt das Service-Ticket beim Dienst vor; der Dienst entschlüsselt es mit **seinem** Schlüssel → Zugriff ohne erneute Passworteingabe (SSO).

Das Passwort wandert nie zum Dienst; Zeitstempel erschweren Replays → **Zeitsynchronität (NTP) ist kritisch**. Angriffe (siehe `active-directory-attacks`): **AS-REP Roasting** (Konten ohne Pre-Auth), **Kerberoasting** (Service-Tickets offline cracken), **Pass-the-Ticket**, **Golden Ticket** (gefälschtes TGT mit `krbtgt`-Hash).

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `krb5-kdc`/`krb5-admin-server` | KDC im Lab |
| `kinit`/`klist`/`kdestroy` | Ticket holen/anzeigen/löschen |
| `kadmin.local` | Principals verwalten |

## Lab-Setup

- Eine Linux-VM als KDC (`krb5-kdc`, `krb5-admin-server`), Realm z. B. `LAB.LOCAL`; ein Client mit `krb5-user`. (Alternativ: AD-DC aus `active-directory-attacks`.)

## Aufgabe (selbst lösen)

1. Richte ein MIT-Kerberos-Realm `LAB.LOCAL` ein, lege einen User-Principal und einen Service-Principal an.
2. Hole mit `kinit` ein **TGT** und zeige es mit `klist` (Flags, Lifetime, `krbtgt`-Service).
3. Erkläre anhand deiner Tickets den Fluss AS-REP → TGS-REP → Service-Ticket.
4. Beschreibe konkret, wie **Kerberoasting** und **AS-REP Roasting** ansetzen und welche Abwehr greift (starke Service-Passwörter/gMSA, Pre-Auth erzwingen, AES statt RC4).

**Ziel:** ein funktionierendes Kerberos-Realm, ein geholtes TGT (klist) + Verständnis des Ticketflusses und der AD-Angriffsbezüge.

## SY0-701 Prüfungsbezug

- **1.0** Kerberos, SSO, ticket-based auth, KDC/TGT; mutual authentication.
- **2.0** Kerberoasting, AS-REP roasting, pass-the-ticket, golden ticket (Querbezug AD).
- Begriffe: *KDC/AS/TGS*, *TGT*, *service ticket*, *SPN*, *krbtgt*, *pre-authentication*, *replay/timestamp*.
