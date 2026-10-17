# Übung 08 – Angriffserkennung in der Praxis

**Schwierigkeit: 8/10 · Dauer: ca. 80 Min.**

## Lernziele

- Reale Angriffe aus den offensiven Themen gegen das IDS laufen lassen und erkennen
- Erkennungsmuster je Angriffsphase verstehen (Scan → Exploit → C2)
- Evasion erleben (warum manches *nicht* erkannt wird)
- Erkennung mit MITRE ATT&CK/Kill-Chain verknüpfen

## Theorie

Jetzt wird das IDS „scharf" gegen die eigenen offensiven Themen getestet – das ist die **Blue-Team-Gegenprobe**:

- **Reconnaissance/Scanning:** Portscans, Nmap-NSE → „ET SCAN"-Alerts (viele Verbindungen/kurze Zeit).
- **Exploitation:** bekannte Exploits (vsftpd, Samba, Metasploit-Payloads) → Exploit-/Shellcode-Signaturen.
- **C2/Beaconing:** Meterpreter/Sliver-Callbacks → „ET MALWARE"/Beaconing-Muster (regelmäßige Outbound-Verbindungen).
- **Evasion (wichtig!):** Timing (`-T0`), Fragmentation, TLS-Verschlüsselung → **reduzieren/verhindern** die Erkennung (vgl. `network-scanning` 08). Das zeigt die Grenzen signaturbasierter NIDS.

Erkenntnis: Eine Erkennung je Kill-Chain-Phase + das Wissen, **was man NICHT sieht**, ist Detection-Realität.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Kali (nmap, metasploit, msfvenom, C2) | Angriffe erzeugen |
| Suricata Alerts / eve.json | Erkennung prüfen |
| Wireshark/tcpdump | gegenprüfen, was im Klartext sichtbar ist |

## Lab-Setup

- Getunte Suricata (Übung 07) auf dem Pfad zwischen Kali und Ziel. Ziele aus den offensiven Themen.

## Aufgabe (selbst lösen)

1. Fahre einen **Portscan** (verschiedene Timings `-T4` vs. `-T0`) und vergleiche, welche Alerts entstehen – wirkt die Timing-Evasion?
2. Führe einen **bekannten Exploit** (z. B. vsftpd/Samba via Metasploit) gegen ein Ziel aus und finde die passenden Alerts.
3. Erzeuge einen **Reverse-Shell-/C2-Callback** (msfvenom-Payload/Handler) und prüfe, ob Beaconing/Payload erkannt wird.
4. Wiederhole einen Angriff **verschlüsselt/fragmentiert** und zeige, dass/warum die Erkennung schlechter wird.
5. Ordne deine Funde den **Kill-Chain-/ATT&CK-Phasen** zu und notiere, was **nicht** erkannt wurde (Detection-Gaps).

**Ziel:** Erkennung über mehrere Angriffsphasen demonstriert, Evasion-Grenzen erlebt und Detection-Gaps dokumentiert.

## SY0-701 Prüfungsbezug

- **Detection je Kill-Chain-Phase**; signaturbasierte Grenzen (Evasion/TLS) → Bedarf an Anomaly/HIDS/Zeek.
- **MITRE ATT&CK** als Mapping; IoCs.
- Begriffe: *detection*, *evasion*, *beaconing/C2*, *kill chain / ATT&CK*, *detection gap*.
