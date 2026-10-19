# Thema: Honeypots & Deception

Praxis-Übungen zu **Honeypots** und **Deception Technology** – absichtlich verwundbare/attraktive Köder-Systeme, die Angreifer anlocken, ihr Verhalten aufzeichnen und **frühzeitige, hochpräzise Alarme** liefern (jeder Zugriff ist per Definition verdächtig). Anschluss an `ids-ips`, `logging-siem`, `incident-response` und `threat-concepts`.

> ⚠️ **Nur im eigenen, isolierten Lab.** Honeypots ziehen echte Angreifer an und können – wenn kompromittiert – als **Sprungbrett (Pivot)** gegen dein Netz missbraucht werden. Regeln:
> - Honeypot in ein **streng segmentiertes Netz** (eigenes OPNsense-VLAN/DMZ), **ausgehend hart gefiltert** (kein freier Internet-/LAN-Zugriff vom Honeypot aus).
> - **Keine echten Daten/Credentials**, keine Verbindung zu Produktivsystemen; Snapshots; regelmäßig zurücksetzen.
> - Nur **eigene** Köder. Niemand Drittes wird angegriffen. Beobachten ≠ zurückhacken (kein „Hack back").

## Lernziele

- Honeypot-Typen und Deception-Konzepte verstehen und einordnen
- Low- und High-Interaction-Honeypots (Cowrie, Dionaea, T-Pot) aufsetzen und betreiben
- Angriffe beobachten, Logs/Sessions auswerten, TTPs erkennen
- Honeytokens/Canaries als Deception im eigenen Netz platzieren
- Honeypot-Daten visualisieren, IOCs/Threat Intel ableiten und an SIEM/IDS anbinden
- Platzierung, Nutzen und Risiken bewerten und ein Deception-Konzept dokumentieren

## Abgedeckte SY0-701-Domänen

- **4.0 Security Operations** – Detection, Honeypots/Honeynets/Honeytokens, Threat Intelligence, Monitoring
- **2.0 Threats, Vulnerabilities & Mitigations** – Threat Actors, TTPs, Indicators of Compromise
- **1.0 General Security Concepts** – Deception & Disruption Technology (Honeypot, Honeynet, Honeyfile, Honeytoken)

## Übungen (Schwierigkeit 1 → 10)

| #  | Übung | Schwierigkeit |
|----|-------|---------------|
| 01 | Honeypot-Grundlagen & Klassifizierung | 1/10 |
| 02 | Cowrie: SSH/Telnet-Honeypot aufsetzen | 2/10 |
| 03 | Angriffe auf Cowrie beobachten & Logs auswerten | 3/10 |
| 04 | Weitere Dienst-Honeypots (Dionaea & Co.) | 4/10 |
| 05 | T-Pot: All-in-one Honeypot-Plattform | 5/10 |
| 06 | Honeytokens & Canary-Dateien/-Accounts | 6/10 |
| 07 | Honeypot-Daten visualisieren (Dashboards) | 7/10 |
| 08 | IOCs & Threat Intelligence ableiten | 8/10 |
| 09 | Platzierung, Deception-Strategie & Risiken | 9/10 |
| 10 | Capstone: Deception-Konzept + Report + SIEM-Anbindung | 10/10 |

## Lab-Voraussetzungen

- **Honeypot-VM** (Debian/Ubuntu) in einem **isolierten OPNsense-VLAN/DMZ**, ausgehend streng gefiltert
- Für T-Pot (Übung 05): eine VM mit **mind. 8 GB RAM, 2+ vCPU, ~128 GB Disk**, Docker
- Kali als „Angreifer" zum Erzeugen von Testangriffen gegen den eigenen Honeypot
- Anbindung an `logging-siem` (Wazuh/ELK) und `ids-ips` (Suricata) aus den vorherigen Themen
- Tools: `cowrie`, `dionaea`, `t-pot`, `opencanary`/Canarytokens, dazu `ssh`, `nmap`, `tshark`, `jq`

Reihenfolge: starte bei `01-grundlagen-klassifizierung/`. Pro Übung erst die `.md` lösen, dann `solution.md`.
