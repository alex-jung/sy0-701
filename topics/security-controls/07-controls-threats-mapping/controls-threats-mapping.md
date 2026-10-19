# Übung 07 – Controls ↔ Threats mappen (ATT&CK/NIST CSF)

**Schwierigkeit: 7/10 · Dauer: ca. 85 Min.**

## Lernziele

- Controls gezielt gegen konkrete Threats/TTPs stellen
- MITRE ATT&CK und NIST CSF-Funktionen als Mapping-Raster nutzen
- Abdeckungslücken (welche TTPs sind ungeschützt) erkennen

## Theorie

Controls sind nur so gut, wie sie **reale Bedrohungen** adressieren. Zwei nützliche Raster:

- **MITRE ATT&CK:** Angreifer-**Taktiken** (Initial Access, Execution, Persistence, Lateral Movement, Exfiltration …) und **Techniken** (T-IDs). Man mappt: *welche Control verhindert/erkennt welche Technik?* → sichtbare **Abdeckungslücken**.
- **NIST CSF** (Functions): **Identify, Protect, Detect, Respond, Recover** (+Govern in 2.0). Ordnet Controls ihrer Rolle im Lebenszyklus zu – prüft, ob man nicht nur „Protect" (preventive) hat, sondern auch Detect/Respond/Recover.

Verbindet sich mit `threat-concepts`, `ids-ips`, `logging-siem`, `incident-response`. Ergebnis ist eine **Coverage-Matrix**: pro TTP/Threat die vorhandenen preventive/detective/corrective Controls – und wo nichts steht (Gap).

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| MITRE ATT&CK Navigator (Konzept) | TTP-Abdeckung visualisieren |
| NIST CSF | Funktions-Mapping |
| vorhandene Controls (Firewall/IDS/SIEM/…) | Zuordnung |

## Lab-Setup

- Control-Inventar (Übung 04); ATT&CK-Matrix/Navigator; NIST CSF-Kategorien.

## Aufgabe (selbst lösen)

1. Wähle **ein** realistisches Bedrohungsszenario (z. B. Phishing → Credential-Diebstahl → Lateral Movement → Exfiltration) und zerlege es in ATT&CK-Taktiken/-Techniken.
2. Mappe deine Lab-Controls auf jede Stufe: welche **verhindert**, welche **erkennt**, welche **reagiert/erholt**?
3. Ordne dieselben Controls zusätzlich den **NIST-CSF-Funktionen** (Identify/Protect/Detect/Respond/Recover) zu und prüfe, ob alle Funktionen abgedeckt sind.
4. Markiere **Abdeckungslücken** (TTP ohne Control) und schlage je eine Control vor.

**Ziel:** eine Coverage-Matrix Controls↔TTPs/CSF-Funktionen für ein Szenario, inkl. erkannter Lücken.

## SY0-701 Prüfungsbezug

- **2.0/4.0** MITRE ATT&CK, TTPs, threat-informed defense; NIST CSF functions; control coverage.
- Begriffe: *ATT&CK tactic/technique*, *NIST CSF (Identify/Protect/Detect/Respond/Recover)*, *coverage/gap*, *threat-informed defense*.
