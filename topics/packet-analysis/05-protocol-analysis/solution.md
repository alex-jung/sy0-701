# Lösung – Übung 05: Protokoll-Analyse

## 1. DNS

```
dns
```
**Statistics → DNS:** häufigste Queries. Auffällig: sehr **lange/zufällige** Subdomains (`a7f3k9...​.exfil.example.com`) = DNS-Tunneling/Exfil (Bezug `post-exploitation-pivoting` 08); viele **NXDOMAIN** zu zufälligen Namen = DGA-Verdacht.

## 2. HTTP

```
http.request              # alle Requests (Methode/URI/Host)
http.response.code        # Status-Verteilung
http.user_agent contains "nikto"   # Scanner-UA
```
Verdächtige User-Agents (`sqlmap`, `nikto`, `Nmap`) oder viele 404/500 in kurzer Zeit = Scan/Fuzzing.

## 3. DHCP (DORA)

```
dhcp   (bzw. bootp)
```
Ablauf: **Discover → Offer → Request → Ack**. Der **Offer/Ack** nennt den DHCP-Server. Mehrere/unerwartete Server, die Offers senden = **Rogue DHCP** (MITM/Umleitung).

## 4. ARP-Spoofing

```
arp
arp.duplicate-address-detected     # Wireshark-Hinweis
```
Indikator: **eine IP** erscheint mit **wechselnder/zwei MACs**, viele unaufgeforderte ARP-Replies (gratuitous), „duplicate IP address" → MITM via ARP-Spoofing.

## 5. Normal vs. Anomalie (je Protokoll)

| Protokoll | Normal | Anomalie |
|-----------|--------|----------|
| DNS | kurze bekannte Namen, A/AAAA | lange/zufällige Namen, TXT-Massen, viele NXDOMAIN |
| HTTP | normale UAs, 200/301 | Scanner-UA, 404/500-Flut, verdächtige URIs |
| DHCP | ein bekannter Server | fremder Server vergibt Leases |
| ARP | 1 IP ↔ 1 MAC | 1 IP ↔ mehrere MACs, gratuitous ARP |

## Häufige Fehler / Troubleshooting

- **HTTP leer:** Traffic ist HTTPS (verschlüsselt, Übung 08) → nur TLS sichtbar.
- **DNS über TCP/DoH:** große/verschlüsselte DNS-Antworten sehen anders aus; DoH ist TLS.
- **ARP „normal":** im kleinen Lab wenig ARP – ggf. Spoofing-Capture aus einer Angriffsübung nutzen.
- **Falscher Port:** „Decode As", wenn Dienst auf Nicht-Standardport läuft.
