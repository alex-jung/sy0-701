# Übung 05 – Protokoll-Analyse (DNS, HTTP, DHCP, ARP)

**Schwierigkeit: 5/10 · Dauer: ca. 55 Min.**

## Lernziele

- Zentrale Protokolle im Capture analysieren: DNS, HTTP, DHCP, ARP
- Normale Abläufe von Anomalien unterscheiden
- Protokoll-spezifische Angriffe erkennen (ARP-Spoofing, DNS-Anomalien)
- Metadaten auch bei fehlendem Payload nutzen

## Theorie

Jedes Protokoll hat einen „normalen" Ablauf, dessen Abweichung verdächtig ist:

- **ARP (L2):** „Wer hat IP X?" → Reply mit MAC. **ARP-Spoofing** = mehrere/gefälschte Replies, eine IP mit wechselnder MAC (MITM-Indikator, vgl. später `network-scanning`).
- **DNS:** Query/Response. Anomalien: ungewöhnlich **lange/zufällige** Namen (DNS-Tunneling/Exfil), viele NXDOMAIN (DGA), TXT-Missbrauch.
- **DHCP:** DISCOVER → OFFER → REQUEST → ACK. **Rogue-DHCP** = fremder Server bietet Leases an.
- **HTTP:** Request/Response; Methoden, Status, Header, User-Agent (Scanner erkennbar), Klartext-Inhalte.

Protokollverständnis macht aus „Paketen" **Bedeutung** – und zeigt Angriffe, die signaturbasiert evtl. durchrutschen.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Wireshark | Protokoll-Dissectors, Statistics |
| Statistics → DNS/HTTP | Protokoll-Statistiken |

## Lab-Setup

- Ein Capture mit gemischtem Verkehr (DNS/HTTP/DHCP/ARP). Optional ein ARP-Spoofing-/DNS-Tunnel-Mitschnitt aus den offensiven Themen.

## Aufgabe (selbst lösen)

1. **DNS:** finde die häufigsten Queries (Statistics) und eine **auffällige** (lang/zufällig) – was könnte das sein (Tunneling/DGA)?
2. **HTTP:** bestimme Methoden/Status-Verteilung und finde einen verdächtigen **User-Agent**.
3. **DHCP:** verfolge einen DORA-Ablauf (Discover/Offer/Request/Ack) – welcher Server vergibt Leases?
4. **ARP:** suche nach Hinweisen auf **ARP-Spoofing** (eine IP, mehrere/wechselnde MACs; „duplicate address").
5. Erkläre je Protokoll ein **Normalverhalten vs. Anomalie**.

**Ziel:** die vier Protokolle sicher lesen und je eine Anomalie/Angriffsindikation erkennen.

## SY0-701 Prüfungsbezug

- **Protokolle** (DNS/HTTP/DHCP/ARP) und ihre Angriffe (**ARP-Spoofing**, **DNS-Tunneling/DGA**, **Rogue DHCP**).
- Anomalie-Erkennung über Protokollverständnis.
- Begriffe: *ARP spoofing*, *DNS tunneling/DGA*, *rogue DHCP*, *protocol analysis*, *user-agent*.
