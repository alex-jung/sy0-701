# Übung 01 – Control-Typen (preventive/detective/…)

**Schwierigkeit: 1/10 · Dauer: ca. 40 Min.**

## Lernziele

- Die sechs Control-**Typen** der SY0-701 kennen und unterscheiden
- Controls nach ihrer Wirkung im Zeitverlauf einordnen (vorher/währenddessen/danach)
- Typische Beispiele sicher zuordnen

## Theorie

Security Controls werden nach ihrer **Funktion/Wirkung** typisiert (SY0-701, Domäne 1.0):

- **Preventive** – verhindert, dass etwas passiert (Firewall-Regel, ACL, Verschlüsselung, Schulung, IPS im Block-Modus).
- **Detective** – erkennt, dass etwas passiert/ist (IDS, SIEM-Alarm, Logs, Kamera-Aufzeichnung, Audit).
- **Corrective** – stellt nach einem Vorfall den Zustand wieder her/begrenzt Schaden (Backup-Restore, Patch, Quarantäne, IR).
- **Deterrent** – schreckt ab (Warnbanner, sichtbare Kamera, Strafandrohung, Zaun).
- **Compensating** – Ersatzmaßnahme, wenn die primäre Control nicht umsetzbar ist (z. B. MFA + Monitoring statt eines nicht patchbaren Legacy-Systems).
- **Directive** – weist an/verpflichtet (Policy, Richtlinie, Verfahrensanweisung, „AUP").

Merkhilfe: zeitlich – **deterrent/preventive** (davor), **detective** (währenddessen), **corrective** (danach); **directive** steuert per Vorgabe; **compensating** ersetzt. Eine Control kann **mehreren** Typen zugeordnet werden (eine Kamera ist detective *und* deterrent).

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| (konzeptionell) | Klassifizierung/Analyse |

## Lab-Setup

- Keines.

## Aufgabe (selbst lösen)

1. Definiere jeden der sechs Typen in einem Satz und ordne ihn zeitlich zu (davor/währenddessen/danach/steuernd/ersetzend).
2. Klassifiziere 12 Beispiele nach Typ (z. B. Firewall-Regel, IDS-Alarm, Backup-Restore, Warnbanner, Security-Policy, MFA, Kamera, Zaun, Patch, Verschlüsselung, Awareness-Training, Account-Lockout). Mehrfachzuordnung erlaubt – begründe sie.
3. Erkläre an einem Beispiel, warum dieselbe Maßnahme **zwei** Typen zugleich sein kann.
4. Nenne zu einem Risiko (z. B. „gestohlener Laptop") je eine preventive, detective und corrective Control.

**Ziel:** die sechs Control-Typen fehlerfrei zuordnen – die häufigste Prüfungsfrage der Domäne 1.0.

## SY0-701 Prüfungsbezug

- **1.0** Control types: preventive, detective, corrective, deterrent, compensating, directive.
- Fallen: deterrent vs. preventive (abschrecken vs. verhindern), compensating vs. corrective.
- Begriffe: *preventive/detective/corrective/deterrent/compensating/directive control*.
