# Übung 03 – Alerts erzeugen & auswerten

**Schwierigkeit: 3/10 · Dauer: ca. 50 Min.**

## Lernziele

- Alerts gezielt erzeugen (verschiedene Angriffstypen)
- Die Bestandteile eines Alerts lesen (Signatur, SID, Severity, Flow)
- Das EVE-JSON-Log verstehen und durchsuchen
- Von Alert zu Ursache/Kontext kommen (Triage-Basis)

## Theorie

Ein Suricata-**Alert** enthält mehr als „etwas passierte": **Signatur-Text** (Beschreibung), **SID** (Rule-ID), **Kategorie/Classtype**, **Severity/Priority**, **Timestamp**, **Src/Dst IP:Port**, Protokoll, Flow-Richtung. Das maschinenlesbare **EVE-JSON** (`eve.json`) ist die Grundlage für SIEM/Analyse (alerts, flows, dns, http, tls, …).

**Triage** heißt: Alert verstehen → ist es echt (True Positive) oder False Positive? → Kontext (was lief davor/danach?) → Severity bewerten → reagieren. Dafür muss man Alerts lesen und korrelieren können (Bezug zu `logging-siem`).

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Services → Intrusion Detection → Alerts | Alerts in der UI |
| `eve.json` (`/var/log/suricata/`) | Roh-Logs, `jq`-Analyse |
| Kali-Angriffstools | Alerts erzeugen |

## Lab-Setup

- Laufende Suricata (Übung 02). Kali + internes Ziel (Metasploitable/DVWA).

## Aufgabe (selbst lösen)

1. Erzeuge **drei verschiedene** Alert-Typen: einen **Portscan** (nmap), einen **Web-Angriff** (z. B. `nikto`/SQLi gegen DVWA) und einen **bekannten Exploit/Backdoor** (z. B. vsftpd/MS-Scan).
2. Lies je einen Alert vollständig: **Signatur, SID, Classtype, Severity, Src/Dst**.
3. Finde dieselben Alerts im **`eve.json`** und filtere mit `jq` nach Signatur/Severity/Quelle.
4. Korreliere: welcher Alert gehört zu welcher deiner Aktionen (Zeit/Quelle)?
5. Bewerte je Alert grob True/False Positive und Severity (Triage).

**Ziel:** verschiedene Alerts erzeugt, vollständig gelesen, im EVE-JSON wiedergefunden und einer Ursache zugeordnet (Triage-Grundlage).

## SY0-701 Prüfungsbezug

- **Alerting / Alert-Triage**, Severity/Priorisierung, **True/False Positive**.
- **EVE-JSON/Logging** → SIEM-Anbindung.
- Begriffe: *alert*, *signature/SID*, *classtype/severity*, *triage*, *true/false positive*.
