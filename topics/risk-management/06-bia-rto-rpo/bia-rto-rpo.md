# Übung 06 – Business Impact Analysis (RTO/RPO/MTD)

**Schwierigkeit: 6/10 · Dauer: ca. 70 Min.**

## Lernziele

- Eine Business Impact Analysis (BIA) erstellen
- RTO, RPO, MTD/MAD und die Reliability-Metriken MTBF/MTTR verstehen und abgrenzen
- Kritische Prozesse/Assets priorisieren und Recovery-Ziele ableiten

## Theorie

Eine **BIA** ermittelt, **wie kritisch** Prozesse/Systeme sind und welche **Ausfallfolgen** sie haben – Basis für Business Continuity (BCP) und Disaster Recovery (DRP). Kernmetriken (prüfungszentral):

- **RTO (Recovery Time Objective):** maximal tolerierbare **Ausfalldauer** bis zur Wiederherstellung.
- **RPO (Recovery Point Objective):** maximal tolerierbarer **Datenverlust** (Zeit seit letztem Backup) → steuert Backup-Frequenz.
- **MTD/MAD (Maximum Tolerable/Allowable Downtime):** Obergrenze, ab der der Ausfall existenzbedrohend wird (RTO ≤ MTD).
- **WRT (Work Recovery Time):** Zeit nach Wiederherstellung bis zum Normalbetrieb (RTO + WRT ≤ MTD).
- **MTBF (Mean Time Between Failures):** Zuverlässigkeit (je höher, desto seltener Ausfall).
- **MTTR (Mean Time To Repair):** durchschnittliche Reparaturzeit.

RTO und RPO sind **getrennt**: RTO = „wie schnell wieder online", RPO = „wie viel Daten darf ich verlieren". Beide treiben Architektur/Kosten (z. B. RPO≈0 → Replikation; kurzes RTO → Hot Site).

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Tabelle | BIA/Prozess-Kritikalität |
| (konzeptionell) | RTO/RPO/MTD ableiten |

## Lab-Setup

- Dein Lab als „Organisation" mit „Prozessen" (z. B. Firewall/Routing, SIEM, Repo/Doku, Übungs-VMs).

## Aufgabe (selbst lösen)

1. Liste deine „kritischen" Lab-Prozesse/Assets und bewerte ihre Kritikalität (Impact bei Ausfall).
2. Lege für die Top-3 je **RTO**, **RPO** und **MTD** fest und begründe die Werte.
3. Leite aus RTO/RPO konkrete **Maßnahmen** ab (z. B. Backup-Frequenz aus RPO, Redundanz/Snapshots aus RTO).
4. Erkläre den Unterschied RTO vs. RPO und MTBF vs. MTTR an je einem Beispiel.

**Ziel:** eine BIA mit priorisierten Prozessen und begründeten RTO/RPO/MTD-Werten + abgeleiteten Maßnahmen.

## SY0-701 Prüfungsbezug

- **5.0/4.0** BIA, RTO, RPO, MTD/MAD, WRT, MTBF, MTTR; business continuity/disaster recovery.
- **RTO vs. RPO ist klassischer Prüfungsstoff.**
- Begriffe: *BIA*, *RTO/RPO*, *MTD/MAD*, *WRT*, *MTBF/MTTR*, *BCP/DRP*, *criticality*.
