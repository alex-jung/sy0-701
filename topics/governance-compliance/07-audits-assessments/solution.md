# Lösung – Übung 07: Audits & Assessments

## 1. Scope & Kriterien

- Scope: Lab-Kern (OPNsense, SIEM, Zugänge, Backups). Kriterien: eigene **Lab-Policy** + **CIS IG1**-Teilmenge.

## 2. Evidence + Bewertung (Beispiel)

| Kontrollpunkt | Evidence | Bewertung |
|---------------|----------|-----------|
| MFA aktiv | IdP/PAM-Config, Login-Log | nonconformity (teilweise) |
| Zentrales Logging | Wazuh-Index/Alerts | conformity |
| Patch-Stand | Update-Log/Greenbone | observation (Backlog) |
| Backup+Restore getestet | Restore-Protokoll | conformity |
| Least-Privilege-Firewall | Ruleset-Export | conformity |

## 3. Findings (Beispiel)

| # | Finding | Schwere | Remediation |
|---|---------|---------|-------------|
| F1 | MFA nicht flächendeckend | hoch | MFA für alle Zugänge erzwingen |
| F2 | CVE-Backlog offen | mittel | Patch-SLA + monatlicher Scan |
| F3 | Keine dokumentierten Access-Reviews | mittel | quartalsweises Review einführen |

Priorität: F1 > F2 > F3 (Risiko).

## 4. Abgrenzungen

- **Assessment:** eigene Bewertung zur Verbesserung (formlos möglich). **Audit:** formale, **unabhängige** Prüfung gegen Maßstab mit Urteil.
- **Intern:** eigene unabhängige Funktion (Vorbereitung/Steuerung). **Extern:** Dritte (Zertifizierung/Glaubwürdigkeit, z. B. ISO/SOC 2).
- **Penetration Testing:** technisches Assessment der Control-Wirksamkeit; Varianten **known/partially known/unknown** + **internal/external** → liefert Evidence (z. B. „Control X ließ sich umgehen").

## Hinweise / Troubleshooting

- **Unabhängigkeit** ist zentral: wer prüft, sollte nicht das prüfen, was er selbst gebaut/verantwortet hat (im Solo-Lab bewusst „Auditor-Hut" aufsetzen).
- Findings immer mit **Evidence** + Schweregrad + Remediation; sonst nicht nachvollziehbar.
- Observation = Hinweis/Verbesserung ohne klare Nichtkonformität.
