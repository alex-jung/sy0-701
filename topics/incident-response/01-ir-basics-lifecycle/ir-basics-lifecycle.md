# Übung 01 – IR-Grundlagen & Lifecycle

**Schwierigkeit: 1/10 · Dauer: ca. 35 Min.**

## Lernziele

- Den Incident-Response-Lifecycle (NIST SP 800-61 / SANS) verstehen
- Event vs. Incident unterscheiden; Severity/Klassifizierung
- Rollen und Begriffe kennen (CSIRT, Incident Commander)
- Den roten Faden für die folgenden Übungen legen

## Theorie

Ein **Incident** ist ein Ereignis, das die **CIA** (Vertraulichkeit/Integrität/Verfügbarkeit) tatsächlich oder potenziell verletzt – im Gegensatz zu einem harmlosen **Event**. IR ist der strukturierte Umgang damit.

**NIST SP 800-61 (4 Phasen):**
1. **Preparation** – vorbereiten (Plan, Tools, Training).
2. **Detection & Analysis** – erkennen, triagieren, Umfang bestimmen.
3. **Containment, Eradication & Recovery** – eindämmen, entfernen, wiederherstellen.
4. **Post-Incident Activity** – Lessons Learned.

**SANS (6 Schritte, PICERL):** Preparation → Identification → Containment → Eradication → Recovery → Lessons Learned. Inhaltlich deckungsgleich.

Begriffe: **CSIRT/CERT** (das Reaktionsteam), **Incident Commander** (Leitung), **Playbook** (Ablauf je Szenario), **SLA/Severity** (Priorisierung).

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| — | konzeptionelle Übung |

## Lab-Setup

- Keines (Theorie/Einordnung). Vorbereitung für die praktischen Übungen.

## Aufgabe (selbst lösen)

1. Erkläre den Unterschied **Event vs. Incident** mit je einem Beispiel.
2. Benenne die **NIST-4-Phasen** und die **SANS-6-Schritte** und ordne sie einander zu.
3. Entwirf eine einfache **Severity-Matrix** (z. B. SEV1–SEV3) mit Kriterien (Scope, Impact, Datenart).
4. Erkläre die Rollen **Incident Commander**, **CSIRT**, und wofür ein **Playbook** gut ist.
5. Ordne ein konkretes Szenario (z. B. Ransomware / Datenabfluss / kompromittierter Webserver) einer Severity zu und begründe.

**Ziel:** den IR-Lifecycle und die Grundbegriffe sicher benennen + eine Severity-Einstufung begründen – die Basis für alle folgenden Übungen.

## SY0-701 Prüfungsbezug

- **Incident response process/lifecycle** (NIST/SANS) – Kernstoff Domäne 4.0.
- **Event vs. incident**, Severity/Priorisierung, **CSIRT/Incident Commander**, Playbooks.
- Begriffe: *incident response lifecycle*, *NIST 800-61*, *PICERL*, *CSIRT*, *incident commander*, *severity/triage*.
