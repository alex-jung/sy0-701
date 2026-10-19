# Übung 03 – Defense in Depth / Layered Security

**Schwierigkeit: 3/10 · Dauer: ca. 55 Min.**

## Lernziele

- Defense in Depth / Layered Security verstehen
- Mehrere Control-Schichten gegen einen Angriffspfad legen
- Single Points of Failure durch Redundanz von Controls vermeiden

## Theorie

**Defense in Depth** (mehrschichtige Verteidigung) bedeutet: **mehrere, voneinander unabhängige** Controls hintereinander, sodass das Versagen **einer** Schicht nicht gleich zum Totalausfall führt. Prinzip des „Swiss Cheese": jede Schicht hat Lücken, aber die Löcher liegen selten übereinander.

Schichten (Beispiele): **Perimeter** (Firewall, IPS) → **Netz** (Segmentierung/VLAN, NAC) → **Host** (Hardening, EDR/AV, Patch) → **Applikation** (Input-Validierung, WAF) → **Daten** (Verschlüsselung, Zugriffskontrolle, DLP) → **Identität** (MFA, Least Privilege) → **Mensch/Prozess** (Awareness, IR). Ergänzend **Diversität** (nicht überall dasselbe Produkt) und **Redundanz**.

Abgrenzung: **Defense in Depth** (mehrere Schichten, auch gleichartig) vs. **Layered Security**/Diversität. Verwandt: **Zero Trust** (kein implizites Vertrauen, ständige Verifikation) – ergänzt, ersetzt DiD aber nicht.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| (konzeptionell) | Schichten-Analyse; Bezug zu Lab-Controls |

## Lab-Setup

- Dein Lab-Netz (OPNsense/VLANs, Hardening, IDS/SIEM) als Analyseobjekt.

## Aufgabe (selbst lösen)

1. Zeichne die Verteidigungsschichten vom Perimeter bis zu den Daten und ordne **deine Lab-Controls** den Schichten zu.
2. Wähle **einen** Angriffspfad (z. B. „externer Angreifer → Webserver → interne DB") und liste pro Schicht, welche Control ihn stoppen/erkennen würde.
3. Finde eine Schicht in deinem Lab, die **nur eine** Control hat (Single Point) und schlage eine zweite, unabhängige Control vor.
4. Erkläre den Unterschied Defense in Depth vs. Zero Trust in 3–4 Sätzen.

**Ziel:** mehrschichtige Verteidigung am eigenen Lab anwenden und Single Points of Failure in der Control-Landschaft erkennen.

## SY0-701 Prüfungsbezug

- **1.0/3.0** defense in depth, layered security, redundancy/diversity, zero trust (Abgrenzung).
- Begriffe: *defense in depth*, *layered security*, *single point of failure*, *segmentation*, *zero trust*.
