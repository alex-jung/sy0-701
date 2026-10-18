# Thema: Incident Response

Praxis-Übungen zur **Vorfallsbehandlung (IR)** – was passiert, wenn die Detection (aus `ids-ips`/`logging-siem`) Alarm schlägt. Vom IR-Lifecycle über Vorbereitung, Triage, Containment und Beweissicherung bis Forensik, Eradication/Recovery, Timeline-Analyse und Postmortem. Ein **Blue-Team-/SecOps-Thema** mit starkem Prozess- und Praxisfokus.

> ⚠️ **Eigenes Lab.** „Vorfälle" werden mit eigenen Angriffen (aus den offensiven Themen) gegen eigene Lab-Ziele erzeugt. Forensik/Beweissicherung an eigenen VMs üben; **Snapshots** vor invasiven Schritten.

## Lernziele

- Den IR-Lifecycle (NIST/SANS) verstehen und anwenden
- IR-Vorbereitung (Plan, Playbooks, Rollen, Kommunikation) kennen
- Alerts triagieren, einen Vorfall eindämmen (Containment) ohne Beweise zu zerstören
- Beweise rechtssicher sichern (Order of Volatility, Hashing, Chain of Custody)
- Grund-Forensik (Memory/Disk/Logs), Eradication/Recovery, Postmortem/Lessons Learned

## Abgedeckte SY0-701-Domänen

- **4.0 Security Operations** – Incident Response, Forensik, Logging/Timeline, Detection→Response
- **5.0 Program Management** – IR-Plan/Policy, Kommunikation, Reporting, Lessons Learned
- **2.0 Threats, Vulnerabilities & Mitigations** – Angriffe/IoCs im IR-Kontext

## Übungen (Schwierigkeit 1 → 10)

| #  | Übung | Schwierigkeit |
|----|-------|---------------|
| 01 | IR-Grundlagen & Lifecycle (NIST/SANS) | 1/10 |
| 02 | Preparation & Readiness (Plan, Playbooks, Rollen) | 2/10 |
| 03 | Detection & Triage | 3/10 |
| 04 | First Response & Containment | 4/10 |
| 05 | Beweissicherung (Order of Volatility, Chain of Custody) | 5/10 |
| 06 | Memory- & Disk-Forensik | 6/10 |
| 07 | Eradication & Recovery | 7/10 |
| 08 | Log- & Timeline-Analyse | 8/10 |
| 09 | Postmortem & Lessons Learned | 9/10 |
| 10 | Vollständige IR-Übung (Tabletop + technisch) | 10/10 |

## Lab-Voraussetzungen

- **Kali** (erzeugt die „Vorfälle" aus den offensiven Themen) + ein **Opfer-Host** (Linux/Windows-VM)
- **SIEM/IDS** aus `logging-siem`/`ids-ips` als Detection-Quelle (optional, aber empfohlen)
- **Forensik-Tools:** Imaging (`dd`/`dc3dd`), Hashing (`sha256sum`), Memory (Volatility, LiME/avml), Timeline (`log2timeline/plaso`, `mactime`), Linux-Triage (UAC/linux-triage), optional Autopsy/Sleuth Kit
- **Snapshots** der VMs; ein Notfall-/Analyse-Workstation-Prinzip (write-blocking-Denke)

Reihenfolge: starte bei `01-ir-basics-lifecycle/`. Pro Übung erst die `.md` lösen, dann `solution.md`.
