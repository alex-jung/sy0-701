# Übung 04 – Weitere Dienst-Honeypots (Dionaea & Co.)

**Schwierigkeit: 4/10 · Dauer: ca. 75 Min.**

## Lernziele

- Über SSH hinaus denken: Honeypots für SMB, HTTP, FTP, SIP, MSSQL
- Dionaea als low-interaction Multi-Service-Honeypot verstehen
- Malware-Captures (SMB/EternalBlue-artig) als IOCs sammeln

## Theorie

Nicht jeder Angriff zielt auf SSH. **Dionaea** emuliert mehrere **vulnerable Dienste** (SMB/445, HTTP/80, FTP/21, MSSQL/1433, SIP, MySQL …) mit dem Ziel, **Malware einzufangen**: Exploits gegen die emulierten Dienste liefern ihre Payload, die Dionaea als Datei speichert. So sammelt man reale Samples/IOCs (klassisch: Würmer, die über SMB verbreiten).

Weitere spezialisierte Honeypots: **OpenCanary** (leichtgewichtig, viele Protokolle, einfache Alerts), **Glastopf/SNARE-Tanner** (Web), **Conpot** (ICS/SCADA), **Elasticpot** (Elastic). Prinzip bleibt: emulierte Oberfläche + Logging + Alerting.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `dionaea` | Multi-Service low-interaction Honeypot, Malware-Capture |
| `opencanary` | leichtgewichtiger Multi-Protocol-Honeypot/Alerts |
| `nmap` | Testen, welche Köder-Ports offen erscheinen |

## Lab-Setup

- Honeypot-VM. Dionaea per Paket/Docker. Kali als Testangreifer (nmap, evtl. ein harmloser SMB-Connect). Egress wie immer gesperrt.

## Aufgabe (selbst lösen)

1. Setze **Dionaea** auf (Paket oder Docker) und prüfe mit `nmap` von Kali, welche Dienste/Ports als „offen/verwundbar" erscheinen.
2. Erzeuge Interaktion gegen mindestens **zwei** Dienste (z. B. SMB-Connect, HTTP-Request) und finde die Events in den Dionaea-Logs/SQLite-DB.
3. Richte zusätzlich **OpenCanary** mit 2–3 Diensten ein und löse einen Alert aus.
4. Dokumentiere, **welcher Honeypot** sich für **welchen Zweck** eignet (SSH → Cowrie, Malware/SMB → Dionaea, breite günstige Abdeckung → OpenCanary).

**Ziel:** zwei zusätzliche Dienst-Honeypots laufen, Events sind nachgewiesen, und du kannst die Tool-Auswahl begründen.

## SY0-701 Prüfungsbezug

- **4.0** Honeypots/Honeynets zur Erkennung dienstspezifischer Angriffe; Malware-Collection.
- **2.0** Angriffsvektoren je Dienst (SMB/HTTP/FTP), IOCs.
- Begriffe: *honeynet*, *service emulation*, *malware capture*, *ICS honeypot (Conpot)*.
