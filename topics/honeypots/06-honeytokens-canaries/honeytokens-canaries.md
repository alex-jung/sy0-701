# Übung 06 – Honeytokens & Canary-Dateien/-Accounts

**Schwierigkeit: 6/10 · Dauer: ca. 75 Min.**

## Lernziele

- Deception **im eigenen Netz** platzieren (nicht nur exponierte Köder)
- Honeytokens, Honeyfiles und Canary-Accounts erstellen und überwachen
- Die Idee „Breach Detection durch Köder-Nutzung" verstehen

## Theorie

Während ein Honeypot ein ganzes System ist, sind **Honeytokens** winzige Köder, die man **mitten in echte Systeme** streut: ein Fake-AWS-Key in einer Config, ein Fake-DB-Eintrag, eine Köder-Datei `passwords.xlsx`, ein **Canary-Account** im AD, der nie benutzt wird. **Jede** Nutzung = starkes Breach-Signal (jemand bewegt sich lateral / durchsucht Daten).

Umsetzungen:
- **Canarytokens** (canarytokens.org / self-hosted): generiert Token (URL, DNS, Office-Doc, AWS-Key, QR …), die beim Abruf eine Alarm-Mail/Webhook auslösen.
- **OpenCanary / Thinkst Canary:** Köder-Dienste + Canary-Accounts.
- **Eigenbau:** Fake-Account im AD mit Alerting auf Logon-Event (Event-ID 4624/4768), Honeyfile mit Datei-Audit (Zugriff → SIEM-Alarm).

Vorteil: extrem geringe False-Positive-Rate, erkennt Angreifer **nach** dem Perimeter (lateral movement, Insider).

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Canarytokens | generiert Köder-Token mit Alert |
| `opencanary` | Köder-Dienste/Accounts |
| SIEM (Wazuh) | Alert auf Honeyfile-/Account-Nutzung |

## Lab-Setup

- Ein „Produktiv"-ähnliches System im Lab (Linux-Server oder Windows/AD aus `active-directory-attacks`). Wazuh/ELK aus `logging-siem` für File-/Logon-Auditing.

## Aufgabe (selbst lösen)

1. Erzeuge mindestens **drei** verschiedene Canarytokens (z. B. DNS-Token, Web-URL-Token, Office-Doc-Token) und platziere sie glaubwürdig.
2. Löse jeden Token aus und weise den Alarm (Mail/Log) nach.
3. Lege eine **Honeyfile** (`gehaelter_2026.xlsx`) an und konfiguriere **File-Auditing** so, dass ein Lesezugriff im SIEM alarmiert.
4. (Falls AD vorhanden) lege einen **Canary-Account** an und alarmiere auf dessen Logon-Versuch.

**Ziel:** drei ausgelöste Honeytokens + eine SIEM-alarmierende Honeyfile (und optional Canary-Account).

## SY0-701 Prüfungsbezug

- **1.0** *honeyfile*, *honeytoken* als Deception/Disruption-Technologie.
- **4.0** Breach-/Insider-/Lateral-Movement-Erkennung; File Integrity/Audit.
- Begriffe: *honeytoken*, *honeyfile*, *canary*, *lateral movement detection*.
