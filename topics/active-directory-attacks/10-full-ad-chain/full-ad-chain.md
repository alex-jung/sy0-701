# Übung 10 – Vollständige AD-Attack-Chain + Defense-Report

**Schwierigkeit: 10/10 · Dauer: ca. 3 Std.**

## Lernziele

- Alle AD-Techniken zu einer Kette „kein Zugang → Domain Admin" verbinden
- Die Kette entlang MITRE ATT&CK dokumentieren
- Erkennung (Event-IDs) je Schritt benennen
- Einen AD-Pentest-/Hardening-Report erstellen

## Theorie

Eine typische AD-Kompromittierung:
1. **Kein/Low-Priv-Zugang:** User-Enum + **Spraying** (04) oder **AS-REP Roasting** (05) → erste Credentials.
2. **Enumeration + BloodHound** (02/03) → Angriffspfade.
3. **Kerberoasting** (06) → privilegierte Service-Accounts.
4. **LLMNR/Relay** (07) → weitere Hashes/Zugriff.
5. **Credential Dumping + PtH** (08) → Lateral Movement bis Tier-0.
6. **DCSync / Golden Ticket** (09) → **Domain Dominance**.
7. **Report:** Kette + Erkennung + Härtung.

Realistisch ist das selten linear – BloodHound zeigt den kürzesten Weg. `ad-defense-report-template.md` ist das Gerüst.

## Verwendete Tools

Kombination aus Übung 01–09: netexec, Impacket (GetNPUsers/GetUserSPNs/secretsdump/psexec/ticketer), BloodHound, Responder/ntlmrelayx, kerbrute, mimikatz + `ad-defense-report-template.md`.

## Lab-Setup

- Vollständiges Test-AD (DC + Client(s), Test-User mit SPN/kein Preauth, ein paar ACL-Pfade, ein DA-Login auf einem Host). Snapshots.

## Aufgabe (selbst lösen)

Starte **ohne** Credentials (nur Netzzugang) und arbeite dich zu Domain Admin vor.

1. **Einstieg:** User-Enum + Spraying oder AS-REP Roasting → erste gültige Credentials.
2. **Mapping:** Enumeration + BloodHound → Angriffspfad bestimmen.
3. **Eskalation:** Kerberoasting / Relay / Credential Dumping + PtH entlang des Pfads.
4. **Domain Dominance:** DCSync (krbtgt/DA) → optional Golden Ticket.
5. **Report:** fülle `ad-defense-report-template.md` – Kette je Schritt (Befehl + Nachweis), **MITRE-ATT&CK + Event-IDs**, priorisierte Härtung.

**Ziel:** eine durchgängige, dokumentierte AD-Kette von „kein Zugang" bis Domain Admin, mit Erkennungs- und Härtungsempfehlungen.

## SY0-701 Prüfungsbezug

- **AD-Angriffskette / Kerberos-Angriffe / Lateral Movement / Domain Dominance** (2.0).
- **Detection:** Event-IDs (4625/4768/4769/4662), SIEM; **Hardening:** Tiering, LAPS, Credential Guard, MFA, gMSA, LLMNR aus, SMB-Signing.
- Begriffe: *AD attack chain*, *MITRE ATT&CK*, *tiering*, *LAPS*, *Credential Guard*, *domain dominance*.
