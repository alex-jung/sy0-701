# Lösung – Übung 08: IOCs & Threat Intel

## 1. IOC-Extraktion

```bash
L=~/cowrie/cowrie/var/log/cowrie/cowrie.json
jq -r '.src_ip' $L | sort -u > ioc_ips.txt
jq -r 'select(.eventid=="cowrie.session.file_download") | .url' $L | sort -u > ioc_urls.txt
jq -r 'select(.shasum!=null) | .shasum' $L | sort -u > ioc_hashes.txt
jq -r 'select(.eventid=="cowrie.client.version") | .version' $L | sort -u > ioc_clients.txt
```

## 2. Pyramid of Pain

| IOC-Typ | Schmerz für Angreifer | Begründung |
|---------|-----------------------|------------|
| Hash (SHA256) | niedrig | ein Byte ändern → neuer Hash |
| IP-Adresse | niedrig–mittel | neue IP/Proxy schnell beschafft |
| Domain | mittel | Registrierung kostet etwas Aufwand |
| Netzwerk-/Host-Artefakt (User-Agent, SSH-Client) | mittel–hoch | im Toolset verankert |
| **TTP** (Verhaltenskette) | **hoch** | ändert der Angreifer nur mit echtem Umbau seiner Vorgehensweise |

## 3. TTP-Detection (Beispiel)

Beobachtet: erfolgreicher SSH-Login → sofort `wget`/`curl` eines ausführbaren Files → `chmod +x` → Ausführung.
Suricata-Idee (Download einer ELF-Binary über HTTP nach SSH):
```
alert http any any -> any any (msg:"Honeypot TTP: ELF download after SSH login"; \
  flow:established,to_server; http.uri; content:".sh"; nocase; \
  classtype:trojan-activity; sid:9000001; rev:1;)
```
SIEM-Regel (Pseudo): `cowrie.login.success` gefolgt (gleiche Session) von `cowrie.command.input` mit `wget|curl` + `chmod +x` innerhalb 60 s → High-Alert.

## 4. Verwertung

```bash
# OPNsense: ioc_ips.txt als URL-Table/Alias importieren -> Block-Regel WAN.
# Suricata: drop-Regeln / IP-Reputation-Liste.
```
Hash → YARA-Hash-Regel bzw. Hash-Watchlist im SIEM/AV; Sample zur `malware-analysis`.

## Härtung/Betrieb

- Lab-eigene/Test-IPs nicht „blind" sharen; beim echten Betrieb Datenschutz/Legalität beachten.
- IOCs mit Zeitstempel & Confidence versehen; veraltete IOCs ablaufen lassen.

## Häufige Fehler / Troubleshooting

- Nur Hashes/IPs blocken (unterste Pyramid-Ebene) → geringer Effekt; TTPs priorisieren.
- Eigene Test-IP (Kali) landet in der Blockliste → Lab-Quellen ausnehmen.
- Keine Deduplizierung → aufgeblähte, unbrauchbare Listen.
