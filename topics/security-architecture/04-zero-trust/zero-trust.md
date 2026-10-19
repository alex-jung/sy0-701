# Übung 04 – Zero Trust (ZTA)

**Schwierigkeit: 4/10 · Dauer: ca. 70 Min.**

## Lernziele

- Zero-Trust-Prinzipien und -Komponenten (NIST 800-207) verstehen
- Control Plane vs. Data Plane und PDP/PEP einordnen
- Zero Trust vom klassischen Perimeter-Modell abgrenzen und im Lab skizzieren

## Theorie

**Zero Trust (ZT):** „**never trust, always verify**" – kein implizites Vertrauen aufgrund von Netz-Standort (nicht „innen = sicher"). Jede Anfrage wird **authentifiziert, autorisiert und laufend verifiziert** (Identität, Gerätezustand, Kontext). Kernidee: Perimeter ist aufgeweicht (Cloud/Remote) → Schutz an **Identität + jeder Ressource**.

NIST SP 800-207 Komponenten (SY0-701):
- **Policy Decision Point (PDP)** = **Policy Engine** + **Policy Administrator** – entscheidet Zugriff.
- **Policy Enforcement Point (PEP)** – setzt die Entscheidung am Zugriffspunkt durch.
- **Control Plane** (trifft/verteilt Entscheidungen) vs. **Data Plane** (eigentlicher Datenfluss nach Freigabe).
- Prinzipien: **Adaptive/continuous verification**, **least privilege**, **microsegmentation**, **assume breach**, **device + identity trust**, Kontext (Zeit/Ort/Risiko).

Zero Trust **ergänzt** Defense in Depth/Segmentierung, ersetzt sie nicht. Umsetzung: starke Identität/MFA (`authentication`), Mikrosegmentierung, Policy-basierter Zugriff, kontinuierliches Monitoring.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Diagramm | ZTA-Komponenten |
| vorhandene Controls (MFA/Segmentierung/SIEM) | ZT-Bausteine |

## Lab-Setup

- Dein Lab + MFA (`authentication`), Segmentierung (`firewall-opnsense`), SIEM.

## Aufgabe (selbst lösen)

1. Erkläre das Zero-Trust-Grundprinzip und grenze es vom klassischen „Burg & Burggraben"-Perimeter ab.
2. Zeichne ein ZTA-Modell mit **PDP (Policy Engine + Administrator)**, **PEP**, **Control Plane** und **Data Plane** für einen Zugriff im Lab.
3. Ordne deine vorhandenen Lab-Controls den ZT-Prinzipien zu (Identität/MFA, Mikrosegmentierung, continuous verification, assume breach).
4. Nenne drei konkrete Schritte, um dein Lab „Zero-Trust-näher" zu machen – und eine Grenze/Herausforderung.

**Ziel:** Zero Trust mit seinen Komponenten verstehen, vom Perimeter-Modell abgrenzen und auf das Lab übertragen.

## SY0-701 Prüfungsbezug

- **1.0/3.0** Zero Trust (NIST 800-207): policy engine/administrator (PDP), PEP, control/data plane, adaptive identity, least privilege, microsegmentation.
- Begriffe: *zero trust*, *never trust always verify*, *PDP/PEP*, *policy engine/administrator*, *control/data plane*, *microsegmentation*, *continuous/adaptive verification*, *assume breach*.
