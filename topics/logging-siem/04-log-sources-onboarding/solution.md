# Lösung – Übung 04: Log-Quellen onboarden

`<WAZUH>` = Wazuh-Manager-IP.

## 1. Linux-Agent

Im Dashboard: **Agents → Deploy new agent** → OS/Architektur wählen → generierten Befehl auf dem Host ausführen, z. B.:
```bash
# (Beispiel, Dashboard liefert den exakten Befehl inkl. Paket/Key)
sudo WAZUH_MANAGER="<WAZUH>" apt install ./wazuh-agent.deb
sudo systemctl enable --now wazuh-agent
```
Im Dashboard erscheint der Agent als **active**.

## 2. OPNsense als Syslog

- **OPNsense:** Logging-Target auf `<WAZUH>:514` (Übung 02), Anwendungen `filter`/`suricata`.
- **Wazuh Manager:** Remote-Syslog-Input in `/var/ossec/etc/ossec.conf`:
```xml
<remote>
  <connection>syslog</connection>
  <port>514</port>
  <protocol>udp</protocol>
  <allowed-ips>192.168.1.0/24</allowed-ips>
</remote>
```
Manager neu starten → OPNsense-Events erscheinen unter Security Events.

## 3. Windows + Sysmon

Wazuh-Agent für Windows installieren (`WAZUH_MANAGER` setzen), **Sysmon** mit einer guten Config (z. B. SwiftOnSecurity) installieren; im Agent `ossec.conf` den Sysmon-Eventlog-Kanal (`Microsoft-Windows-Sysmon/Operational`) einbinden.

## 4. Testereignisse

```bash
ssh falsch@<linux-host>           # SSH-Fehllogin -> Agent
sudo nmap -sS <ziel>              # Firewall-Block/Suricata -> OPNsense-Syslog
# Windows: fehlgeschlagener Login -> Security-Event via Sysmon/Agent
```
Im Dashboard (Security Events / Threat Hunting) nach Quelle/Zeit filtern → alle drei sichtbar.

## 5. Coverage-Liste (Beispiel)

| Quelle | Detection-Fähigkeit |
|--------|---------------------|
| Linux-Agent (auth) | Brute-Force, PrivEsc, sudo |
| Linux-Agent FIM | Datei-Manipulation/Persistence |
| OPNsense Syslog | Scans, geblockte Flows, IDS-Alerts |
| Windows+Sysmon | Prozess-Ketten, Lateral Movement, C2 |

## Häufige Fehler / Troubleshooting

- **Agent bleibt „never connected":** `WAZUH_MANAGER`-IP falsch, Port 1514/1515 geblockt, Zeitsync.
- **OPNsense-Events fehlen:** `allowed-ips`/Protokoll/Port, Manager neu gestartet.
- **Sysmon-Events fehlen:** Kanal in agent-`ossec.conf` nicht eingebunden / Sysmon nicht installiert.
- **Zu viel Rauschen:** nur relevante Logs sammeln (Coverage ≠ „alles").
