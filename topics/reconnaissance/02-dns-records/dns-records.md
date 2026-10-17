# Übung 02 – DNS-Records abfragen

**Schwierigkeit: 2/10 · Dauer: ca. 35 Min.**

## Lernziele

- Die wichtigsten DNS-Record-Typen kennen und abfragen
- `dig`, `host`, `nslookup` sicher bedienen
- Forward- und Reverse-Lookups durchführen
- Aus DNS-Records Infrastruktur ableiten (Mail, Services, Hoster)

## Theorie

**DNS** übersetzt Namen ↔ IP und speichert weit mehr als nur Adressen. Die Abfrage öffentlicher DNS-Records ist **passiv** (du fragst Resolver/öffentliche Name-Server, nicht das Ziel direkt).

Wichtige Record-Typen:

| Typ | Bedeutung |
|-----|-----------|
| `A` / `AAAA` | Name → IPv4 / IPv6 |
| `NS` | zuständige Name-Server der Zone |
| `MX` | Mailserver (+ Priorität) |
| `TXT` | frei; oft **SPF**, **DKIM**, **DMARC**, Verifizierungs-Tokens |
| `CNAME` | Alias auf anderen Namen (verrät oft Cloud/CDN/SaaS) |
| `SOA` | Start of Authority (Zonen-Metadaten, Serial) |
| `PTR` | Reverse: IP → Name |
| `SRV` | Dienst-Records (z. B. `_sip._tcp`, AD-Dienste) |

**TXT-Records** sind für Recon besonders ergiebig: SPF listet erlaubte Mail-Sender (oft weitere Hostnamen/Dienste), Verifizierungs-Tokens verraten genutzte SaaS (Google, Microsoft 365 …).

## Verwendete Tools

| Tool | Zweck | Wichtige Optionen |
|------|-------|-------------------|
| `dig` | mächtigste DNS-Abfrage | `dig <domain> <typ>`, `+short`, `@<server>`, `-x <ip>` (reverse), `ANY` |
| `host` | kompakte Abfrage | `host -t <typ> <domain>`, `host <ip>` |
| `nslookup` | klassisch/interaktiv | `nslookup -type=<typ> <domain>` |

## Lab-Setup

- Kali + Internet. Ziele: eigene Domain und/oder `iana.org`, `example.com`.
- Optional eigenen Resolver testen: `@1.1.1.1`, `@8.8.8.8`.

## Aufgabe (selbst lösen)

1. Ermittle für eine Domain alle **A/AAAA**, **NS**, **MX** und **SOA**-Records.
2. Lies die **TXT**-Records aus. Findest du **SPF/DMARC**? Welche externen Dienste/Mail-Provider lassen sich daraus ableiten?
3. Finde einen **CNAME**, der auf einen Cloud-/CDN-/SaaS-Anbieter zeigt (z. B. `*.cloudfront.net`, `*.azurewebsites.net`).
4. Mache einen **Reverse-Lookup** (PTR) für eine aufgelöste IP.
5. Vergleiche `dig +short`, `host` und `nslookup` für denselben Record – welches Tool nutzt du wofür?

**Ziel:** ein DNS-Profil der Domain (Hosts, Mail, Name-Server, verratene Dienste) – die Basis für Subdomain-Enum (Übung 05) und Zonentransfer (Übung 04).

## SY0-701 Prüfungsbezug

- **DNS als OSINT-Quelle** und **Attack Surface**: MX/TXT/CNAME verraten Infrastruktur und Drittanbieter (Supply-Chain-Sicht).
- **E-Mail-Security-Records:** **SPF, DKIM, DMARC** sind explizite Prüfungsthemen (Anti-Spoofing/Phishing-Schutz). Fehlen sie, ist Spoofing leichter.
- **DNS-Konzepte:** Record-Typen, Resolver, Authoritative Server; Angriffe wie *DNS poisoning* (hier nur Kontext).
- Begriffe: *SPF/DKIM/DMARC*, *MX/NS/TXT/CNAME/PTR*, *authoritative name server*, *OSINT*.
