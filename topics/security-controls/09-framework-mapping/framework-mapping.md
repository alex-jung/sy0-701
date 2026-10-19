# Übung 09 – Framework-Mapping (NIST 800-53 / CIS / ISO 27001)

**Schwierigkeit: 9/10 · Dauer: ca. 90 Min.**

## Lernziele

- Die großen Control-Frameworks unterscheiden und einordnen
- Eigene Controls auf Framework-Anforderungen mappen
- Framework-übergreifend „Crosswalk" denken (eine Control erfüllt mehrere)

## Theorie

Frameworks geben strukturierte **Soll-Controls** vor (SY0-701, Domäne 5.0):

- **NIST SP 800-53:** umfangreicher Control-Katalog (Control Families: AC, AU, IA, SC, IR …), v. a. US-Behörden; sehr granular.
- **NIST CSF:** funktionsorientiert (Identify/Protect/Detect/Respond/Recover/Govern), gut zum Steuern/Kommunizieren (Übung 07).
- **CIS Controls v8:** 18 priorisierte, praxisnahe Controls mit IGs (Übung 05) – gut für den Einstieg.
- **ISO/IEC 27001 (+Annex A/27002):** ISMS-Standard, zertifizierbar, Management-System + Controls.
- Branchen/Regulatorik: **PCI DSS**, **HIPAA**, **SOC 2**, **DSGVO/GDPR** (Bezug `governance-compliance`/`data-protection`).

Eine einzelne Control (z. B. MFA) erfüllt **mehrere** Frameworks zugleich (NIST IA-2, CIS 6, ISO A.5.17/A.8.5). Ein **Crosswalk/Mapping** macht das sichtbar und vermeidet Doppelarbeit. Framework-Wahl hängt von Kontext/Compliance-Pflicht ab.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| NIST 800-53 / CIS v8 / ISO 27001 Annex A | Referenzkataloge |
| Tabelle/Crosswalk | Mapping |

## Lab-Setup

- Control-Inventar (Übung 04); Zugriff auf die Framework-Kataloge (öffentlich/Übersichten).

## Aufgabe (selbst lösen)

1. Charakterisiere die vier Frameworks (NIST 800-53, NIST CSF, CIS v8, ISO 27001) in je 2 Sätzen: Zweck, Struktur, typischer Einsatz.
2. Baue einen **Crosswalk** für mind. **5** deiner Lab-Controls: ordne jede Control der passenden Anforderung in **mindestens zwei** Frameworks zu (z. B. MFA → NIST IA-2 / CIS 6 / ISO A.8.5).
3. Wähle für dein Lab ein **Leitframework** und begründe die Wahl.
4. Zeige an einem Beispiel, wie ein Crosswalk **Doppelarbeit spart** (eine Control, mehrere Compliance-Nachweise).

**Ziel:** ein Framework-Crosswalk deiner Lab-Controls + begründete Leitframework-Wahl.

## SY0-701 Prüfungsbezug

- **5.0** frameworks (NIST 800-53/CSF, CIS, ISO 27001), regulatory/industry standards, control mapping.
- Begriffe: *NIST 800-53/CSF*, *CIS Controls*, *ISO 27001 (ISMS/Annex A)*, *crosswalk/mapping*, *PCI DSS/SOC 2/GDPR*.
