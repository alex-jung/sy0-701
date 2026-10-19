# Übung 08 – Data Governance: Rollen & Klassifizierung

**Schwierigkeit: 8/10 · Dauer: ca. 75 Min.**

## Lernziele

- Data Governance und ihre Rollen sauber zuordnen
- Datenklassifizierung und daraus abgeleitete Controls festlegen
- Data Lifecycle, Retention und Sovereignty einordnen

## Theorie

**Data Governance** stellt sicher, dass Daten über ihren **Lebenszyklus** korrekt klassifiziert, geschützt, verwendet und entsorgt werden.

- **Rollen:** **Data Owner** (Business, bestimmt Klassifizierung/Zugriff, accountable), **Data Steward** (Pflege/Qualität/Kennzeichnung), **Data Custodian** (technischer Schutz: Backup/Verschlüsselung/Access umsetzen), **Data Controller/Processor** (DSGVO), **DPO (Data Protection Officer)**.
- **Datenklassifizierung:** z. B. **public / internal / confidential / restricted** (oder regulatorisch: PII, PHI, PCI). Klassifizierung **steuert Controls** (je sensibler, desto strenger: Verschlüsselung, Zugriff, Logging).
- **Data Lifecycle:** create → store → use → share → archive → **destroy** (sichere Löschung/Sanitization).
- **Weitere:** **Retention** (Aufbewahrungsfristen), **Data Sovereignty/Residency** (wo liegen Daten rechtlich), **Data at rest/in transit/in use**, **Minimization**. Bezug zu `data-protection`.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Klassifizierungs-Schema + Tabelle | Daten ↔ Klasse ↔ Controls |
| RACI (Übung 03) | Datenrollen |

## Lab-Setup

- Daten in deinem Lab/Repo (Configs, Keys, Übungsinhalte, Logs) als Klassifizierungsobjekt.

## Aufgabe (selbst lösen)

1. Definiere ein **Klassifizierungs-Schema** (4 Stufen) mit Kriterien und Beispiel-Daten.
2. Klassifiziere 6–8 Datenarten deines Labs (z. B. CA-/SSH-Keys, OPNsense-Config, Übungs-Markdown, Logs, dieses README) und leite pro Klasse **konkrete Controls** ab (Zugriff/Verschlüsselung/Retention/Löschung).
3. Ordne Data Owner / Steward / Custodian für zwei Datenarten zu.
4. Skizziere den **Lifecycle** einer sensiblen Datenart inkl. **sicherer Löschung** und nenne Retention + Sovereignty-Überlegung.

**Ziel:** ein Klassifizierungs-Schema mit klassifizierten Lab-Daten, abgeleiteten Controls, Rollen und Lifecycle.

## SY0-701 Prüfungsbezug

- **5.0/3.0** data governance, data classification, roles (owner/steward/custodian/controller/processor/DPO), data lifecycle, retention, sovereignty/residency.
- Begriffe: *data classification (public/internal/confidential/restricted)*, *owner/steward/custodian*, *data lifecycle*, *retention*, *sanitization*, *data sovereignty*.
