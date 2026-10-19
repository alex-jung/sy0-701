# Übung 05 – T-Pot: All-in-one Honeypot-Plattform

**Schwierigkeit: 5/10 · Dauer: ca. 90 Min.**

## Lernziele

- T-Pot als containerisierte Multi-Honeypot-Plattform deployen
- Das Zusammenspiel vieler Honeypots + ELK-Stack verstehen
- Das Kibana/Attack-Map-Dashboard bedienen

## Theorie

**T-Pot** (Deutsche Telekom) bündelt **Dutzende Honeypots** (Cowrie, Dionaea, Honeytrap, Heralding, ElasticPot, Conpot, Mailoney, …) in **Docker-Containern** und schickt alle Events in einen **ELK-Stack** (Elasticsearch/Logstash/Kibana) mit fertigen Dashboards und einer **Attack Map**. Eine Netz-Umleitung (NFQ/`iptables`) lenkt fast alle eingehenden Ports auf die passenden Honeypots.

T-Pot ist ressourcenhungrig (RAM/Disk) und primär ein **Research**-Werkzeug: man sieht Trends, Quell-Länder, meistgenutzte Credentials, Exploit-Versuche. **Wichtig:** T-Pot ist dafür gebaut, exponiert zu werden – im Lab bleibt es dennoch in einem **isolierten, egress-gefilterten** Segment.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `t-pot` | Honeypot-Plattform (Docker + ELK) |
| Kibana | Dashboards / Attack Map |
| `ssh` | Management (T-Pot legt SSH auf 64295) |

## Lab-Setup

- Dedizierte VM: **≥ 8 GB RAM, 2+ vCPU, ~128 GB Disk**, Debian/Ubuntu. Isoliertes VLAN. Management-Zugang auf Port 64295, Web/Kibana auf 64297.

## Aufgabe (selbst lösen)

1. Installiere T-Pot (Standard/Hive-Edition) auf der VM.
2. Verstehe die Port-Logik: echter Admin-SSH auf **64295**, Web-UI/Kibana auf **64297**, (fast) alle anderen Ports → Honeypots.
3. Erzeuge von Kali Angriffe (SSH-Brute-Force, Portscan, HTTP-Requests) und finde sie in Kibana wieder.
4. Öffne mind. **drei** Dashboards (z. B. Cowrie, Suricata, Attack Map) und notiere je eine Kennzahl.

**Ziel:** laufendes T-Pot, eigene Testangriffe in Kibana sichtbar, drei Dashboards interpretiert.

## SY0-701 Prüfungsbezug

- **4.0** Honeynet/Monitoring at scale; zentrale Visualisierung; Threat Intelligence.
- **3.0** Segmentierung/Isolation exponierter Systeme.
- Begriffe: *honeynet*, *SIEM/ELK*, *dashboard*, *attack map*, *containerization*.
