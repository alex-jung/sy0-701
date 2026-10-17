# Lösung – Übung 08: GeoIP, Blocklists, DNS-Filtering

## 1. GeoIP

- **Firewall → Aliases:** MaxMind-Key hinterlegen (System → Firewall → ... bzw. im Alias-Dialog), Typ **GeoIP**, Länder wählen → Alias `Block_Countries`.
- WAN-Regel oben: `Block  Source Block_Countries -> any  (+Log)`.
Test: Zugriff aus einem gelisteten Land/VPN-Exit → geblockt (Log).

## 2. Threat-Blockliste

URL-Table-Alias `Blocklist_Threat` (Übung 03) in WAN-Regel:
```
Block Source Blocklist_Threat -> any   (+Log)
Block Source any -> Blocklist_Threat
```
Diagnostics → Aliases: geladene IPs prüfen.

## 3. Unbound-DNSBL

**Services → Unbound DNS → Blocklist:** eine oder mehrere DNSBL-Quellen aktivieren (z. B. Malware-/Ads-Listen) → Apply. Test vom Client (der Unbound nutzt):
```bash
dig <gelistete-malware-domain> @<OPNsense-IP>
# -> 0.0.0.0 / NXDOMAIN (geblockt)
dig example.com @<OPNsense-IP>
# -> normale Antwort
```

## 4. Umgehung + Gegenmaßnahme

```bash
dig <gelistete-domain> @8.8.8.8      # umgeht Unbound komplett
# DoH im Browser nutzt ebenfalls externen Resolver -> DNSBL wirkungslos
```
**Gegenmaßnahme:** ausgehend **DNS (53) nur zur Firewall** erlauben, externes 53 blocken (Floating/Egress, Übung 07); **DoH/DoT blocken** (bekannte DoH-IPs/Port 853) bzw. per Policy erzwingen, dass Clients den internen Resolver nutzen.

## 5. Nutzen/Grenzen

| Kontrolle | Nutzen | Grenze |
|-----------|--------|--------|
| GeoIP | reduziert Angriffsfläche aus irrelevanten Regionen | VPN/Cloud/Proxy umgehen |
| Blocklists | blockt bekannte bösartige IPs | reaktiv, nur bekannte IoCs |
| DNS-Filter | stoppt Phishing/C2 per Domain früh | DoH/eigener Resolver umgeht |

→ Alle drei sind **ergänzende** Layer (Defense in Depth), kein Ersatz fürs Regelwerk/Segmentierung.

## Häufige Fehler / Troubleshooting

- **GeoIP lädt nicht:** MaxMind-Key/Lizenz fehlt oder abgelaufen.
- **DNSBL ohne Wirkung:** Clients nutzen nicht Unbound → DHCP muss die Firewall als DNS pushen; externes 53/DoH blocken.
- **Zu aggressive Blockliste:** legitime Seiten betroffen → Whitelist/andere Liste.
- **Performance:** sehr große Listen kosten RAM/CPU auf kleiner OPNsense-VM.
