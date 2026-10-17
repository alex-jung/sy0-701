# Übung 04 – Log-Quellen onboarden

**Schwierigkeit: 4/10 · Dauer: ca. 70 Min.**

## Lernziele

- Wazuh-Agents auf Endpunkten installieren und registrieren
- Syslog-Quellen (OPNsense/Netzgeräte) ins SIEM einbinden
- Windows-Events + Sysmon onboarden (falls Windows im Lab)
- Log-Coverage als Voraussetzung für Detection verstehen

## Theorie

Ein SIEM ist nur so gut wie seine **Datenquellen** (Log Coverage). Wege, Quellen zu onboarden:

- **Agent-basiert (bevorzugt für Hosts):** Wazuh-Agent sammelt lokale Logs, macht **FIM** (File Integrity Monitoring), SCA, Prozess-/Netz-Events. Agent registriert sich beim Manager.
- **Syslog/agentless:** Netzgeräte/Firewalls (OPNsense) senden Syslog an den Manager (Remote Syslog Input) oder an den rsyslog-Server, der weiterreicht.
- **Windows:** Wazuh-Agent + **Sysmon** (detaillierte Prozess-/Netz-/Datei-Telemetrie) → sehr wertvoll für Detection.

Wichtig ist **relevante** Coverage: die Quellen, die Angriffe sichtbar machen (auth, Firewall, IDS, Sysmon, Web/DB), nicht „alles" (Rauschen/Kosten).

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Wazuh Agent | Host-Onboarding (Linux/Windows) |
| Wazuh Manager → Remote Syslog | agentless Quellen |
| Sysmon (Windows) | Endpoint-Telemetrie |

## Lab-Setup

- Laufender Wazuh (Übung 03). Ein Linux-Host, OPNsense, optional Windows.

## Aufgabe (selbst lösen)

1. Installiere einen **Wazuh-Agent** auf einem Linux-Host, registriere ihn und verifiziere, dass er im Dashboard als „active" erscheint.
2. Binde **OPNsense** als Syslog-Quelle ein (Firewall/Suricata-Logs landen im SIEM).
3. (Falls Windows) onboarde einen Windows-Host mit Agent + **Sysmon**.
4. Erzeuge auf jeder Quelle ein Testereignis (SSH-Fehllogin, Firewall-Block, Windows-Login) und finde es im Dashboard.
5. Erstelle eine **Log-Coverage-Liste**: welche Quelle liefert welche Detection-Fähigkeit?

**Ziel:** mindestens zwei onboardete Quellen (Host-Agent + OPNsense-Syslog), deren Events im SIEM sichtbar sind, plus eine Coverage-Liste.

## SY0-701 Prüfungsbezug

- **Log sources / coverage**, agent- vs. agentless-Collection, **Sysmon** als Endpoint-Telemetrie.
- **FIM**, Endpoint-Logging; Qualität vor Quantität.
- Begriffe: *log source onboarding*, *agent*, *syslog input*, *Sysmon*, *file integrity monitoring (FIM)*.
