# Übung 10 – Hardening-Projekt + Report (Vorher/Nachher)

**Schwierigkeit: 10/10 · Dauer: ca. 2–3 Std.**

## Lernziele

- Ein System end-to-end härten (alle Bereiche kombiniert)
- Härtung messen (Audit + Vuln-Scan + Angreifer-Sicht vorher/nachher)
- Änderungen reproduzierbar/automatisiert umsetzen und dokumentieren
- Einen Hardening-Report mit belegtem Fortschritt erstellen

## Theorie

Ein echtes Hardening-Projekt ist **messbar** und **reproduzierbar**:
1. **Baseline-Messung:** Audit (Lynis/SCAP), Vuln-Scan, Nmap (offene Ports) – der „Vorher"-Stand.
2. **Härtung:** alle Bereiche (Linux/SSH/Dienste/Accounts/Kernel/ggf. Windows/Netz) gemäß Baseline/CIS.
3. **Automatisierung/CM:** Härtung als Code (Ansible-Playbook/Skript) → reproduzierbar, gegen Drift.
4. **Nachher-Messung:** gleiche Audits/Scans → Vergleich (Hardening-Index ↑, offene Ports ↓, CVEs ↓).
5. **Report:** Vorher/Nachher, umgesetzte Maßnahmen, Rest-Risiko/Ausnahmen, Betrieb (Drift/CM).

Die Gegenprobe: Angriffe aus den offensiven Themen, die vorher klappten, scheitern jetzt.

`hardening-report-template.md` ist das Gerüst.

## Verwendete Tools

Kombination aus Übung 01–09: Lynis/SCAP, Greenbone/Nmap, Härtungs-Maßnahmen, optional Ansible + `hardening-report-template.md`.

## Lab-Setup

- Ein ungehärtetes Ziel (frische/alte VM). Kali (Angreifer-Sicht), Scanner. Snapshots.

## Aufgabe (selbst lösen)

Härte ein System als Projekt mit Vorher/Nachher-Nachweis.

1. **Baseline:** Lynis-Index + Nmap-Portliste + Vuln-Scan festhalten (Vorher).
2. **Härten:** SSH, Dienste/Ports, Accounts/Auth, Linux-Kernel/Rechte (Übung 03–06), ggf. Windows/Netz (07/09).
3. **Automatisieren:** fasse die Härtung in ein **Skript/Ansible-Playbook** (reproduzierbar).
4. **Nachher:** gleiche Messungen wiederholen → Vergleich (Index ↑, Ports ↓, CVEs ↓).
5. **Gegenprobe + Report:** zeige, dass ein vorher erfolgreicher Angriff (z. B. SSH-Brute-Force/ein Dienst-Exploit) jetzt scheitert; fülle `hardening-report-template.md`.

**Ziel:** ein messbar gehärtetes System (belegte Vorher/Nachher-Verbesserung), reproduzierbar umgesetzt, mit Report und Angriffs-Gegenprobe.

## SY0-701 Prüfungsbezug

- **Hardening-Projekt**, Baseline + Messung (Audit/Scan), **Configuration Management/IaC**, Drift.
- Vorher/Nachher-Nachweis, Rest-Risiko/Ausnahmen, Betrieb.
- Begriffe: *hardening*, *baseline/benchmark*, *configuration management (IaC)*, *attack surface reduction*, *continuous compliance*.
