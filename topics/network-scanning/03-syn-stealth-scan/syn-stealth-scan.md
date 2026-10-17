# Übung 03 – SYN / Stealth Scan & Port States

**Schwierigkeit: 3/10 · Dauer: ca. 40 Min.**

## Lernziele

- Den SYN-Scan (`-sS`, „half-open") vom Connect Scan abgrenzen
- Alle drei Port-States sicher unterscheiden: `open`, `closed`, `filtered`
- Verstehen, warum der SYN-Scan „stealthier" ist – und warum das heute relativ ist

## Theorie

Der **SYN-Scan** (`nmap -sS`, auch *half-open* oder *stealth scan*) vollendet den Handshake **nicht**:

```
nmap → SYN →        Ziel
nmap ← SYN/ACK ←    Ziel      → Port OPEN → nmap sendet RST (bricht ab, kein ACK)
```

- `SYN/ACK` zurück → **open**
- `RST` zurück → **closed**
- **keine Antwort** (oder ICMP „unreachable") → **filtered** (eine Firewall droppt still)

Weil der Handshake nie abgeschlossen wird, wird die Verbindung von Anwendungen oft **nicht geloggt** → „stealth". Moderne IDS/IPS und Firewall-Logs erkennen SYN-Scans aber trotzdem. `-sS` braucht **root** (Raw Sockets) und ist als root der **Default**.

Der dritte State **`filtered`** ist der wichtigste Lerninhalt: nmap kann `open` nicht von „da ist eine Firewall" unterscheiden, wenn einfach **nichts** zurückkommt.

## Verwendete Tools

| Tool | Zweck | Wichtige Optionen |
|------|-------|-------------------|
| `nmap` | SYN-Scan | `-sS` (SYN/stealth), `--reason` (warum dieser State), `-v` (verbose), `-p` |
| `tcpdump`/Wireshark | Handshake-Vergleich | Filter auf `tcp.flags` |

## Lab-Setup

- Kali (root/sudo) + Metasploitable im selben Netz.
- Für den `filtered`-Zustand: Entweder auf dem Ziel eine Host-Firewall-Regel setzen (z. B. `iptables -A INPUT -p tcp --dport 8888 -j DROP`), oder einen Port scannen, der durch OPNsense geblockt wird.

## Aufgabe (selbst lösen)

1. Scanne das Ziel mit `-sS` und vergleiche die Ausgabe mit dem `-sT`-Scan aus Übung 02 – siehst du dieselben offenen Ports?
2. Belege mit `tcpdump`/Wireshark, dass bei `-sS` **kein** abschließendes `ACK` gesendet wird (nur `SYN → SYN/ACK → RST`).
3. Erzeuge gezielt einen **`filtered`**-Port: blockiere auf Metasploitable einen Port per DROP-Regel und scanne ihn. Lass nmap mit `--reason` begründen, warum er `filtered` meldet.
4. Erkläre in eigenen Worten den Unterschied zwischen `closed` und `filtered` – und warum ein Angreifer diesen Unterschied liebt.

**Ziel:** Du kannst die drei States sicher auseinanderhalten und im Paketmitschnitt belegen, was SYN- vom Connect-Scan unterscheidet.

## SY0-701 Prüfungsbezug

- **SYN/half-open/stealth scan** ist expliziter Prüfungsbegriff; Abgrenzung zum „full connect scan".
- **Port States:** `open` (Dienst lauscht), `closed` (erreichbar, kein Dienst), `filtered` (Firewall droppt) – `filtered` zeigt indirekt eine **Firewall/ACL** und ist ein IoC für Netz-Segmentierung.
- **Detection:** IDS/IPS erkennen SYN-Scans über viele halb-offene Verbindungen (auch relevant für *SYN flood* / DoS-Abgrenzung). Domäne 4.0 (Monitoring, IDS/IPS).
- Begriffe: *half-open scan*, *RST*, *filtered*, *firewall/ACL*, *false negative*.
