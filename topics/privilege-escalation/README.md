# Thema: Privilege Escalation

Praxis-Übungen zur **Rechteausweitung** – vom niedrig privilegierten Zugang (z. B. `www-data`/`daemon` aus einem Web-/Dienst-Exploit) zu **root** bzw. **SYSTEM/Administrator**. Schwerpunkt Linux, plus ein Windows-Block. Jede Übung zeigt Angriff **und** die konkrete Härtung.

> ⚠️ **Nur im eigenen, isolierten Lab.** Übe gegen eigene VMs (Metasploitable, eigene Linux-/Windows-VMs). PrivEsc-Exploits können Systeme destabilisieren → **Snapshots** anlegen.

## Lernziele

- Systeme systematisch auf PrivEsc-Vektoren enumerieren (manuell & automatisiert)
- Die klassischen Linux-Vektoren ausnutzen: sudo, SUID/SGID, Cron/PATH, Capabilities, Gruppen, Kernel
- Windows-PrivEsc-Vektoren verstehen (Services, AlwaysInstallElevated, Token)
- Zu jedem Vektor die Gegenmaßnahme (least privilege, sichere Konfiguration) kennen

## Abgedeckte SY0-701-Domänen

- **2.0 Threats, Vulnerabilities & Mitigations** – Privilege Escalation (horizontal/vertikal), Misconfiguration, Kernel-Schwachstellen
- **4.0 Security Operations** – Hardening, least privilege, Monitoring
- **1.0 General Security Concepts** – Rechte-/Berechtigungskonzepte

## Übungen (Schwierigkeit 1 → 10)

| #  | Übung | Schwierigkeit |
|----|-------|---------------|
| 01 | PrivEsc-Grundlagen & manuelle Linux-Enumeration | 1/10 |
| 02 | Automatisierte Enumeration (linPEAS & LSE) | 2/10 |
| 03 | Sudo-Misconfigurations & GTFOBins | 3/10 |
| 04 | SUID/SGID-Binaries | 4/10 |
| 05 | Cron Jobs & PATH-/Wildcard-Hijacking | 5/10 |
| 06 | Writable Files, /etc/passwd & Service-Fehler | 6/10 |
| 07 | Linux Capabilities & Docker/LXD-Gruppe | 7/10 |
| 08 | Kernel Exploits (DirtyCow/DirtyPipe) | 8/10 |
| 09 | Windows Privilege Escalation | 9/10 |
| 10 | Vollständige PrivEsc-Kette + Hardening-Report | 10/10 |

## Lab-Voraussetzungen

- **Kali** (Angreifer) + ein **unprivilegierter Zugang** auf dem Ziel (aus `exploitation-metasploit`/`web-exploitation`)
- **Metasploitable 2/3** und/oder eine eigene Linux-VM (für gezielt gesetzte Misconfigs)
- **Windows-VM** (nur Übung 09; sonst konzeptionell) – z. B. eine bewusst verwundbare Windows-Lab-VM
- Tools: `linpeas`/`winpeas` (PEASS-ng), `pspy`, `linux-exploit-suggester`, Referenz **GTFOBins**/**LOLBAS**
- **Snapshots** der Ziel-VMs

Reihenfolge: starte bei `01-privesc-basics-enum/`. Pro Übung erst die `.md` lösen, dann `solution.md`.
