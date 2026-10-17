# Übung 09 – Shodan & Censys: exponierte Assets

**Schwierigkeit: 9/10 · Dauer: ca. 60 Min.**

## Lernziele

- Shodan/Censys als Suchmaschinen für internetweit **exponierte Geräte/Dienste** verstehen
- Gezielt nach Banner, Ports, Produkten, Organisationen und Schwachstellen suchen
- Den Unterschied zu aktivem Scannen begreifen (Shodan hat schon gescannt)
- Die eigene externe Angriffsfläche beurteilen

## Theorie

**Shodan** und **Censys** scannen kontinuierlich das gesamte IPv4-Internet und indexieren Banner, offene Ports, TLS-Zertifikate, Produkte/Versionen und bekannte Schwachstellen. Für dich ist die Abfrage **völlig passiv** – du durchsuchst deren Index, nicht das Ziel. Dadurch findet man exponierte Datenbanken, Industriesteuerungen (ICS/SCADA), Kameras, RDP, veraltete Dienste – weltweit und in Sekunden.

Nützliche **Shodan-Such-Filter:**

| Filter | Beispiel |
|--------|----------|
| `hostname:` | `hostname:example.com` |
| `net:` | `net:93.184.208.0/20` |
| `org:` | `org:"Example Inc"` |
| `port:` | `port:3389` |
| `product:` | `product:nginx` |
| `country:` / `city:` | `country:DE` |
| `vuln:` | `vuln:CVE-2021-44228` *(Member-Feature)* |
| `ssl.cert.subject.cn:` | nach Zertifikats-CN |

> ⚠️ Abfragen sind passiv und ok. **Beschränke dich auf eigene Assets / eigene Domain / eigenen IP-Bereich.** Fremde exponierte Systeme nicht ansteuern oder ausnutzen.

## Verwendete Tools

| Tool | Zweck | Wichtige Optionen |
|------|-------|-------------------|
| Shodan Web (shodan.io) | GUI-Suche + Host-Detailseiten | Filter s. o. |
| `shodan` (CLI) | Shodan aus dem Terminal | `init <key>`, `host <ip>`, `search <query>`, `count`, `stats` |
| Censys Web/`censys` | Alternative Suchmaschine | `censys search '<query>'` |

## Lab-Setup

- Kali + Internet. **Shodan-Account** (kostenlos) → API-Key. Optional Censys-Account.
- Ziel: deine **eigene** öffentliche IP/Domain bzw. dein Netzblock (aus Übung 01 WHOIS).

## Aufgabe (selbst lösen)

1. Richte die Shodan-CLI mit deinem API-Key ein und hol dir das **Host-Profil deiner eigenen öffentlichen IP** (offene Ports, Banner, Zertifikate).
2. Finde über `hostname:`/`net:` heraus, welche deiner Assets Shodan **bereits indexiert** hat – und welche Dienste es dort sieht.
3. Nutze `count`/`stats`, um z. B. die Verteilung offener RDP-Ports (`port:3389`) in einem Land zu bestimmen (aggregierte, anonyme Statistik – keine Einzelziele ansteuern).
4. Vergleiche Shodans Ergebnis für dein Ziel mit einem eigenen aktiven Scan (aus `network-scanning`): Wo weicht es ab und warum?
5. **Blue-Team-Teil:** Was tust du, wenn Shodan einen Dienst exponiert zeigt, der nicht öffentlich sein sollte?

**Ziel:** deine externe Angriffsfläche so sehen, wie ein Angreifer sie ohne einen einzigen Scan sieht – plus Abgleich mit aktivem Scanning und Remediation.

## SY0-701 Prüfungsbezug

- **Attack Surface Management / external footprint** (4.0): Shodan/Censys als Angreifer- und Verteidiger-Werkzeug.
- **Passive recon / threat intelligence feeds** (2.0): Index statt eigenem Scan.
- **Exposed services / misconfiguration:** offene RDP/DB/ICS als typische Findings; Mitigation = Firewall/Segmentierung/VPN/Abschalten.
- Begriffe: *attack surface management*, *OSINT*, *threat intelligence*, *exposure*, *ICS/SCADA*, *passive recon*.
