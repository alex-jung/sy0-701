# Lösung – Übung 04: Dionaea & Co.

## 1. Dionaea aufsetzen + Scan

Docker-Variante (einfach):
```bash
docker run -d --name dionaea -p 21:21 -p 80:80 -p 445:445 -p 1433:1433 \
  -v $PWD/dionaea:/opt/dionaea/var dinotools/dionaea
nmap -sV -p 21,80,445,1433 <honeypot-ip>   # von Kali: Dienste erscheinen "offen"
```

## 2. Interaktion + Logs

```bash
# SMB-Connect und HTTP-Request von Kali:
smbclient -L //<honeypot-ip>/ -N
curl http://<honeypot-ip>/
# Events in SQLite:
sqlite3 dionaea/dionaea.sqlite "select * from connections order by connection_timestamp desc limit 10;"
ls dionaea/binaries/     # eingefangene Payloads (SHA-benannt) = IOCs
```

## 3. OpenCanary

```bash
pip install opencanary
opencanaryd --copyconfig        # ~/.opencanary.conf
# Dienste aktivieren (z.B. "ftp.enabled": true, "http.enabled": true, "mysql.enabled": true)
opencanaryd --start
# Alert auslösen: curl http://<ip>/  oder ftp-Login-Versuch
tail -f /var/tmp/opencanary.log   # JSON-Alert mit src_host, logtype
```

## 4. Tool-Auswahl (Beispiel)

| Zweck | Honeypot |
|-------|----------|
| SSH/Telnet, Shell-TTPs | **Cowrie** |
| Malware einfangen (SMB/HTTP/FTP) | **Dionaea** |
| Breite, leichte Abdeckung + simple Alerts | **OpenCanary** |
| ICS/SCADA | **Conpot** |
| Web-Apps | Glastopf / SNARE+Tanner |

## Härtung/Betrieb

- Eingefangene Binaries nie ausführen; nur hashen/zur Malware-Analyse (`malware-analysis`).
- Egress strikt sperren; Honeypot-VLAN isoliert.

## Häufige Fehler / Troubleshooting

- Portkonflikt mit echten Host-Diensten → Honeypot auf dediziertem Host/VM.
- Dionaea-DB leer → Pfad/Volume falsch gemountet.
- OpenCanary ohne Alert-Ziel → zunächst nur File-Log, später Mail/Webhook/Syslog konfigurieren.
