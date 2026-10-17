# Übung 06 – Detection-Regeln schreiben

**Schwierigkeit: 6/10 · Dauer: ca. 70 Min.**

## Lernziele

- Wazuh-Rules verstehen (Level, Match, Frequency/Correlation)
- Eigene Detection-Regeln schreiben (einzelne Events + Schwellen)
- Regeln auf MITRE ATT&CK mappen
- Von „Event" zu „actionable Alert" kommen

## Theorie

Eine **Detection-Regel** entscheidet, ob aus geparsten Events ein **Alert** wird und mit welcher **Severity (Level)**. Wazuh-Rules können:
- auf **einzelne Events** matchen (Decoder-Feld/Regex, z. B. „SSH failed"),
- über **Frequency** korrelieren (z. B. „N failed logins in M Sekunden → Brute-Force"), per `frequency`/`timeframe`/`if_matched_sid`,
- auf **ATT&CK-Techniken** gemappt werden (Kontext/Reporting).

Gute Regeln sind **präzise** (wenig FP), **actionable** (ein Alert = Handlungsbedarf) und priorisiert (Level). Das ist **Detection Engineering** auf Log-Ebene (analog zu Suricata-Regeln im `ids-ips`-Thema, hier host-/log-basiert).

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Management → Rules (local_rules.xml) | eigene Regeln |
| `wazuh-logtest` | Regel gegen Logzeile testen |
| Dashboard | Alerts prüfen, ATT&CK-Modul |

## Lab-Setup

- Wazuh mit onboardeten Quellen + geparsten Feldern (Übung 04/05). Kali zum Auslösen.

## Aufgabe (selbst lösen)

1. Schreibe eine Regel, die ein **einzelnes** sicherheitsrelevantes Event höher einstuft (z. B. „sudo zu root" / „neuer User angelegt") und teste sie mit `wazuh-logtest`.
2. Schreibe eine **Korrelations-/Frequency-Regel**: „≥ N SSH-Fehllogins von derselben IP in M Sekunden → Brute-Force-Alert (Level hoch)".
3. Löse beide mit Kali aus (sudo-Aktion + `hydra`/mehrere Fehllogins) und verifiziere die Alerts.
4. Mappe eine Regel auf eine **MITRE-ATT&CK**-Technik.
5. Erkläre den Unterschied Einzel-Event- vs. Korrelations-Regel und was eine Regel „actionable" macht.

**Ziel:** mindestens zwei eigene, getestete Detection-Regeln (Einzel-Event + Frequency/Brute-Force), eine davon ATT&CK-gemappt.

## SY0-701 Prüfungsbezug

- **Detection rules / correlation**, Schwellen (Brute-Force), Severity/Priorisierung.
- **MITRE ATT&CK**-Mapping, actionable Alerts, False-Positive-Vermeidung.
- Begriffe: *detection rule*, *correlation*, *threshold/frequency*, *MITRE ATT&CK*, *alert severity*.
