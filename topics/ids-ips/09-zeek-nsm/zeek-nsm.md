# Übung 09 – Network Security Monitoring mit Zeek

**Schwierigkeit: 9/10 · Dauer: ca. 75 Min.**

## Lernziele

- Zeek als Network Security Monitor (NSM) verstehen – Metadaten statt nur Signaturen
- Zeek-Logs auswerten (conn, dns, http, ssl, files, notice)
- Beaconing/Anomalien erkennen, die signaturbasiert unsichtbar sind
- Zeek und Suricata als komplementäre Ansätze einordnen

## Theorie

**Zeek** (früher Bro) ist kein klassisches Signatur-IDS, sondern ein **Network Security Monitor**: es protokolliert **strukturierte Metadaten** zu allen Verbindungen – unabhängig davon, ob eine Signatur existiert. Logs u. a.:
- **conn.log** (jede Verbindung: Dauer, Bytes, Zustand),
- **dns.log**, **http.log**, **ssl.log** (inkl. **JA3**-Fingerprints), **files.log**, **x509.log**,
- **notice.log** (Zeeks eigene Auffälligkeiten), **weird.log**.

Stärke: Zeek sieht **auch bei TLS** die Metadaten (wer-mit-wem, wie oft, JA3, Zertifikate) → ideal für **Beaconing-/Anomalie-Analyse** und Threat Hunting, wo signaturbasierte NIDS blind sind (vgl. Übung 08). Zeek + Suricata = **komplementär** (Metadaten/Verhalten + Signaturen).

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `zeek` | NSM, erzeugt Logs |
| `zeek-cut` / `jq` | Logs auswerten |
| Angriffs-Traffic (Kali/C2) | Daten erzeugen |

## Lab-Setup

- Ein Linux-Host/VM mit **Zeek**, der den relevanten Traffic sieht (Mirror/Span oder inline). Alternativ Zeek über eine aufgezeichnete `.pcap` laufen lassen.

## Aufgabe (selbst lösen)

1. Lass Zeek Traffic verarbeiten (live auf dem Interface **oder** `zeek -r capture.pcap`) und sichte die erzeugten Logs.
2. Analysiere **conn.log**: welche Hosts sprechen mit wem, welche Verbindungen fallen durch Dauer/Häufigkeit auf?
3. Nutze **dns.log/http.log/ssl.log**: finde verdächtige Domains/User-Agents/JA3-Fingerprints.
4. Erkenne ein **C2-Beaconing** anhand regelmäßiger Verbindungen (gleiches Ziel, feste Intervalle) – auch wenn TLS-verschlüsselt.
5. Erkläre, warum Zeek Dinge findet, die Suricata (signaturbasiert) übersieht, und wie beide zusammenspielen.

**Ziel:** Zeek-Logs ausgewertet, ein TLS-C2-Beaconing über Metadaten erkannt und den komplementären Nutzen zu Suricata verstanden.

## SY0-701 Prüfungsbezug

- **Network Security Monitoring / flow analysis**, Metadaten statt Payload-Signaturen.
- **Anomaly-/behavior-based detection**, Beaconing, JA3/TLS-Fingerprinting, Threat Hunting.
- Begriffe: *NSM*, *flow/connection logs*, *anomaly detection*, *beaconing*, *JA3*, *threat hunting*.
