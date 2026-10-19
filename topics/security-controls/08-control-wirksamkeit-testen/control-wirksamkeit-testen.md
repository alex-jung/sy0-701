# Übung 08 – Control-Wirksamkeit messen & testen

**Schwierigkeit: 8/10 · Dauer: ca. 85 Min.**

## Lernziele

- Den Unterschied „Control existiert" vs. „Control wirkt" verstehen
- Controls aktiv testen/validieren (Control Validation)
- Wirksamkeit über Metriken/KPIs messbar machen

## Theorie

Eine dokumentierte Control ≠ eine **wirksame** Control. **Control Validation** prüft, ob eine Control in der Praxis **auslöst/greift**:

- **Preventive** testen: der Angriff sollte **blockiert** werden (z. B. Exploit gegen gehärteten Host scheitert, Firewall droppt, MFA stoppt Login).
- **Detective** testen: der Angriff sollte einen **Alarm** erzeugen (IDS/SIEM feuert) → misst **Detection Coverage** und **Time to Detect**.
- Methoden: **Atomic Red Team** (atomare TTP-Tests), **Breach & Attack Simulation (BAS)**, Purple Teaming, kontrollierte Pen-Tests – alles nur im **eigenen** Lab.

**Metriken/KPIs** (Domäne 4.0/5.0): MTTD (Mean Time to Detect), MTTR (Respond/Recover), % erkannter Test-TTPs, Patch-SLA-Einhaltung, Fehlalarmrate, Control-Abdeckung. Wichtig ist der **Nachweis** (Alarm im SIEM, blockierte Aktion), nicht die Annahme.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Atomic Red Team (Konzept) | atomare TTP-Tests |
| `wazuh`/`suricata` | Detection-Nachweis |
| `nmap`/`greenbone` | preventive/Config testen |
| eigenes Testskript | wiederholbare Validierung |

## Lab-Setup

- Lab mit IDS/SIEM aktiv; ein Testhost; definierte Controls aus den Vorthemen.

## Aufgabe (selbst lösen)

1. Wähle **drei** Controls (je eine preventive, detective, corrective) und definiere pro Control ein **Pass-Kriterium** (was muss passieren?).
2. **Teste** jede: z. B. Exploit/Portscan gegen gehärteten Host (preventive → blockiert), eine simulierte TTP (detective → SIEM-Alarm), Restore aus Backup (corrective → Daten zurück). Dokumentiere Beweis (Log/Screenshot/Exit-Code).
3. Definiere **drei KPIs** (z. B. MTTD, % erkannter Test-TTPs, Patch-SLA) und erhebe für deine Tests konkrete Werte.
4. Finde **eine** Control, die zwar existiert, aber **nicht wirkt** (kein Alarm/kein Block) und leite eine Korrektur ab (Tuning).

**Ziel:** drei Controls aktiv validiert (mit Beweis), KPIs erhoben und mindestens eine unwirksame Control identifiziert+korrigiert.

## SY0-701 Prüfungsbezug

- **4.0/5.0** control validation/effectiveness, testing, metrics/KPIs (MTTD/MTTR), continuous monitoring, purple teaming.
- Begriffe: *control validation*, *atomic red team/BAS*, *MTTD/MTTR*, *detection coverage*, *false positive rate*.
