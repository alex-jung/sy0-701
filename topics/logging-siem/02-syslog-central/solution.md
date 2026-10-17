# Lösung – Übung 02: Zentrales Syslog

`<LOG>` = Log-Server-IP.

## 1. rsyslog-Server

`/etc/rsyslog.d/00-server.conf`:
```
module(load="imtcp")
input(type="imtcp" port="514")
# pro Quell-Host in eigene Datei:
template(name="PerHost" type="string" string="/var/log/remote/%HOSTNAME%/%PROGRAMNAME%.log")
*.* ?PerHost
```
```bash
sudo mkdir -p /var/log/remote
sudo systemctl restart rsyslog
sudo ss -tlnp | grep 514         # lauscht
```

## 2. Linux-Client weiterleiten

`/etc/rsyslog.d/90-forward.conf`:
```
*.*  @@<LOG>:514        # @@ = TCP (@ = UDP)
```
```bash
sudo systemctl restart rsyslog
logger "TEST vom Client"
# auf dem Server:
ls /var/log/remote/<client-hostname>/ ; grep TEST /var/log/remote/<client>/*
```

## 3. OPNsense weiterleiten

**System → Settings → Logging / Logging Targets → Add:** Ziel `<LOG>`, TCP 514, Anwendungen `filter`/`suricata` (Bezug `firewall-opnsense` 06). Eingang auf dem Server prüfen.

## 4. Testereignisse

```bash
# Fehllogin provozieren:
ssh falscheruser@<client>        # mehrfach -> auth-Logs
# Scan (Suricata-Alert via OPNsense):
sudo nmap -sS <ziel>
```
Zentral wiederfinden: `grep -r "Failed password" /var/log/remote/`, Suricata-Alerts im OPNsense-Log-Verzeichnis.

## 5. Integrität/Transport

Ein Angreifer löscht nach Kompromittierung oft `/var/log/*` – die **bereits weitergeleiteten** Einträge liegen aber schon auf dem Log-Server (außerhalb seiner Reichweite). Absichern:
- **TLS** statt Klartext-UDP (Vertraulichkeit/Authentizität),
- Log-Server gehärtet/segmentiert, **append-only/WORM**, restriktiver Zugriff,
- **Zeitsync** für Korrelation.

## Häufige Fehler / Troubleshooting

- **Nichts kommt an:** Firewall-Regel zum Log-Server (514 TCP), `@@` (TCP) vs `@` (UDP), rsyslog neu gestartet.
- **Alles in einer Datei:** Template/Ruleset pro Host nutzen.
- **Zeitverschiebung:** NTP auf allen Quellen.
- **UDP-Verluste:** auf TCP/TLS wechseln.
