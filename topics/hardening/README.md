# Thema: System Hardening

Praxis-Übungen zur **Systemhärtung** – die proaktive Reduktion der Angriffsfläche, die genau die Vektoren schließt, die in den offensiven Themen ausgenutzt wurden. Von Baselines/CIS-Benchmarks über Linux-/SSH-/Dienst-/Account-Härtung bis Windows, Patch-/Vulnerability-Management, Netzgerät-Härtung und einem Hardening-Projekt mit Vorher/Nachher-Messung. Ein **Blue-Team-/Defensive-Thema**.

> ⚠️ **Eigenes Lab.** Härtung am eigenen Lab durchführen; **Snapshots** vor Änderungen (Härtung kann Zugänge/Dienste brechen – z. B. SSH aussperren). Änderungen dokumentieren und testen.

## Lernziele

- Secure Baselines und CIS-Benchmarks verstehen und anwenden
- Linux/SSH/Dienste/Accounts systematisch härten (least privilege, Attack Surface)
- Windows-Grundhärtung und Patch-/Vulnerability-Management
- Härtung messen (Scan vorher/nachher) und als Projekt dokumentieren

## Abgedeckte SY0-701-Domänen

- **2.0 Threats, Vulnerabilities & Mitigations** – Hardening, Attack-Surface-Reduktion, Patch-Management, secure baselines
- **3.0 Security Architecture** – secure defaults, least functionality
- **4.0 Security Operations** – Hardening-Betrieb, Benchmarks, Monitoring, Configuration Management

## Übungen (Schwierigkeit 1 → 10)

| #  | Übung | Schwierigkeit |
|----|-------|---------------|
| 01 | Hardening-Grundlagen & Baselines | 1/10 |
| 02 | CIS-Benchmark-Audit (Lynis/CIS-CAT) | 2/10 |
| 03 | Linux-Hardening (Dateirechte, Kernel, Module) | 3/10 |
| 04 | SSH-Hardening | 4/10 |
| 05 | Dienste & Attack-Surface reduzieren | 5/10 |
| 06 | Account- & Authentifizierungs-Härtung | 6/10 |
| 07 | Windows-Hardening | 7/10 |
| 08 | Patch- & Vulnerability-Management | 8/10 |
| 09 | Netzwerkgerät-/OPNsense-Härtung | 9/10 |
| 10 | Hardening-Projekt + Report (Vorher/Nachher) | 10/10 |

## Lab-Voraussetzungen

- **Linux-VM(s)** (z. B. eine frische + absichtlich ungehärtete/Metasploitable als Kontrast)
- **Windows-VM** (Übung 07; sonst konzeptionell)
- **OPNsense** (Übung 09, Bezug `firewall-opnsense`)
- **Tools:** `lynis` (Audit), CIS-Benchmarks/CIS-CAT, `openscap`/SCAP, Vuln-Scanner (`greenbone`/`nmap` aus `vulnerability-scanning`), Ansible optional (automatisierte Härtung)
- **Snapshots** vor jeder Härtung; Bezug: alle offensiven Themen (die Vektoren, die man hier schließt)

Reihenfolge: starte bei `01-hardening-basics-baselines/`. Pro Übung erst die `.md` lösen, dann `solution.md`.
