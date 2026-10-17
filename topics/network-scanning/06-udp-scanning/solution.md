# Lösung – Übung 06: UDP Scanning

## 1. Top-UDP-Ports scannen

```bash
sudo nmap -sU --top-ports 50 <ZIEL>
```
Beispiel:
```
PORT    STATE         SERVICE
53/udp  open          domain
69/udp  open|filtered tftp
111/udp open          rpcbind
137/udp open          netbios-ns
161/udp open|filtered snmp
```
`open` = klare Antwort bekommen; `open|filtered` = keine Antwort (könnte offen oder geblockt sein).

## 2. Gezielt + Version-Detection

```bash
sudo nmap -sU -sV -p 53,161 <ZIEL>
```
`-sV` sendet protokollspezifische Probes (echte DNS-/SNMP-Anfragen). Antwortet der Dienst darauf, wird aus `open|filtered` ein sicheres `open`:
```
53/udp  open  domain  ISC BIND 9.4.2
161/udp open  snmp    SNMPv1 server; net-snmp SNMPv3 server (public)
```

SNMP zusätzlich mit NSE bestätigen/auslesen:
```bash
sudo nmap -sU -p 161 --script snmp-info,snmp-sysdescr <ZIEL>
```

## 3. ICMP Port Unreachable beobachten

Terminal 1:
```bash
sudo tcpdump -ni eth0 icmp
```
Terminal 2 (geschlossener UDP-Port):
```bash
sudo nmap -sU -p 9999 <ZIEL>
```
Mitschnitt:
```
ZIEL > Kali: ICMP <ZIEL> udp port 9999 unreachable, length ...
```
→ Dieses ICMP Typ 3/Code 3 ist genau das Signal, an dem nmap `closed` festmacht.

## 4. Warum open|filtered & warum so langsam

- **open|filtered:** Offene UDP-Dienste müssen auf ein leeres Probe **nicht** antworten. Keine Antwort ⇒ nmap kann „offen (nur still)" nicht von „Firewall droppt" trennen.
- **Langsam:** `closed` wird nur über ICMP-Unreachable erkannt, und Kernels **rate-limiten** diese ICMP-Fehler (Linux z. B. ~1/s). nmap muss warten + mehrfach retransmittieren. `-sU -p-` = 65535 Ports × Timeouts → Stunden.

## 5. UDP-Scan beschleunigen (sinnvoll)

```bash
# nur die relevanten Ports + schnelleres Timing + Mindestrate
sudo nmap -sU -p 53,69,123,161,500,514,1900 -T4 --min-rate 1000 <ZIEL>
```
Begründung:
- **Portauswahl** statt `-p-`: die paar praktisch relevanten UDP-Dienste bringen 95 % des Werts bei Bruchteil der Zeit.
- `-T4` + `--min-rate`: mehr Pakete/Sekunde. **Vorsicht:** zu hohe Rate provoziert mehr ICMP-Rate-Limiting und *mehr* `open|filtered` (Pakete gehen verloren). Also mit Augenmaß.

## Häufige Fehler / Troubleshooting

- **Fast alles `open|filtered`:** normal bei UDP; mit `-sV`/NSE gezielt verifizieren.
- **Scan hängt ewig:** nicht `-p-` für UDP; auf Top-Ports eingrenzen.
- **SNMP nicht gefunden:** auf Metasploitable 2 ist SNMP nicht immer an – ggf. `snmpd` installieren/starten, Community `public` setzen.
- **Zu aggressiv → weniger Treffer:** sehr hohe `--min-rate` lässt Antworten verloren gehen; moderat bleiben.
