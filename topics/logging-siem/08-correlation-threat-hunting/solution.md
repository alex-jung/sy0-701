# Lösung – Übung 08: Korrelation & Threat Hunting

## 1. Mehrstufige Attacke

```bash
sudo nmap -sS -p- <ZIEL>                               # Scan
# Metasploit: vsftpd/Samba-Exploit -> Shell            # Exploit
# Reverse-Shell / Loot / Zugriff auf 2. Host           # Post-Exploitation
```

## 2. Korrelation / Timeline

Im **Threat Hunting / Discover**: Filter auf `data.srcip:<KALI>` (bzw. die Angreifer-IP) über das Zeitfenster. Nach Zeit sortieren → Timeline:
```
t0  OPNsense: viele Blocks/SCAN-Alerts von <KALI>        (Recon)
t1  Suricata: ET EXPLOIT vsftpd/Samba                    (Exploitation)
t2  Host-Agent: neuer Prozess/Shell, uid=0               (Execution/PrivEsc)
t3  Firewall/Zeek: Outbound zu <KALI>:4444               (C2)
t4  2. Host: Login/SMB von kompromittiertem Host         (Lateral Movement)
```
Fünf Quellen, **eine** Kette.

## 3. Threat Hunt (Hypothese)

Hypothese „Brute-Force → erfolgreicher Login":
```
rule.id:5710  (failed) gruppiert nach data.srcip  -> IP mit vielen Fehlern
dann:  data.srcip:<diese IP> AND rule.id:5715 (Accepted)  -> erfolgreicher Login danach?
```
Treffer = kompromittiertes Konto; kein Treffer = Hypothese widerlegt.

## 4. IoC-Suche

Angreifer-IP / Hash über **alle** Indizes suchen (`<KALI-IP>` in Firewall-, IDS-, Host-Events). So sieht man die komplette Reichweite eines IoC im Netz.

## 5. ATT&CK-Timeline (dokumentiert)

| Zeit | ATT&CK | Technik | Quelle |
|------|--------|---------|--------|
| t0 | TA0043 | Active Scanning (T1595) | OPNsense/Suricata |
| t1 | TA0002 | Exploitation (T1203) | Suricata |
| t2 | TA0004 | PrivEsc (T1068/T1548) | Host-Agent |
| t3 | TA0011 | C2 (T1071) | Zeek/Firewall |
| t4 | TA0008 | Lateral Movement (T1021) | Host/SMB |

## Härtung/Betrieb

Korrelation braucht Normalisierung + Zeitsync; Hunts als wiederkehrende „Saved Searches"; gefundene Lücken → neue Detection-Regel (Übung 06). Übergang zu Incident Response.

## Häufige Fehler / Troubleshooting

- **Keine Korrelation möglich:** Zeit nicht synchron / Felder uneinheitlich (Übung 05) → zuerst beheben.
- **Quelle fehlt in Timeline:** nicht onboardet (Übung 04) → Coverage-Gap.
- **Hunt findet nichts:** Hypothese/Felder prüfen; nicht jede Hypothese trifft (das ist ok).
- **Zu großes Zeitfenster:** eingrenzen, sonst unübersichtlich.
