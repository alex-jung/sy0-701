# Übung 07 – Audits & Assessments

**Schwierigkeit: 7/10 · Dauer: ca. 75 Min.**

## Lernziele

- Audit vs. Assessment und intern vs. extern unterscheiden
- Einen Audit-/Assessment-Prozess durchführen (Scope → Evidence → Findings)
- Attestation, Penetration Testing und Audit-Arten einordnen

## Theorie

**Assessment** = (oft interne) Bewertung des Ist-Zustands zur Verbesserung; **Audit** = **formale, unabhängige** Prüfung gegen einen Maßstab (Standard/Policy) mit Urteil/Bericht.

- **Internal Audit:** eigene (unabhängige) Funktion prüft, Vorbereitung auf externe Audits.
- **External Audit:** unabhängige Dritte (z. B. für ISO-27001-Zertifizierung, SOC 2) – höhere Glaubwürdigkeit.
- **Regulatory/Compliance Audit:** durch/für Behörde.
- **Attestation:** (Management-)Bestätigung, dass Controls umgesetzt sind.
- **Penetration Testing** (technisches Assessment): **known/partially known/unknown environment** (früher white/gray/black box), **internal/external**; liefert Evidence zur Control-Wirksamkeit (vgl. die offensiven Themen).

Ablauf: **Scope/Kriterien** → **Evidence sammeln** (Interviews, Config, Logs, Stichproben) → **Findings** (Abweichungen vom Soll, mit Schweregrad) → **Report** → **Remediation/Follow-up**. Unabhängigkeit und **Evidence** sind zentral.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Audit-Checkliste/Arbeitspapiere | Evidence/Findings |
| Compliance-Matrix (Übung 06) | Prüfgrundlage |
| vorhandene Scans/Logs | Evidence |

## Lab-Setup

- Dein Lab + Compliance-Matrix/Evidence aus Übung 06. Du spielst „Auditor" deines eigenen Labs.

## Aufgabe (selbst lösen)

1. Definiere Scope und Kriterien eines Mini-Audits deines Labs (z. B. gegen deine Lab-Policy oder CIS IG1).
2. Sammle für 5 Kontrollpunkte **Evidence** (Config/Log/Scan/Screenshot) und bewerte: **conformity / nonconformity / observation**.
3. Formuliere **Findings** mit Schweregrad und Remediation-Empfehlung; priorisiere.
4. Erkläre die Unterschiede Audit vs. Assessment, intern vs. extern, und wo Penetration Testing hineinpasst.

**Ziel:** ein durchgeführtes Mini-Audit (Scope→Evidence→Findings→Remediation) + saubere Begriffsabgrenzung.

## SY0-701 Prüfungsbezug

- **5.0** internal/external audit, assessment, attestation, regulatory audit, evidence, findings; penetration testing types (known/partially known/unknown, internal/external).
- Begriffe: *audit vs. assessment*, *internal/external*, *attestation*, *evidence/finding/nonconformity*, *pen test (known/partially known/unknown)*, *remediation*.
