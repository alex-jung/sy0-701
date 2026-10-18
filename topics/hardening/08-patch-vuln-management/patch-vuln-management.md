# Übung 08 – Patch- & Vulnerability-Management

**Schwierigkeit: 8/10 · Dauer: ca. 65 Min.**

## Lernziele

- Den Patch-/Vulnerability-Management-Prozess verstehen und anwenden
- Scan → Priorisierung (CVSS/Exposure) → Patch → Re-Scan durchlaufen
- Patch-Strategien kennen (Ringe, Wartungsfenster, Test, Rollback)
- Kompensierende Kontrollen für nicht-patchbare Systeme

## Theorie

Fehlende Patches sind eine der häufigsten Einbruchsursachen (vgl. `vulnerability-scanning`/`exploitation`). **Vulnerability Management** ist ein **kontinuierlicher Zyklus**:

1. **Identify:** scannen (Greenbone/Nessus, credentialed) → bekannte CVEs.
2. **Prioritize:** nach **CVSS × Exposure × Exploit-Verfügbarkeit** (nicht nur Score; CISA KEV = aktiv ausgenutzt zuerst).
3. **Remediate:** patchen/mitigieren – mit **Test** (Staging), **Ringen/Phasen** (erst Pilot, dann breit), **Wartungsfenster**, **Rollback-Plan**.
4. **Validate:** **Re-Scan** → Lücke geschlossen?
5. **Report/Repeat:** SLA je Severity (z. B. Critical 72h), Metriken.

**Kompensierende Kontrollen** für nicht sofort patchbare Systeme (Legacy/OT): isolieren/segmentieren, virtuelles Patching (IPS-Regel), Zugriff einschränken.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Greenbone/Nessus (aus `vulnerability-scanning`) | Vuln-Scan |
| `apt`/`unattended-upgrades`/WSUS | Patchen |
| `nmap`/Re-Scan | Validierung |

## Lab-Setup

- Ein (bewusst veraltetes) System + Vuln-Scanner. Snapshot (Patches/Reboot).

## Aufgabe (selbst lösen)

1. Scanne ein veraltetes System (credentialed) → Liste der CVEs mit Severity.
2. **Priorisiere** die Funde (CVSS + Exposure + „exploit verfügbar") – welche zuerst?
3. **Patch** die Top-Findings (bzw. simuliere im Staging) und dokumentiere Test/Rollback-Plan.
4. **Re-Scan** und belege, dass die Lücken geschlossen sind (Vorher/Nachher).
5. Definiere für ein **nicht patchbares** System (Legacy) mindestens zwei **kompensierende Kontrollen**.

**Ziel:** ein durchlaufener Vuln-Management-Zyklus (Scan→Priorisierung→Patch→Re-Scan) + Kompensations-Strategie für Legacy.

## SY0-701 Prüfungsbezug

- **Patch/Vulnerability Management Lifecycle**, CVSS-/risk-based Priorisierung, **CISA KEV**.
- Patch-Ringe/Staging/Wartungsfenster/Rollback, **virtual patching**, **compensating controls**.
- Begriffe: *patch management*, *vulnerability management*, *risk-based prioritization*, *compensating control*, *virtual patching*.
