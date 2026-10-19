# Übung 05 – Regulierung: DSGVO / PCI DSS / HIPAA / SOX

**Schwierigkeit: 5/10 · Dauer: ca. 65 Min.**

## Lernziele

- Wichtige Regulierungen/Standards und ihren Geltungsbereich unterscheiden
- Legal vs. regulatory vs. industry/contractual einordnen
- Datenschutz-Grundbegriffe (controller/processor, Betroffenenrechte) verstehen

## Theorie

Compliance-Pflichten kommen aus unterschiedlichen Quellen (SY0-701):

- **DSGVO/GDPR** (EU, **Gesetz**): Schutz personenbezogener Daten; **Controller** (bestimmt Zweck/Mittel) vs. **Processor** (verarbeitet im Auftrag); **Betroffenenrechte** (Auskunft, Löschung „right to be forgotten", Portabilität); **Breach-Notification** (72 h); hohe Bußgelder; **data residency/sovereignty**.
- **PCI DSS** (**contractual/industry**): Schutz von Karteninhaberdaten; verpflichtend für alle, die Kartendaten verarbeiten; Anforderungen an Netz/Verschlüsselung/Access; Compensating Controls formal erlaubt.
- **HIPAA** (US-**Gesetz**): Schutz von Gesundheitsdaten (PHI).
- **SOX** (US-**Gesetz**): Finanzberichterstattung/-integrität börsennotierter Firmen (Controls über Finanzdaten).
- **GLBA** (Finanzdaten), **SOC 2** (Service-Org-Nachweis, Trust Services Criteria), **CCPA** (Kalifornien).

Kategorien: **legal/regulatory** (Gesetz, Behörde) vs. **industry/contractual** (PCI, SOC 2). Nichteinhaltung → **Bußgelder, Haftung, Reputations-/Vertragsschaden, Lizenzverlust**.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| (konzeptionell) | Zuordnung/Analyse |

## Lab-Setup

- Hypothetische Szenarien (das Lab selbst verarbeitet i. d. R. keine echten regulierten Daten).

## Aufgabe (selbst lösen)

1. Ordne DSGVO, PCI DSS, HIPAA, SOX je einem Datentyp/Zweck und der Kategorie (legal vs. contractual) zu.
2. Erkläre den Unterschied **Data Controller** vs. **Data Processor** an einem Beispiel (DSGVO).
3. Nenne drei **Betroffenenrechte** der DSGVO und je eine technische/organisatorische Maßnahme zur Erfüllung.
4. Beschreibe für ein fiktives Szenario (z. B. „kleiner Onlineshop in der EU mit Kartenzahlung"), welche Regulierungen greifen und warum.

**Ziel:** Regulierungen sicher zuordnen (Scope/Kategorie) und DSGVO-Grundbegriffe anwenden.

## SY0-701 Prüfungsbezug

- **5.0** regulatory/legal/industry compliance: GDPR, PCI DSS, HIPAA, SOX, GLBA, SOC 2; controller/processor; breach notification; data sovereignty; consequences of non-compliance.
- Begriffe: *GDPR/DSGVO*, *PCI DSS*, *HIPAA*, *SOX*, *controller/processor*, *data residency/sovereignty*, *breach notification*, *fines/sanctions*.
