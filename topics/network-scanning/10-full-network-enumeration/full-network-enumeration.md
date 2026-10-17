# Übung 10 – Vollständige Netz-Enumeration mit Reporting

**Schwierigkeit: 10/10 · Dauer: ca. 2–3 Std.**

## Lernziele

- Alle vorherigen Techniken zu einer **vollständigen, methodischen Enumeration** kombinieren
- Einen effizienten Scan-Workflow aufbauen (schnelle Übersicht → gezielte Tiefe)
- Ergebnisse **reproduzierbar dokumentieren** und als Findings mit Risiko priorisieren
- Ein Mini-„Pentest-Report"-Artefakt erstellen – wie in einer echten Engagement-Phase

## Theorie

In der Praxis scannt niemand planlos. Ein bewährter **Workflow**:

1. **Scope & Discovery:** Welche Netze/Hosts sind in-scope? Host Discovery (ARP intern, `-Pn`/TCP-Ping über Grenzen).
2. **Breite:** schneller Portüberblick über **alle** Hosts (z. B. `masscan` oder `nmap -T4 --top-ports`).
3. **Tiefe:** auf gefundenen offenen Ports gezielt `-sV -sC`, OS, UDP-Top-Ports, relevante NSE-`vuln`.
4. **Korrelation:** Dienste + Versionen → bekannte CVEs → Risiko (CVSS).
5. **Reporting:** strukturierte Dokumentation (Host → Ports → Dienste → Findings → Empfehlung), reproduzierbare Befehle, maschinenlesbarer Output (`-oA`).

**Effizienz:** `masscan` findet in Sekunden alle offenen Ports im /24, nmap macht danach nur noch die Tiefe auf genau diesen Ports – statt stundenlanger `-sV -p-`-Läufe über alle Hosts.

Als Hilfe liegt `enum-workflow.sh` bei – ein Gerüst, das die Phasen verkettet. **Lies es, bevor du es nutzt**, und passe Netz/Interface an.

## Verwendete Tools

| Tool | Zweck | Wichtige Optionen |
|------|-------|-------------------|
| `masscan` | ultraschneller Port-Sweep | `-p`, `--rate`, `-oL` |
| `nmap` | Tiefe + NSE + Output | `-sV -sC -O`, `--script vuln`, `-oA` |
| `xsltproc` | nmap-XML → HTML-Report | `nmap.xsl` |
| `enum-workflow.sh` | Phasen verketten (beiliegend) | selbst anpassen |

## Lab-Setup

- Das gesamte bisher aufgebaute Lab: Kali, Metasploitable/DVWA, OPNsense, idealerweise zwei Segmente (aus Übung 09).
- `masscan` installieren falls nötig (`apt install masscan`).

## Aufgabe (selbst lösen)

Du bekommst den „Auftrag", dein Lab-Netz vollständig zu enumerieren und einen kurzen Report zu liefern.

1. **Phase 1 – Discovery:** Erstelle die vollständige Liste aktiver Hosts (intern ARP, über Grenze `-Pn`/TCP-Ping).
2. **Phase 2 – Breite:** Finde mit `masscan` (oder schnellem nmap) **alle offenen TCP-Ports** aller Hosts.
3. **Phase 3 – Tiefe:** Mach auf allen gefundenen offenen Ports `-sV -sC`, dazu OS-Detection, UDP-Top-Ports und `--script vuln`.
4. **Phase 4 – Korrelation:** Ordne jedem auffälligen Dienst eine bekannte CVE + grobe Risiko-Einstufung (High/Med/Low) zu.
5. **Phase 5 – Report:** Erzeuge einen strukturierten Report (pro Host: offene Ports, Dienste/Versionen, Top-Findings, Empfehlung). Nutze `-oA` und wandle die XML in HTML.
6. **Reproduzierbarkeit:** Lege alle verwendeten Befehle so ab, dass ein Kollege den Scan 1:1 wiederholen kann.

**Ziel:** ein vollständiges, priorisiertes Enumeration-Ergebnis deines Labs plus ein lesbarer Report – das Gesamtprodukt aus Übung 01–09.

## SY0-701 Prüfungsbezug

- **Vulnerability Management Lifecycle** (4.0): *Identification → Analysis → Prioritization (CVSS) → Reporting → Remediation → Validation*. Diese Übung ist die praktische Entsprechung.
- **Penetration testing phases** (reconnaissance → scanning/enumeration → …) und **rules of engagement/scope** (2.0/4.0).
- **CVSS-Priorisierung**, **false positive handling**, **asset inventory**, **attack surface management** – alles report-relevant.
- Begriffe: *enumeration*, *vulnerability management lifecycle*, *CVSS*, *scope/rules of engagement*, *attack surface*, *remediation/compensating control*.
