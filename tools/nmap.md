# nmap

**Kategorie:** Network Scanning · **Benötigt root für:** SYN-/UDP-/OS-Scan, Raw-Discovery

Der De-facto-Standard-Scanner. Findet aktive Hosts, offene Ports, Dienste/Versionen, OS und führt über die **NSE** (Nmap Scripting Engine) Enumeration und Vuln-Checks aus.

```bash
nmap [Scan-Typ] [Optionen] <Ziel>
# Ziel: 192.168.56.100 | 192.168.56.0/24 | 192.168.56.1-50 | -iL hosts.txt
```

## Scan-Typen

| Option | Bedeutung |
|--------|-----------|
| `-sn` | nur Host Discovery (Ping-Scan), keine Ports |
| `-sT` | TCP Connect Scan (voller Handshake, kein root nötig) |
| `-sS` | TCP SYN / „half-open" / Stealth (root, Default als root) |
| `-sU` | UDP-Scan |
| `-sA` | ACK-Scan (Firewall-Mapping: filtered vs. unfiltered) |
| `-sI <zombie>` | Idle/Zombie-Scan (verschleiert Quelle) |

## Ports & Discovery

| Option | Bedeutung |
|--------|-----------|
| `-p 22,80` / `-p 1-1000` / `-p-` | bestimmte / Range / alle 65535 Ports |
| `-F` | Fast: Top-100 Ports |
| `--top-ports N` | die N häufigsten Ports |
| `-Pn` | Discovery überspringen, Host als „up" behandeln (über Firewall) |
| `-PS/-PA/-PU <ports>` | TCP-SYN-/TCP-ACK-/UDP-Ping zur Discovery |
| `-PR` | ARP-Ping (lokal, Default als root) |
| `-n` | keine DNS-Auflösung (schneller) |

## Detection

| Option | Bedeutung |
|--------|-----------|
| `-sV` | Service-/Version-Detection |
| `--version-intensity 0-9` / `--version-all` | Gründlichkeit der Versionsprüfung |
| `-O` | OS-Fingerprinting |
| `--osscan-guess` | OS auch bei schwacher Datenlage raten |
| `-A` | aggressiv = `-sV -O -sC --traceroute` |

## NSE (Scripting)

| Option | Bedeutung |
|--------|-----------|
| `-sC` | Default-Scripts (= `--script default`) |
| `--script <name/kat/wildcard>` | z. B. `vuln`, `smb-enum-shares`, `"smb-*"` |
| `--script-args k=v` | Script-Parameter |
| `--script-help <name>` | Beschreibung eines Scripts |
| `--script-updatedb` | Script-Datenbank aktualisieren |

## Timing & Evasion

| Option | Bedeutung |
|--------|-----------|
| `-T0`…`-T5` | paranoid → insane (langsam/leise ↔ schnell/laut) |
| `--min-rate` / `--max-rate` | Pakete pro Sekunde |
| `--scan-delay <t>` | Pause zwischen Probes |
| `-f` / `--mtu <n>` | Pakete fragmentieren |
| `-D <ip,ip,ME>` / `-D RND:5` | Decoys (Fake-Quell-IPs) |
| `-g` / `--source-port <p>` | Quellport fälschen (z. B. 53) |
| `--spoof-mac <mac/vendor>` | MAC fälschen |

## Output

| Option | Bedeutung |
|--------|-----------|
| `-oN <datei>` | normal (lesbar) |
| `-oG <datei>` | grepbar |
| `-oX <datei>` | XML (→ HTML mit `xsltproc`) |
| `-oA <basis>` | alle drei Formate gleichzeitig |
| `-v` / `-vv` | verbose · `--reason` | warum dieser Port-State |

## Typische Beispiele

```bash
sudo nmap -sn -n 192.168.56.0/24                 # Host Discovery
sudo nmap -sS -p- -T4 192.168.56.100             # alle TCP-Ports
sudo nmap -sV -sC -O 192.168.56.100              # Dienste + OS + Default-NSE
sudo nmap -sU --top-ports 50 192.168.56.100      # UDP Top-50
sudo nmap --script "vuln and safe" 192.168.56.100
sudo nmap -Pn -sV -oA report 192.168.56.100      # über FW + Report
```

## Verwendet in

Übungen 01–10 (durchgehend).
