# Übung 09 – Threat Hunting & Pyramid of Pain

**Schwierigkeit: 9/10 · Dauer: ca. 85 Min.**

## Lernziele

- Threat Hunting als proaktive, hypothesengetriebene Suche verstehen
- Die Pyramid of Pain anwenden, um Detection auf TTPs zu heben
- Einen Hunt im eigenen Lab planen und durchführen

## Theorie

**Threat Hunting** ist die **proaktive**, **hypothesengetriebene** Suche nach Angreifern, die der automatisierten Detection entgangen sind – nicht auf Alarme warten, sondern gezielt in Telemetrie (SIEM/EDR/PCAP) nach Spuren suchen. Vorgehen: **Hypothese** (z. B. „ein Angreifer nutzt PowerShell zur Persistence") → Daten sammeln → analysieren → bestätigen/verwerfen → neue Detection ableiten.

**Pyramid of Pain** (David Bianco) – wie „schmerzhaft" für den Angreifer, wenn man eine Indikator-Ebene blockiert:
1. Hash Values – trivial zu ändern.
2. IP Addresses – leicht.
3. Domain Names – etwas Aufwand.
4. Network/Host Artifacts – mittel.
5. Tools – hoch.
6. **TTPs** – am schmerzhaftesten (Angreifer muss seine Vorgehensweise ändern).

Konsequenz: Detection auf **höheren** Ebenen (Artefakte/Tools/TTPs) ist robuster als reines Hash-/IP-Blocking. Hunting zielt genau darauf (ATT&CK-basiert). Bezug: `honeypots` 08, `logging-siem`, `ids-ips`, ATT&CK (Übung 07).

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| SIEM (`wazuh`)/`jq` | Telemetrie durchsuchen |
| `suricata`/`zeek`/PCAP | Netz-Hunt |
| ATT&CK | Hypothesen/Mapping |

## Lab-Setup

- SIEM/Logs/PCAP aus den Blue-Team-Themen + ggf. eine im Lab simulierte TTP (harmlos) als „Beute".

## Aufgabe (selbst lösen)

1. Formuliere **zwei Hunt-Hypothesen** (ATT&CK-basiert) für dein Lab (z. B. „Ingress Tool Transfer via wget nach SSH-Login").
2. Führe einen Hunt durch: suche in deinen Lab-Daten (SIEM/Honeypot/PCAP) nach Belegen; dokumentiere Query, Fund/Null-Fund und Schluss.
3. Ordne deine bisherigen IOCs/Detections den **Ebenen der Pyramid of Pain** zu und zeige, wie du von Hash/IP auf **TTP-Detection** hebst.
4. Leite aus einem Hunt eine **neue Detection-Regel** (SIEM/Suricata) ab.

**Ziel:** einen hypothesengetriebenen Hunt durchführen, Pyramid of Pain anwenden und eine robustere TTP-Detection ableiten.

## SY0-701 Prüfungsbezug

- **4.0** threat hunting (proactive, hypothesis-driven), Pyramid of Pain, TTP-based detection, threat-informed defense.
- Begriffe: *threat hunting*, *hypothesis-driven*, *Pyramid of Pain*, *TTP detection*, *telemetry*, *detection engineering*.
