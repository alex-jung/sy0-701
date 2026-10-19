# Dionaea

**Kategorie:** Honeypot (Multi-Service, low-interaction, Malware-Capture)

Emuliert mehrere verwundbare Dienste (SMB/445, HTTP/80, FTP/21, MSSQL/1433, MySQL, SIP, TFTP) mit dem Ziel, **Malware/Payloads einzufangen** und zu speichern. Klassisch für SMB-Würmer.

```bash
# Docker:
docker run -d --name dionaea -p 445:445 -p 21:21 -p 80:80 -p 1433:1433 \
  -v $PWD/dionaea:/opt/dionaea/var dinotools/dionaea
```

## Wichtige Pfade

| Pfad | Zweck |
|------|-------|
| `var/dionaea/dionaea.sqlite` | Verbindungen/Events (SQLite) |
| `var/dionaea/binaries/` | eingefangene Samples (SHA-benannt) = IOCs |
| `etc/dionaea/dionaea.cfg` | aktive Dienste/Module |

## Hinweise

Eingefangene Binaries **nie ausführen** – nur hashen/zur `malware-analysis`. Portkonflikte mit echten Host-Diensten vermeiden (dedizierte VM). Egress sperren. Bestandteil von T-Pot.

## Verwendet in

honeypots 04 (Dienst-Honeypots), 08 (IOCs), 10.
