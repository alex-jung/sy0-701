# Übung 06 – UDP Scanning

**Schwierigkeit: 6/10 · Dauer: ca. 50 Min.**

## Lernziele

- Verstehen, warum UDP-Scanning fundamental anders (und schwieriger) ist als TCP
- Wichtige UDP-Dienste erkennen: DNS (53), SNMP (161), TFTP (69), NTP (123)
- `open|filtered` korrekt interpretieren
- UDP-Scans sinnvoll beschleunigen

## Theorie

UDP ist **verbindungslos** – es gibt keinen Handshake. Das macht Scannen tückisch:

- Sendet man ein UDP-Paket an einen **offenen** Port, antwortet der Dienst oft **gar nicht** (oder nur protokollspezifisch) → nmap kann `open` nicht sicher von „geblockt" unterscheiden → State **`open|filtered`**.
- Ist der Port **geschlossen**, schickt das OS ein **ICMP Port Unreachable (Typ 3, Code 3)** → nmap erkennt `closed`.
- Weil ICMP-Fehler oft **rate-limited** sind, muss nmap lange warten/retransmittieren → UDP-Scans sind **sehr langsam**.

Deshalb scannt man UDP meist **gezielt** auf die wichtigsten Ports, nicht alle 65535. Mit protokollspezifischen Probes (`-sV` / NSE) bekommt man oft doch ein klares `open`.

## Verwendete Tools

| Tool | Zweck | Wichtige Optionen |
|------|-------|-------------------|
| `nmap` | UDP-Scan | `-sU`, kombinierbar mit `-sV`, `--top-ports N`, `-p U:53,161,...` |
| `nmap` + NSE | UDP-Dienste bestätigen | `--script` (z. B. `snmp-info`, `dns-recursion`) |
| `tcpdump` | ICMP-Unreachable sehen | Filter `icmp` |

## Lab-Setup

- Kali (root) + Metasploitable (hat u. a. DNS 53, SNMP ggf., NFS-bezogene UDP-Dienste).
- Optional SNMP auf einem Ziel aktivieren, um 161/udp „offen" zu sehen.

## Aufgabe (selbst lösen)

1. Scanne die **Top-UDP-Ports** des Ziels. Welche erscheinen als `open` bzw. `open|filtered`?
2. Scanne gezielt **53 (DNS)** und **161 (SNMP)** und kombiniere mit `-sV`, um aus `open|filtered` ein klares `open` zu machen.
3. Beobachte mit `tcpdump` die **ICMP Port Unreachable**-Pakete für einen geschlossenen UDP-Port.
4. Erkläre: Warum liefert UDP so oft `open|filtered`, und warum dauert ein `-sU -p-` extrem lange?
5. Beschleunige deinen UDP-Scan sinnvoll (ohne alle Ports) und begründe deine Wahl.

**Ziel:** Du findest die relevanten UDP-Dienste, verstehst `open|filtered` und kannst UDP-Scans praktikabel halten.

## SY0-701 Prüfungsbezug

- **UDP-Dienste als Angriffsfläche:** DNS (53), SNMP (161/162), TFTP (69), NTP (123), SNMP-/NTP-/DNS-**Amplification** bei DDoS. Prüfung fragt Ports und Protokoll-Eigenschaften.
- **SNMP** mit Default-Community `public` ist ein klassisches Finding (Information Disclosure). Begriffe: *SNMPv1/v2c vs. v3*, *community string*.
- **Connectionless protocol:** warum UDP schwerer zu scannen/absichern ist – IDS/Firewall-Kontext (4.0).
- Begriffe: *ICMP port unreachable*, *open|filtered*, *amplification/reflection attack*, *rate limiting*.
