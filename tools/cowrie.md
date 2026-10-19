# Cowrie

**Kategorie:** Honeypot (SSH/Telnet, medium-interaction)

Emuliert einen SSH-/Telnet-Server mit **gefälschter Shell**. Angreifer „loggen sich ein", setzen Befehle ab und „laden Dateien herunter" – alles wird protokolliert, ohne ein echtes OS freizugeben. Nachfolger von Kippo.

```bash
bin/cowrie start | stop | status
```

## Wichtige Pfade/Optionen

| Pfad/Option | Zweck |
|-------------|-------|
| `etc/cowrie.cfg` | Hauptkonfig (Ports, Hostname, Output-Plugins) |
| `etc/userdb.txt` | welche User/Passwörter „funktionieren" |
| `var/log/cowrie/cowrie.json` | strukturierte JSON-Events (für jq/SIEM) |
| `var/lib/cowrie/downloads/` | eingefangene Payloads (SHA-benannt) |
| `var/lib/cowrie/tty/` | Session-Aufzeichnungen (`cowrie-playlog`) |
| Default-Ports | SSH 2222 / Telnet 2223 (extern via NAT 22/23) |

## Wichtige Events (eventid)

`cowrie.login.success|failed`, `cowrie.command.input`, `cowrie.session.file_download`, `cowrie.client.version`.

## Hinweise

Unprivilegiert betreiben; echten Admin-SSH auf anderen Port. Port 22→2222 per `iptables REDIRECT`. Egress hart filtern (sonst echter Download/Pivot). Default-Banner → leicht als Honeypot erkennbar, ggf. anpassen.

## Verwendet in

honeypots 02 (Setup), 03 (Auswertung), 07 (Visualisierung), 08 (IOCs), 10 (Capstone).
