# Übung 02 – Control-Kategorien (technical/managerial/…)

**Schwierigkeit: 2/10 · Dauer: ca. 45 Min.**

## Lernziele

- Die vier Control-**Kategorien** der SY0-701 unterscheiden
- Kategorie (wer/wie umgesetzt) von Typ (welche Wirkung) trennen
- Controls zweidimensional einordnen (Kategorie × Typ)

## Theorie

Neben dem **Typ** (Wirkung) gibt es die **Kategorie** (Art der Umsetzung) – SY0-701, Domäne 1.0:

- **Technical (logical)** – durch Technik/Systeme umgesetzt: Firewall, Verschlüsselung, MFA, IDS, ACLs, Antivirus.
- **Managerial (administrative)** – durch Management/Governance: Policies, Risk Assessments, Security-Reviews, Hintergrundprüfungen, Change-Management.
- **Operational** – durch Menschen im laufenden Betrieb: Awareness-Training, Incident Response, Patch-/Backup-Prozesse, Wachdienst, Besuchermanagement.
- **Physical** – physische Schutzmaßnahmen: Schlösser, Zäune, Kameras, Mantraps, Badge-Reader, Serverraum-Zutritt.

Wichtig: **Kategorie und Typ sind zwei getrennte Dimensionen.** Eine Kamera ist **physical** (Kategorie) und zugleich **detective/deterrent** (Typ). MFA ist **technical** (Kategorie) und **preventive** (Typ). Awareness-Training ist **operational** und **preventive**. Prüfungsfragen testen genau diese zweidimensionale Zuordnung.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| (konzeptionell) | Klassifizierung |

## Lab-Setup

- Keines.

## Aufgabe (selbst lösen)

1. Definiere jede der vier Kategorien in einem Satz mit zwei Beispielen.
2. Klassifiziere 10 Controls **zweidimensional** (Kategorie **und** Typ) in einer Matrix (z. B. MFA, Kamera, Security-Policy, Awareness-Training, Firewall, Backup-Prozess, Zaun, Verschlüsselung, Hintergrundprüfung, IDS).
3. Erkläre den Unterschied managerial vs. operational an zwei Beispielen (oft verwechselt).
4. Finde für dein Lab je ein konkretes Beispiel pro Kategorie.

**Ziel:** Controls zuverlässig nach Kategorie **und** Typ einordnen (zweidimensionales Denken).

## SY0-701 Prüfungsbezug

- **1.0** Control categories: technical, managerial, operational, physical – getrennt von Control-Typen.
- Fallen: managerial (Papier/Governance) vs. operational (Menschen/Betrieb); Kamera = physical.
- Begriffe: *technical/managerial/operational/physical control*, *category vs. type*.
