# Übung 01 – Hardening-Grundlagen & Baselines

**Schwierigkeit: 1/10 · Dauer: ca. 40 Min.**

## Lernziele

- Hardening und Attack-Surface-Reduktion als Prinzip verstehen
- Secure Baselines und ihren Lebenszyklus kennen
- Standards/Benchmarks einordnen (CIS, DISA STIG, NIST)
- Den Bezug zu den offensiven Themen herstellen (Vektoren schließen)

## Theorie

**Hardening** reduziert proaktiv die **Angriffsfläche**: alles Unnötige entfernen/abschalten, sichere Defaults setzen, Rechte minimieren – genau die Dinge, die in `privilege-escalation`, `enumeration`, `network-scanning` etc. ausgenutzt wurden.

Leitprinzipien:
- **Least Functionality / minimal install:** nur nötige Software/Dienste/Ports.
- **Least Privilege:** minimale Rechte für User/Dienste.
- **Secure Defaults:** sichere Ausgangskonfiguration statt „offen".
- **Defense in Depth:** mehrere Schichten.

Eine **Secure Baseline** ist ein definierter, dokumentierter Soll-Zustand (z. B. „so sieht ein gehärteter Webserver aus"), gegen den man auditiert und den man per **Configuration Management** durchsetzt/überwacht (Drift erkennen). Referenzen: **CIS Benchmarks**, **DISA STIGs**, **NIST 800-53/-123**.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| CIS Benchmarks (Dokumente) | Referenz-Baseline |
| (später) Lynis/openSCAP | Audit gegen Baseline |

## Lab-Setup

- Eine Linux-VM + optional Metasploitable als „ungehärtetes" Gegenbeispiel. Konzeptionell + erste Bestandsaufnahme.

## Aufgabe (selbst lösen)

1. Erkläre **Attack-Surface-Reduktion** an drei konkreten Beispielen (Dienst, Account, Port).
2. Ordne die Prinzipien **Least Functionality / Least Privilege / Secure Defaults** je einem Hardening-Schritt zu.
3. Beschreibe, was eine **Secure Baseline** ist und wie man **Drift** (Abweichung) erkennt.
4. Vergleiche die Zwecke von **CIS Benchmark**, **DISA STIG** und **NIST** kurz.
5. Verknüpfe: welche der offensiven Themen (PrivEsc/Enumeration/Scanning) härtest du mit welchem Prinzip weg?

**Ziel:** die Hardening-Prinzipien und Baseline-/Benchmark-Konzepte sicher benennen und mit den Angriffsvektoren verknüpfen.

## SY0-701 Prüfungsbezug

- **Hardening**, **attack surface reduction**, **least functionality/privilege**, **secure baselines**.
- **CIS Benchmarks / STIG / NIST**, Configuration Management, Drift.
- Begriffe: *hardening*, *attack surface*, *secure baseline*, *CIS benchmark/STIG*, *configuration drift*.
