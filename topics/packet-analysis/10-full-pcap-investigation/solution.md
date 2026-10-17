# Lösung – Übung 10: PCAP-Investigation

Beispiel-Untersuchung eines mehrstufigen Angriffs-PCAPs. `pcap-investigation-template.md` ist das Gerüst.

## 1. Überblick

```bash
tshark -r cap.pcap -q -z io,phs            # Protokoll-Hierarchie
tshark -r cap.pcap -q -z conv,ip | head    # Top-Talker
capinfos cap.pcap                          # Zeitraum, Paketzahl, Hash
```
Erste Hypothese: ein interner Host spricht auffällig mit einer externen IP + viele SYN von einer Quelle.

## 2. Scoping

Verdächtige Hosts eingrenzen:
```
ip.addr == <angreifer> || ip.addr == <C2>
```

## 3. Analyse je Phase

- **Scan:** `tcp.flags.syn==1 && tcp.flags.ack==0` → SYN-Fächer (Übung 07).
- **Exploit:** Follow Stream der FTP-/SMB-Verbindung → Backdoor-Trigger, Shell auf Port 6200.
- **C2:** Conversations/IO-Graph → regelmäßige Verbindungen zu `<C2>`; bei TLS JA3/SNI (Übung 08).
- **Exfil:** großer Outbound-Transfer oder DNS-Tunnel (`dns.qry.name`-Länge, Übung 05).

## 4. Artefakte & IoCs

```bash
# Klartext-Credentials:
tshark -r cap.pcap -Y 'ftp.request.command=="PASS"' -T fields -e ftp.request.arg
# Dateien: Wireshark Export Objects
# IoCs sammeln: Angreifer-IP, C2-IP/Domain, JA3, Backdoor-Port
```

## 5. Timeline + Report

`pcap-investigation-template.md` ausfüllen: Timeline (t0 Scan → t1 Exploit → t2 C2 → t3 Exfil) mit **Nachweis je Zeile** (Paketnummer/Stream/tshark-Befehl), IoCs, Befunde, Empfehlungen + abgeleitete Detection-Regeln (→ `ids-ips`/`logging-siem`).

## Kernaussagen (Prüfung)

- **Methodisch**: Überblick → Scoping → Phasenanalyse → Artefakte → Timeline → Report.
- **Belegt & reproduzierbar**: jeder Befund mit Paket/Stream/Befehl (Beweiskraft, Chain-of-Custody-Denke).
- **Anschluss**: IoCs/Timeline → IDS-Regeln, SIEM-Watchlists, Incident Response.
- Capture = **Ground Truth**, aber bei TLS nur Metadaten (Grenzen kennen).

## Häufige Fehler / Troubleshooting

- **Planloses Klicken:** erst Statistics/Scoping, dann Detail.
- **Befund ohne Nachweis:** Paketnummer/Stream/Befehl dokumentieren, sonst nicht belastbar.
- **PCAP-Integrität:** Hash (`capinfos`/`sha256sum`) festhalten; Original read-only.
- **TLS-C2 „unsichtbar":** Metadaten/JA3 nutzen, nicht am Payload verzweifeln.
