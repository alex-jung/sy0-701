# Lösung – Übung 02: Policies/Standards/Procedures/Guidelines

## 1. Zuordnung

| Beispiel | Ebene |
|----------|-------|
| „MFA ist Pflicht für alle Zugänge" | Policy |
| „MFA = TOTP oder FIDO2; Passwort ≥14" | Standard |
| „So aktivierst du TOTP: Schritt 1…n" | Procedure |
| „Empfohlene Browser/Passwort-Manager" | Guideline |
| „Zugriff nach Least Privilege" | Policy |
| „SSH nur mit Key, kein Passwort-Login" | Standard |
| „Checkliste Onboarding neuer VM" | Procedure |
| „Tipps zur sicheren Namenswahl" | Guideline |

## 2. Beispiel-Policy (Kurzform)

> **Lab Security & Acceptable Use Policy**
> **Zweck:** sicheren, legalen Betrieb des Lab gewährleisten.
> **Scope:** alle VMs/Netze/Daten des Lab, alle Nutzer (ich).
> **Kernaussagen:** (1) Angriffe nur gegen eigene/freigegebene Lab-Ziele. (2) Zugänge mit MFA + Least Privilege. (3) Keine Produktivdaten/echten Credentials. (4) Backups/Snapshots vor riskanten Aktionen. (5) Secrets nie ins Repo.
> **Rollen:** Lab-Owner (accountable), Nutzer (responsible).
> **Enforcement:** Verstöße → Korrektur/Review; Dokumentation im Register.

## 3. Standard + Procedure (abgeleitet)

- **Standard (aus „Zugänge mit MFA"):** „SSH-Admin nur per Key/Cert; Web-/IdP-Logins mit TOTP oder FIDO2; Passwörter ≥14, gegen Breach-Liste geprüft."
- **Procedure:** „MFA aktivieren: 1) `google-authenticator` ausführen, 2) QR scannen, 3) PAM-Zeile setzen, 4) Login testen, 5) Scratch-Codes sichern." (vgl. `authentication` 03)

## 4. Warum trennen

- **Policy** ändert sich **selten** (Grundsatz) und wird von der Leitung verantwortet; **Procedures** ändern sich **oft** (Tools/Versionen) und gehören ins operative Team. Trennung vermeidet, dass man bei jeder Tool-Änderung die Grundsatz-Policy neu freigeben muss, und hält Verantwortlichkeiten klar.

## Hinweise / Troubleshooting

- Standard ist **verpflichtend und konkret**; Guideline ist **optional** – häufiger Prüfungs-Stolperstein.
- Policies kurz/stabil halten, Details in Standards/Procedures auslagern.
- Jedes Dokument braucht Scope, Owner, Version/Review-Datum.
