# Lösung – Übung 07: Angriffe im Traffic erkennen

## 1. Portscan

```
tcp.flags.syn==1 && tcp.flags.ack==0
```
Muster: **eine Quelle → viele Ziel-Ports**, viele SYN in Sekunden, offene Ports antworten `[SYN,ACK]`, geschlossene `[RST,ACK]`, Scanner vollendet den Handshake nicht. **Statistics → Conversations** zeigt die Fächerung. Bei `-sT` (connect) volle Handshakes + sofortiger RST.

## 2. Brute-Force

```
tcp.port==22        # bzw. http.request.method=="POST" für Web-Login
```
Muster: **viele kurze Verbindungen** zu demselben Dienst von einer Quelle in kurzer Zeit; bei HTTP viele POSTs an die Login-URL mit 401/200-Wechsel. **IO-Graph** zeigt den Burst.

## 3. Exploit

Beispiel vsftpd-Backdoor: FTP-`USER`-Feld mit `:)`-Smiley, danach Verbindung zu **Port 6200** (Backdoor-Shell). Samba usermap: ungewöhnliche Zeichen im Username-Feld. Allgemein: überlange Felder, Shellcode-Bytes, bekannte Trigger-Strings (`frame contains`).

## 4. C2-Beaconing

**Statistics → Conversations** / **IO-Graph** (Intervall fein): ein interner Host kontaktiert **regelmäßig** dasselbe externe Ziel, **gleich große** kurze Verbindungen, feste Abstände (± Jitter). Auch bei HTTP sichtbar; bei HTTPS nur Metadaten (Übung 08). Filter `ip.dst==<C2> && http` bzw. Conversations nach Paketzahl/Zeit.

## 5. IoCs ableiten

| Fund | IoC |
|------|-----|
| Scan | Quell-IP, Scan-Signatur (SYN-Fächer) |
| Brute-Force | Quell-IP, Ziel-Dienst/Port |
| Exploit | Payload-String, Backdoor-Port 6200 |
| C2 | C2-IP/Domain, Intervall, JA3 (Übung 08) |

Diese IoCs ins **SIEM** (Suche über alle Quellen, `logging-siem` 08) und als **Suricata-Regel** (`ids-ips` 05) umsetzen → aus einmaliger Analyse wird dauerhafte Detection.

## Häufige Fehler / Troubleshooting

- **Scan „unsichtbar":** sehr langsames Timing (`-T0`) → über langes Zeitfenster/IO-Graph suchen.
- **C2 über TLS:** Inhalt verschlüsselt → nur Metadaten/Beaconing (Übung 08).
- **Zu viele Pakete:** erst Statistics/Conversations, dann gezielt filtern.
- **Exploit nicht erkannt:** Payload evtl. fragmentiert/verschlüsselt → Stream reassemblieren.
