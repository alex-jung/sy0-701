# Übung 02 – CIS-Benchmark-Audit (Lynis/SCAP)

**Schwierigkeit: 2/10 · Dauer: ca. 55 Min.**

## Lernziele

- Ein automatisiertes Hardening-Audit durchführen (Lynis)
- Ergebnisse interpretieren (Warnings/Suggestions, Hardening-Index)
- SCAP/CIS-CAT als standardisierte Compliance-Prüfung einordnen
- Eine priorisierte Remediation-Liste erstellen

## Theorie

Statt manuell jede Einstellung zu prüfen, auditieren Tools ein System gegen Best-Practices/Benchmarks:

- **Lynis:** schnelles, agentenloses Linux-Audit-Skript → prüft hunderte Punkte (Dienste, Rechte, SSH, Kernel, Auth, Logging) und liefert **Warnings/Suggestions** + einen **Hardening-Index** (Score). Ideal fürs Lab.
- **SCAP / OpenSCAP + CIS-/SSG-Profile:** standardisierte, **maschinenlesbare** Compliance-Prüfung (XCCDF/OVAL) gegen ein Profil (z. B. CIS) → Pass/Fail je Regel, Reports, teils Auto-Remediation.
- **CIS-CAT:** offizielles CIS-Audit-Tool gegen CIS-Benchmarks.

Wichtig: Audit = **Ist-Aufnahme**. Die Funde priorisiert man (Risiko/Aufwand) und setzt sie in den folgenden Übungen um. Vor/Nach-Audit zeigt den Fortschritt (Übung 10).

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `lynis` | Linux-Hardening-Audit |
| `oscap` (OpenSCAP) + SSG | SCAP/CIS-Profil-Scan |
| CIS-CAT (optional) | offizielles CIS-Audit |

## Lab-Setup

- Eine (ungehärtete) Linux-VM. `lynis`/`openscap-scanner` + `scap-security-guide` installiert. Snapshot.

## Aufgabe (selbst lösen)

1. Führe ein **Lynis-Audit** durch (`lynis audit system`) und notiere den **Hardening-Index**.
2. Gehe die **Warnings** und wichtigsten **Suggestions** durch – welche Kategorien (SSH/Auth/Dienste/Kernel) dominieren?
3. Führe (falls verfügbar) einen **OpenSCAP**-Scan gegen ein CIS-/SSG-Profil durch und erzeuge einen HTML-Report.
4. Erstelle eine **priorisierte Remediation-Liste** (High→Low) aus den Funden.
5. Erkläre den Unterschied Lynis vs. SCAP/CIS-CAT (ad-hoc vs. standardisierte Compliance).

**Ziel:** ein Baseline-Audit mit dokumentiertem Hardening-Index und einer priorisierten Remediation-Liste als Fahrplan für Übung 03–09.

## SY0-701 Prüfungsbezug

- **Compliance/Configuration Auditing**, **CIS Benchmarks**, **SCAP**, Hardening-Index.
- Audit → Priorisierung → Remediation; Vorher/Nachher-Messung.
- Begriffe: *security audit*, *CIS benchmark*, *SCAP/OpenSCAP*, *Lynis*, *remediation*.
