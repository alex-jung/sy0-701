# Übung 10 – Capstone: Threat Assessment / Threat Model

**Schwierigkeit: 10/10 · Dauer: ca. 3–4 Std.**

## Lernziele

- Ein vollständiges Threat Assessment / Threat Model für dein Lab erstellen
- Actors, Surface, Vektoren, TTPs, IOCs und TI zu einem Lagebild verbinden
- Bedrohungen auf Controls/Detection mappen und priorisieren

## Theorie

Dieses Capstone bündelt Übungen 01–09 zu einem **Threat Assessment / Threat Model**: Scope/Assets → relevante **Threat Actors** + Motivationen → **Attack Surface & Vektoren** → plausible **Angriffsszenarien** (als ATT&CK-Ketten) → **IOCs/TTPs** + Threat Intelligence → Mapping auf **Controls/Detection** (threat-informed defense) → priorisierte Empfehlungen + Hunts. Methodisch nutzbar: **STRIDE**/ATT&CK/Kill Chain/Diamond. Ergebnis ist ein Lagebild, das Verteidigung priorisiert. Nutze `threat-assessment-template.md`.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| ATT&CK (Navigator) | TTP-Mapping/Coverage |
| SIEM/Honeypot/PCAP-Daten | IOCs/Belege |
| (Ergebnisse Ü01–09) | Input |

## Lab-Setup

- Dein gesamtes Lab + Ergebnisse der Übungen 01–09 (und Daten aus den offensiven/Blue-Team-Themen).

## Aufgabe (selbst lösen)

Erstelle ein vollständiges Threat Assessment:

1. **Scope & Assets:** was wird betrachtet (Systeme/Daten/Nutzer).
2. **Threat Actors:** realistische Aktoren + Motivationen + Fähigkeiten (Ü01).
3. **Attack Surface & Vektoren:** erfasst + priorisiert (Ü02/03).
4. **Angriffsszenarien:** mind. **zwei** plausible Ketten als **ATT&CK**-Mapping (Taktik→Technik), optional Kill Chain/Diamond (Ü07).
5. **IOCs/TTPs & TI:** relevante Indikatoren/TTPs + genutzte Threat-Intel-Quellen, bewertet (Ü06/08).
6. **Controls/Detection-Mapping:** je Szenariostufe vorhandene preventive/detective/corrective Controls + **Lücken** (threat-informed, Bezug `security-controls` 07).
7. **Hunts & Empfehlungen:** mind. **eine** Hunt-Hypothese (Ü09) + priorisierte Maßnahmen zur Schließung der Lücken.
8. **Report:** `threat-assessment-template.md` vollständig, inkl. Management Summary + priorisierter Bedrohungsliste.

**Ziel:** ein durchgängiges, belegtes Threat Assessment (Actors→Surface→Szenarien/TTPs→IOCs/TI→Controls/Lücken→Hunts) + management-tauglicher Report.

## SY0-701 Prüfungsbezug

- **2.0 (+4.0)** kombiniert: threat actors/motivations, attack surface/vectors, malware/vulnerability types, IOCs, ATT&CK/TTPs, threat intelligence, hunting, threat-informed defense.
- Prüfungsnah: Aktoren/Vektoren einordnen, TTPs mappen, IOCs/TI nutzen, Controls gegen Threats stellen.
- Begriffe: *threat model/assessment*, *threat actor/motivation*, *attack surface/vector*, *ATT&CK/TTP*, *IOC*, *threat intelligence*, *Pyramid of Pain*, *threat-informed defense*.
