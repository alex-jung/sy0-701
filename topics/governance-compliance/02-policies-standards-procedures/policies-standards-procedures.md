# Übung 02 – Policies, Standards, Procedures & Guidelines

**Schwierigkeit: 2/10 · Dauer: ca. 55 Min.**

## Lernziele

- Die Dokumenten-Hierarchie sicher unterscheiden
- Policy, Standard, Procedure und Guideline korrekt zuordnen
- Eine eigene Security-Policy + zugehörige Dokumente für dein Lab schreiben

## Theorie

Governance-Vorgaben werden in einer **Hierarchie** dokumentiert (SY0-701):

- **Policy:** **Was & Warum** – hochrangige, verpflichtende Absicht/Ziel der Leitung (z. B. „Alle Zugänge erfordern MFA"). Breit, selten geändert, **mandatory**.
- **Standard:** **konkrete, verpflichtende Vorgaben** zur Umsetzung der Policy (z. B. „MFA = TOTP oder FIDO2; Mindestlänge Passwort 14"). **Mandatory**, messbar.
- **Procedure:** **Schritt-für-Schritt-Anleitung** (wie genau; z. B. „So richtest du MFA ein: 1…2…3"). **Mandatory** im Ablauf.
- **Guideline:** **Empfehlung/Best Practice** – **optional**, gibt Orientierung (z. B. „Empfohlene Passwort-Manager").

Typische spezielle Policies: **AUP (Acceptable Use)**, **Access Control**, **Password**, **Data Classification**, **Incident Response**, **BYOD**, **Change Management**, **Retention**. Merkhilfe: Policy = Verfassung, Standard = Gesetz, Procedure = Bedienungsanleitung, Guideline = Tipp.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Markdown/Dokument | Policy-Set schreiben |

## Lab-Setup

- Dein Lab als Geltungsbereich (Scope) der Dokumente.

## Aufgabe (selbst lösen)

1. Ordne 8 Beispiele der richtigen Ebene zu (policy/standard/procedure/guideline), z. B. „MFA ist Pflicht", „so aktivierst du TOTP", „empfohlene Browser", „Passwort ≥14 Zeichen".
2. Schreibe für dein Lab eine kurze **Policy** (z. B. „Lab Security & Acceptable Use") mit Zweck, Scope, Kernaussagen, Rollen, Enforcement.
3. Leite aus der Policy **einen Standard** und **eine Procedure** ab (konkret, umsetzbar).
4. Erkläre, warum man Policy und Procedure **trennt** (Änderungshäufigkeit, Verantwortung).

**Ziel:** die Dokumenten-Hierarchie fehlerfrei anwenden + ein kleines, konsistentes Policy-Set fürs Lab.

## SY0-701 Prüfungsbezug

- **5.0** policies, standards, procedures, guidelines; AUP; mandatory vs. optional; document hierarchy.
- Fallen: Standard (mandatory/konkret) vs. Guideline (optional); Policy ≠ Procedure.
- Begriffe: *policy/standard/procedure/guideline*, *AUP*, *mandatory/optional*, *scope*, *enforcement*.
