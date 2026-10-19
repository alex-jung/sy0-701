# Lösung – Übung 07: VPN-Traffic-Analyse

## 1. WAN-Capture (verschlüsselt)

```bash
sudo tcpdump -ni eth0 -X udp port 51820        # WireGuard
# bzw. 'udp port 1194', 'tcp port 443', 'esp or udp port 4500' (IPsec)
```
Sichtbar: Quell-/Ziel-IP + Port, Protokoll, Paketgrößen/Timing. Der `-X`-Hexdump zeigt **nur Zufallsbytes** (kein ICMP/HTTP-Klartext).

## 2. Tunnel-Capture (Klartext)

```bash
sudo tcpdump -ni wg0 -X        # bzw. tun0
# hier erscheinen ICMP-Echo, DNS, HTTP etc. im Klartext (entschlüsselt am eigenen Endpunkt)
```
Gleiche Pakete, aber lesbar → belegt, dass die Verschlüsselung „auf der Leitung" wirkt.

## 3. Sichtbare Metadaten trotz VPN

- Äußere **IPs/Ports** beider Endpunkte (wer mit welchem Gateway).
- **Protokoll**/Port → welches VPN.
- **Volumen & Timing** (Traffic-Analyse, Website-Fingerprinting teils möglich).
- Bei IKE/TLS: einige Handshake-Infos (Versionen, teils SNI bei TLS ohne ECH).
Nicht sichtbar: der eigentliche **Inhalt**.

## 4. Protokoll erkennen

| Merkmal | Protokoll |
|---------|-----------|
| UDP, 1 fixer Port (oft 51820), kurze Header, kein TLS-Handshake | WireGuard |
| UDP/TCP 1194 oder TCP 443 mit TLS-Handshake | OpenVPN |
| IKE auf UDP 500, dann ESP bzw. UDP 4500 (NAT-T) | IPsec |

Wireshark-Dissector (`wg`, `openvpn`, `esp`) bestätigt die Zuordnung.

## Hinweise / Troubleshooting

- Tunnel-Interface-Capture geht nur am **eigenen** Endpunkt (du besitzt den Key) – ein Mitleser im Netz kann das nicht.
- `-X`/`-A` für Payload-Ansicht; ohne Key ist der WAN-Payload prinzipiell nicht entschlüsselbar.
- Für Monitoring: ungewöhnliche/ungenehmigte Tunnel (z. B. DNS-Tunneling, VPN über 443 zu unbekannten IPs) sind Threat-Hunting-Signale.
