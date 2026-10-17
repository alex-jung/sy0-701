# rsyslog

**Kategorie:** Logging (zentrale Sammlung/Weiterleitung)

Der Standard-Syslog-Daemon auf den meisten Linux-Systemen. Dient als **Client** (leitet lokale Logs weiter) und als **zentraler Server** (nimmt Remote-Logs an, sortiert/speichert sie) – Vorstufe/Input fürs SIEM.

## Konfiguration

Dateien: `/etc/rsyslog.conf` + `/etc/rsyslog.d/*.conf`.

**Server (empfängt):**
```
module(load="imtcp")
input(type="imtcp" port="514")
template(name="PerHost" type="string" string="/var/log/remote/%HOSTNAME%/%PROGRAMNAME%.log")
*.* ?PerHost
```
**Client (sendet):**
```
*.*  @@<server>:514      # @@ = TCP, @ = UDP
```

## Transport

- `@` UDP 514 (unzuverlässig, unverschlüsselt), `@@` TCP (zuverlässiger), **TLS/RELP** (verschlüsselt, empfohlen).

## Hinweise

- `logger "msg"` zum Testen; `systemctl restart rsyslog` nach Änderungen.
- Zeitsync (NTP) + Log-Integrität (append-only/WORM) beachten.
- Alternativen: syslog-ng; Weiterleitung an Wazuh/ELK möglich.

## Verwendet in

logging-siem 02 (zentrales Syslog), Bezug 04 (Quellen onboarden).
