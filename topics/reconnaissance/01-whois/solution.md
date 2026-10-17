# Lösung – Übung 01: WHOIS

## 1. Domain-WHOIS

```bash
whois example.com
```
Relevante Felder:
```
Registrar: ...
Creation Date: 1995-08-14T04:00:00Z
Registry Expiry Date: 2025-08-13T04:00:00Z
Name Server: A.IANA-SERVERS.NET
Name Server: B.IANA-SERVERS.NET
```
→ Registrar, Erstell-/Ablaufdatum, Name-Server ablesen. Name-Server sind der Sprung zu DNS-Recon (Übung 02/04).

## 2. Privacy / Redaction erkennen

In europäischen/DSGVO-betroffenen Domains stehen bei Registrant/Admin/Tech oft:
```
Registrant Name: REDACTED FOR PRIVACY
Registrant Organization: REDACTED FOR PRIVACY
Registrant Email: https://.../contact  (Weblink statt Adresse)
```
→ Das ist **WHOIS-Privacy / GDPR-Redaction**. Ohne Privacy stünden hier echte Namen/E-Mails/Adressen (Information Disclosure).

## 3. IP-WHOIS (RIR)

Erst IP ermitteln, dann WHOIS auf die IP:
```bash
dig +short example.com          # -> z.B. 93.184.215.14
whois 93.184.215.14
```
Relevante Felder:
```
NetRange / inetnum: 93.184.208.0 - 93.184.223.255
CIDR:               93.184.208.0/20
netname / Organization: ...
source: RIPE            (oder ARIN/APNIC je nach Region)
```
→ Organisation, Netzblock (CIDR) und zuständige **RIR**. Der Netzblock verrät, welche weiteren IPs derselben Organisation gehören könnten.

## 4. Wert für Recon & warum passiv

- **Wertvoll:** Name-Server (DNS-Infrastruktur), Netzblöcke (weitere Ziele), Registrierungs-Timeline, ggf. Kontaktdaten/Technik-Hinweise.
- **Passiv:** Du fragst öffentliche Register (Registrar/RIR), **nicht** das Ziel selbst. Das Zielsystem sieht keinen Traffic von dir → keine Spuren beim Ziel.

## Nützliche Varianten

```bash
whois -h whois.ripe.net 93.184.215.14     # gezielt RIPE-Server
whois -h whois.cymru.com " -v 8.8.8.8"    # Team-Cymru: IP -> ASN/Owner
```

## Häufige Fehler / Troubleshooting

- **`whois` nicht installiert:** `sudo apt install whois`.
- **Leere/komische Ausgabe:** manche TLDs haben eigene WHOIS-Server; `whois` folgt Referrals meist automatisch, sonst `-h <server>` setzen.
- **Rate-Limiting:** zu viele Abfragen → temporär geblockt. Moderat abfragen.
- **„Keine Kontaktdaten":** normal wegen GDPR-Redaction, kein Fehler.
