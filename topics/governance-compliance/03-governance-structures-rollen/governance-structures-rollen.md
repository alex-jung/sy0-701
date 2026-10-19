# Übung 03 – Governance-Strukturen & Rollen

**Schwierigkeit: 3/10 · Dauer: ca. 55 Min.**

## Lernziele

- Governance-Strukturen (Board, Committee, zentral/dezentral) einordnen
- Security-Rollen und ihre Verantwortlichkeiten unterscheiden
- Eine RACI-Matrix für Security-Aufgaben erstellen

## Theorie

Governance braucht **Strukturen** und klare **Rollen**:

- **Strukturen:** **Board of Directors** (oberste Aufsicht), **Security/Risk Committee** (steuert Security-Programm), **zentral vs. dezentral** (eine zentrale Security-Funktion vs. verteilte Verantwortung in Einheiten), **Government/Regulatory** Einflüsse.
- **Rollen (SY0-701, v. a. im Datenkontext):**
  - **CISO/CSO** – verantwortet das Security-Programm (oft accountable).
  - **Data Owner** – (geschäftlich) verantwortlich für ein Daten-Asset, legt Klassifizierung/Zugriff fest.
  - **Data Steward** – pflegt Datenqualität/-kennzeichnung im Auftrag des Owners.
  - **Data Custodian** – technische Verwahrung/Schutz (Backup, Zugriff technisch umsetzen).
  - **Data Processor** vs. **Data Controller** (DSGVO, Übung 05/08).
  - **System/Business Owner**, **User**.

**RACI** (Responsible, Accountable, Consulted, Informed) macht Verantwortlichkeiten pro Aufgabe eindeutig – genau **ein** Accountable pro Aufgabe.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| RACI-Matrix (Tabelle) | Rollen ↔ Aufgaben |

## Lab-Setup

- Dein Lab; auch im Ein-Personen-Setup werden die **Rollen** gedanklich getrennt.

## Aufgabe (selbst lösen)

1. Beschreibe Board, Security Committee und den Unterschied zentral vs. dezentral in je 1–2 Sätzen.
2. Ordne die Rollen Data Owner / Steward / Custodian / CISO / User jeweils einer Kurzaufgabe zu.
3. Erstelle eine **RACI-Matrix** für 5 Security-Aufgaben deines Labs (z. B. Patching, Backup, Zugriffsvergabe, IR, Policy-Freigabe).
4. Erkläre, warum pro Aufgabe nur **ein** Accountable existieren darf.

**Ziel:** Governance-Rollen sicher zuordnen + eine konsistente RACI-Matrix fürs Lab.

## SY0-701 Prüfungsbezug

- **5.0** governance structures (board, committees, centralized/decentralized), roles (owner/steward/custodian/CISO), RACI.
- Fallen: Data Owner (Business, entscheidet) vs. Custodian (Technik, verwahrt) vs. Steward (Pflege).
- Begriffe: *board/committee*, *centralized/decentralized*, *data owner/steward/custodian*, *RACI*, *accountable*.
