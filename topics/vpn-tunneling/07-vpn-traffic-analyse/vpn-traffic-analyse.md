# Übung 07 – VPN-Traffic analysieren

**Schwierigkeit: 7/10 · Dauer: ca. 80 Min.**

## Lernziele

- VPN-Verkehr im Netz identifizieren und einordnen
- Verstehen, was verschlüsselt ist und welche **Metadaten** sichtbar bleiben
- Tunnel-Inhalt vor/hinter der Verschlüsselung vergleichen

## Theorie

Aus Blue-Team-/Analyst-Sicht ist wichtig: Ein VPN verschlüsselt den **Payload**, aber nicht die **Metadaten** des äußeren Pakets. Man sieht weiterhin: die **Endpunkt-IPs/Ports** (wer mit welchem Gateway spricht), das **Protokoll** (WireGuard=UDP/51820, OpenVPN=UDP/TCP 1194/443, IPsec=ESP/UDP500/4500), **Volumen/Timing** (Traffic-Analyse) und bei IKE/TLS teils Handshake-Parameter. Der **Inhalt** bleibt verborgen.

Man analysiert auf **zwei** Ebenen: auf dem **physischen/WAN-Interface** nur verschlüsselte Hülle; auf dem **Tunnel-Interface** (`wg0`/`tun0`) der entschlüsselte Klartext (nur am eigenen Endpunkt möglich – das ist legitim, es ist dein Tunnel). Das zeigt eindrücklich, was ein Netz-Mitleser sehen kann und was nicht, und ist relevant für Monitoring, Threat Hunting (verdächtige Tunnel) und Datenschutz.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `tcpdump`/`wireshark`/`tshark` | Capture auf WAN vs. Tunnel |
| Wireshark-Dissectoren | WireGuard/OpenVPN/ESP erkennen |

## Lab-Setup

- Ein aktiver Tunnel (Übung 02–05). Capture-Möglichkeit auf dem WAN-Interface und auf dem Tunnel-Interface deines eigenen Endpunkts.

## Aufgabe (selbst lösen)

1. Capture den Verkehr auf dem **WAN/physischen** Interface während du durch den Tunnel pingst/surfst: identifiziere Protokoll + Endpunkte und zeige, dass der Payload **nicht** lesbar ist.
2. Capture parallel auf dem **Tunnel-Interface** (`wg0`/`tun0`) und zeige denselben Verkehr im **Klartext**.
3. Liste auf, welche **Metadaten** ein externer Mitleser trotz VPN gewinnen kann (IP/Port/Protokoll/Volumen/Timing).
4. Erkenne anhand eines Captures, **welches** VPN-Protokoll genutzt wird (WireGuard vs. OpenVPN vs. IPsec) und woran.

**Ziel:** den Unterschied „verschlüsselte Hülle vs. Klartext im Tunnel" praktisch zeigen und VPN-Metadaten/-Protokoll aus einem Capture bestimmen.

## SY0-701 Prüfungsbezug

- **4.0** traffic analysis, encrypted traffic, metadata, protocol identification, monitoring.
- **3.0** was VPN schützt (Payload) vs. nicht (Metadaten).
- Begriffe: *encrypted payload*, *metadata*, *traffic analysis*, *ESP/UDP4500*, *protocol fingerprinting*.
