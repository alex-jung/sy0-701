# Lösung – Übung 02: DNS-Records

## 1. Grund-Records

```bash
dig +short example.com A
dig +short example.com AAAA
dig +short example.com NS
dig +short example.com MX
dig example.com SOA +noall +answer
```
`+short` gibt nur die Werte; ohne `+short` siehst du zusätzlich Header/TTL/Flags. SOA zeigt den primären NS + **Serial** (Zonen-Version).

## 2. TXT / SPF / DMARC

```bash
dig +short example.com TXT
dig +short _dmarc.example.com TXT
dig +short default._domainkey.example.com TXT   # DKIM (Selektor variiert)
```
Beispiel:
```
"v=spf1 include:_spf.google.com ~all"        -> nutzt Google Workspace für Mail
"v=DMARC1; p=reject; rua=mailto:..."         -> DMARC aktiv, Policy reject
```
→ `include:_spf.google.com` verrät **Google** als Mail-Provider; andere `include:`-Einträge zeigen weitere Dienste. Fehlendes/`~all`-schwaches SPF oder fehlendes DMARC = Spoofing-Risiko.

## 3. CNAME → Cloud/CDN

```bash
dig +short www.example.com CNAME
dig www.example.com +noall +answer
```
Zeigt z. B. `d1234.cloudfront.net.` (AWS CloudFront), `*.azurewebsites.net` (Azure), `ghs.googlehosted.com` → verrät den Hoster/Stack.

## 4. Reverse-Lookup (PTR)

```bash
dig -x 93.184.215.14 +short
# oder:
host 93.184.215.14
```
Gibt den PTR-Namen – oft Hoster-Muster wie `ec2-…​.compute.amazonaws.com`.

## 5. Tool-Vergleich

```bash
host -t MX example.com
nslookup -type=MX example.com
dig +short example.com MX
```
- `dig +short` → ideal für Scripting/schnelle Werte.
- `host` → schnelle einzeilige Antworten, gut für PTR.
- `nslookup` → auf allen OS vorhanden (auch Windows), interaktiver Modus; sonst am wenigsten flexibel.

## Nützlich

```bash
dig @8.8.8.8 example.com A            # bestimmten Resolver fragen
dig example.com ANY                   # (oft gefiltert/deprecated, trotzdem testen)
for t in A AAAA NS MX TXT SOA; do echo "== $t =="; dig +short example.com $t; done
```

## Häufige Fehler / Troubleshooting

- **`ANY` liefert wenig:** viele Resolver beantworten `ANY` bewusst nicht mehr (RFC 8482). Einzeln abfragen.
- **DKIM leer:** Selektor unbekannt – DKIM-Selektoren sind nicht ratbar; aus E-Mail-Headern oder Standard-Selektoren (`google`, `selector1`) ableiten.
- **Interne Namen fehlen:** öffentliches DNS zeigt nur öffentliche Records; interne Zonen erst per Zonentransfer/intern (Übung 04).
- **Caching täuscht aktuelle Werte vor:** TTL beachten; ggf. direkt den autoritativen NS fragen (`@<ns>`).
