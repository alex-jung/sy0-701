# Übung 04 – Lab-Controls inventarisieren & klassifizieren

**Schwierigkeit: 4/10 · Dauer: ca. 70 Min.**

## Lernziele

- Die tatsächlich vorhandenen Controls im eigenen Lab systematisch erfassen
- Jede Control zweidimensional (Kategorie × Typ) klassifizieren
- Eine wiederverwendbare Control-Inventar-Tabelle aufbauen

## Theorie

Man kann Controls nur bewerten/auditieren, wenn man sie **kennt**. Ein **Control-Inventar** ist die Grundlage für Gap-Analyse (Übung 05), Threat-Mapping (07) und Assessment (10). Pro Control erfasst man: Name, **was** sie schützt (Asset/Risiko), **Kategorie** (technical/managerial/operational/physical), **Typ** (preventive/detective/…), Umsetzungsstatus, Owner und wo/wie sie implementiert ist.

Das verbindet alle bisherigen Themen: Firewall (`firewall-opnsense`), IDS/IPS (`ids-ips`), SIEM (`logging-siem`), Hardening (`hardening`), MFA/Auth (`authentication`), VPN (`vpn-tunneling`), Krypto/PKI usw. – jetzt als **Portfolio** betrachtet.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Tabelle/CSV | Control-Inventar |
| `lynis`/`nmap` (optional) | vorhandene technische Controls verifizieren |

## Lab-Setup

- Dein gesamtes Lab (alle bisher gebauten Themen) als Inventar-Objekt.

## Aufgabe (selbst lösen)

1. Erstelle ein **Control-Inventar** (Tabelle) mit mind. **15** Controls aus deinem Lab.
2. Klassifiziere jede Control **zweidimensional** (Kategorie **und** Typ) und notiere Asset/Risiko, Status, Owner.
3. Verifiziere **stichprobenartig** drei technische Controls, dass sie wirklich aktiv sind (z. B. Firewall-Regel vorhanden, IDS läuft, Lynis-Härtung).
4. Bilde eine **Verteilung**: Wie viele Controls je Kategorie/Typ? Wo häufen sie sich, wo fehlen sie (erste Lücken-Indizien)?

**Ziel:** ein vollständiges, klassifiziertes Control-Inventar deines Labs als Basis für die folgenden Übungen.

## SY0-701 Prüfungsbezug

- **1.0/5.0** control inventory, asset-control mapping, categories/types in der Praxis.
- Begriffe: *control inventory*, *asset owner*, *implementation status*, *category/type*.
