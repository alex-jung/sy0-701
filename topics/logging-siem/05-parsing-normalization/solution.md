# Lösung – Übung 05: Parsing & Normalisierung

## 1. logtest mit bekannter Zeile

```bash
sudo /var/ossec/bin/wazuh-logtest
# Eingabe (SSH-Fehllogin):
Oct 17 10:00:00 host sshd[123]: Failed password for root from 1.2.3.4 port 22 ssh2
```
Ausgabe zeigt: **decoder:** `sshd`, extrahierte Felder `srcip=1.2.3.4`, `dstuser=root`, und eine gematchte **rule** (z. B. 5710 „sshd: authentication failed").

## 2. Unerkannte Custom-Zeile

```
2026-10-17 10:00:00 MYAPP LOGINFAIL user=alice ip=10.0.0.5 action=denied
```
`wazuh-logtest`: kein passender Decoder → keine Felder/keine Rule (phase 1 leer). Das Event wäre im SIEM nur „Rohtext", nicht durchsuchbar.

## 3. Eigener Decoder

`/var/ossec/etc/decoders/local_decoder.xml`:
```xml
<decoder name="myapp">
  <program_name>MYAPP</program_name>
</decoder>
<decoder name="myapp-login">
  <parent>myapp</parent>
  <regex>user=(\S+) ip=(\S+) action=(\S+)</regex>
  <order>srcuser,srcip,action</order>
</decoder>
```
(Bei nicht-syslog-Format ggf. `prematch` statt `program_name`.) Manager neu laden/`wazuh-logtest` erneut → Felder `srcuser/srcip/action` erscheinen.

## 4. Durchsuchbar

Im Dashboard **Discover/Threat Hunting**: nach `srcip:10.0.0.5` oder `action:denied` filtern → das Custom-Event ist jetzt feldbasiert auffindbar.

## 5. Normalisierung & Korrelation

Nur wenn `srcip` aus **allen** Quellen gleich heißt (einheitliches Schema), kann man quellenübergreifend fragen „alle Events von 10.0.0.5" (Firewall + Host + App). Uneinheitliche Felder (`ip` vs `src` vs `source_address`) machen Korrelation unmöglich → Normalisierung ist Pflicht.

## Häufige Fehler / Troubleshooting

- **Decoder greift nicht:** `program_name`/`prematch` passt nicht; Regex testen mit `wazuh-logtest`.
- **Falsche Feldreihenfolge:** `<order>` muss zu den Regex-Gruppen passen.
- **Rule fehlt:** Decoder extrahiert Felder, aber ohne Rule kein Alert → eigene Rule (Übung 06).
- **Änderung wirkt nicht:** Manager neu starten / logtest neu laden.
