# Übung 10 – Vollständige PrivEsc-Kette + Hardening-Report

**Schwierigkeit: 10/10 · Dauer: ca. 2 Std.**

## Lernziele

- Von unprivilegiertem Zugang methodisch zu root/SYSTEM eskalieren
- Enumeration → Vektorwahl → Exploitation → Verifikation als Prozess durchführen
- Gefundene Vektoren dokumentieren und priorisiert härten
- Einen PrivEsc-/Hardening-Report erstellen

## Theorie

Ein vollständiger PrivEsc-Durchlauf:
1. **Zugang** (unprivilegiert, aus Web-/Dienst-Exploit).
2. **Enumeration** (manuell + linPEAS/winPEAS, pspy).
3. **Vektorwahl** – vom Einfachsten/Zuverlässigsten (sudo/SUID) zum Riskanten (Kernel).
4. **Exploitation + Verifikation** (`id`/`whoami`).
5. **Dokumentation & Hardening** – jeder genutzte Vektor + die Fehlkonfiguration dahinter + Fix.

Die beiliegende `privesc-report-template.md` ist das Gerüst.

## Verwendete Tools

Kombination aus Übung 01–09: linPEAS/winPEAS, pspy, GTFOBins/LOLBAS, linux-exploit-suggester, msfvenom + `privesc-report-template.md`.

## Lab-Setup

- Ein Ziel (Linux und/oder Windows) mit **mehreren** gesetzten Misconfigs. Unprivilegierter Startzugang. Snapshots.

## Aufgabe (selbst lösen)

Du bekommst eine Low-Priv-Shell und den Auftrag, root/SYSTEM zu erreichen und zu berichten.

1. **Enumeration:** manuell + automatisiert; erstelle die vollständige Vektor-Liste.
2. **Priorisierung:** ordne Vektoren nach Zuverlässigkeit/Risiko (Konfig vor Kernel).
3. **Exploitation:** eskaliere über mindestens einen Vektor zu root/SYSTEM; dokumentiere Befehl + Nachweis (`id`).
4. **Alternativwege:** benenne (idealerweise demonstriere) mindestens einen **zweiten** Vektor.
5. **Hardening-Report:** fülle `privesc-report-template.md` – je Vektor die zugrundeliegende Fehlkonfiguration, der Exploit-Nachweis und der konkrete Fix, priorisiert.

**Ziel:** eine belegte PrivEsc-Kette (mind. 2 Vektoren erkannt, 1 ausgenutzt) plus ein priorisierter Hardening-Report.

## SY0-701 Prüfungsbezug

- **Privilege escalation** als Prozess; **Enumeration → Exploitation → Verification**.
- **Hardening / least privilege / patch management** gebündelt.
- **Reporting** mit Fokus auf Ursache (Misconfiguration) + Remediation.
- Begriffe: *privilege escalation*, *least privilege*, *hardening*, *misconfiguration*, *patch management*.
