# Lösung – Übung 10: Vollständige Netz-Enumeration mit Reporting

Dies ist eine **Beispiel-Durchführung**. Passe Netz/IPs an dein Lab an. Das beiliegende `enum-workflow.sh` automatisiert die Phasen 1–3+5; hier die Schritte einzeln erklärt.

## Phase 1 – Discovery

```bash
sudo nmap -sn -n 192.168.56.0/24 -oG hosts.gnmap
awk '/Up$/{print $2}' hosts.gnmap > live_hosts.txt
```
Über eine Firewall-Grenze stattdessen `-Pn` + TCP-Ping (`-PS80,443`) wie in Übung 09.

## Phase 2 – Breite (masscan)

```bash
sudo masscan -iL live_hosts.txt -p1-65535 --rate 1000 -oL masscan.txt
awk '/^open/{print $4":"$3}' masscan.txt | sort -u > open_ports.txt
```
`masscan` sweept das ganze /24 in Sekunden statt Stunden. `--rate` im Lab moderat halten (zu hoch → Paketverlust, zu aggressiv für kleine VMs). Alternativ schnelles nmap:
```bash
sudo nmap -sS -T4 --min-rate 1000 -p- -iL live_hosts.txt -oA breadth
```

## Phase 3 – Tiefe (nmap)

Pro Host nur die gefundenen offenen Ports tief scannen:
```bash
sudo nmap -Pn -sV -sC -O -p 21,22,80,139,445,3306,5432 \
  --script "vuln and safe" -oA nmap_192.168.56.100 192.168.56.100
```
Dazu UDP-Top-Ports:
```bash
sudo nmap -sU --top-ports 25 -oA nmap_udp_192.168.56.100 192.168.56.100
```

## Phase 4 – Korrelation (Findings → CVE → Risiko)

Beispiel-Findings für Metasploitable 2:

| Host | Port | Dienst/Version | Finding / CVE | Risiko |
|------|------|----------------|---------------|--------|
| .100 | 21 | vsftpd 2.3.4 | Backdoor (OSVDB-73573), RCE als root | **High** |
| .100 | 139/445 | Samba 3.0.20 | usermap_script CVE-2007-2447, RCE | **High** |
| .100 | 6667 | UnrealIRCd 3.2.8.1 | Backdoor CVE-2010-2075, RCE | **High** |
| .100 | 80 | Apache 2.2.8 / PHP 5.2 | veraltet, diverse CVEs | Med |
| .100 | 3306 | MySQL 5.0.51a | schwache/leere Root-Creds möglich | Med |
| .100 | 5900 | VNC | schwaches Passwort | Med |

Risiko grob nach **CVSS** + Erreichbarkeit (aus Übung 09: ist der Port vom Angreifer-Segment überhaupt erreichbar?).

## Phase 5 – Report

Maschinenlesbar speichern und in HTML wandeln:
```bash
# -oA schreibt .nmap/.gnmap/.xml in einem Rutsch
sudo nmap -Pn -sV -sC -O -p <ports> -oA final_<host> <host>
# XML -> HTML
xsltproc final_<host>.xml -o final_<host>.html
```
Report-Struktur (pro Host): **Offene Ports → Dienste/Versionen → Top-Findings (CVE + CVSS) → Empfehlung** (patchen/abschalten/segmentieren). Plus ein Management-Summary in 3–4 Sätzen.

## Reproduzierbarkeit

Alle Befehle + `enum-workflow.sh` + die `-oA`-Dateien im Scan-Ordner ablegen. Ein Kollege kann mit dem Skript (nach Anpassung von `NET`/`IFACE`) den Lauf 1:1 wiederholen – genau das erwartet ein echter Pentest-Report („reproducible evidence").

## Skript ausführen

```bash
chmod +x enum-workflow.sh
sudo ./enum-workflow.sh        # vorher NET/IFACE im Skript anpassen!
```

## Häufige Fehler / Troubleshooting

- **masscan + nmap gleichzeitig:** nicht parallel auf dasselbe Ziel (verfälscht States). Erst masscan (Breite), dann nmap (Tiefe).
- **masscan findet weniger als nmap:** `--rate` zu hoch → Paketverlust; reduzieren oder `--retries` erhöhen.
- **`xsltproc`/`nmap.xsl` fehlt:** `apt install xsltproc`; nmap-XML referenziert `nmap.xsl` – ggf. mit `--stylesheet` den Pfad angeben.
- **Zu viele vuln-Scripts = sehr langsam/intrusiv:** `"vuln and safe"` begrenzt auf ungefährliche Checks.
- **Über Firewall-Grenze keine Hosts:** `-Pn` nicht vergessen (siehe Übung 09).
