# Übung 08 – GeoIP, Blocklists & DNS-Filtering (Unbound)

**Schwierigkeit: 8/10 · Dauer: ca. 65 Min.**

## Lernziele

- GeoIP-Blocking einrichten (länderbasiert)
- Threat-Intel-Blocklisten automatisiert einbinden
- DNS-Filtering mit Unbound (Blocklisten/DNSBL) nutzen
- Grenzen dieser Kontrollen realistisch einschätzen

## Theorie

Zusätzliche Perimeter-Kontrollen jenseits einfacher Port-Regeln:

- **GeoIP:** blockt/erlaubt Traffic nach **Herkunftsland** (MaxMind-DB). Nützlich, um Angriffsflächen aus Regionen ohne Geschäftsbezug zu reduzieren. **Grenze:** VPN/Proxy/Cloud umgehen Geo leicht → nur grobe Reduktion, kein echter Schutz.
- **Blocklists (URL-Tables, Übung 03):** bekannte bösartige IPs (Threat-Intel) automatisch blocken. **Grenze:** reaktiv, nur bekannte IoCs.
- **DNS-Filtering (Unbound DNSBL):** blockt die **Auflösung** bekannter Malware-/Ads-/Phishing-Domains schon am Resolver → Clients erreichen die Domain gar nicht erst. Wirkt gegen Phishing/C2 über Domainnamen. **Grenze:** DoH/eigene Resolver der Clients umgehen es → DoH blocken/erzwingen, dass interne Clients den Firewall-Resolver nutzen.

Alle drei sind **ergänzende** Layer (Defense in Depth), kein Ersatz für ein sauberes Regelwerk.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Firewall → Aliases (GeoIP) | Länder-Alias |
| Firewall → Aliases (URL Table) | Threat-Blocklists |
| Services → Unbound DNS → Blocklists/DNSBL | DNS-Filtering |
| `dig`/Browser | DNS-Filter testen |

## Lab-Setup

- OPNsense mit Internet. MaxMind-GeoIP (kostenloser Account/Key). Test-Clients, die Unbound als Resolver nutzen.

## Aufgabe (selbst lösen)

1. Richte **GeoIP** ein (MaxMind-Key) und erstelle einen Länder-Alias; blocke eingehend aus Ländern ohne Bezug (+Log).
2. Binde eine **Threat-Intel-Blockliste** (URL-Table) in eine Block-Regel ein (Aufbau aus Übung 03).
3. Aktiviere **Unbound-DNSBL** mit einer Blockliste und teste: eine gelistete Domain darf **nicht** auflösen.
4. Zeige eine **Umgehung** (Client nutzt DoH/8.8.8.8 direkt) und leite daraus die Gegenmaßnahme ab.
5. Bewerte Nutzen/Grenzen jeder der drei Kontrollen.

**Ziel:** GeoIP, eine Threat-Blockliste und DNS-Filtering aktiv – inkl. getesteter Wirkung und verstandener Umgehung/Grenzen.

## SY0-701 Prüfungsbezug

- **GeoIP/geofencing**, **Threat-Intelligence-Blocklisten**, **DNS-Filtering/DNSBL** als Kontrollen.
- **DoH-Umgehung** und die Notwendigkeit, internen DNS zu erzwingen.
- **Defense in Depth**; Grenzen reaktiver/IP-/Geo-basierter Kontrollen.
- Begriffe: *GeoIP/geofencing*, *threat intelligence*, *DNS filtering/sinkhole*, *DoH*, *defense in depth*.
