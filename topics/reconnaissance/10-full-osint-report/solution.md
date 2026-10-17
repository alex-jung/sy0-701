# Lösung – Übung 10: Vollständige passive OSINT-Aufklärung

Beispiel-Durchführung gegen die **eigene** Domain. `recon-workflow.sh` automatisiert die passiven Schritte; hier der Ablauf + die Report-Struktur.

## 1. Scope & Autorisierung

- Ziel-Domain festlegen; IP/ASN via WHOIS (Übung 01).
- **Rules of Engagement** notieren: nur passive Quellen, nur eigene Assets, keine aktiven Scans/Brute-Force ohne gesonderte Freigabe.

```bash
whois <DOMAIN> | grep -Ei 'registrar|name server|creation|expir'
IP=$(dig +short <DOMAIN> A | head -n1); whois "$IP" | grep -Ei 'inetnum|netrange|cidr|org|source'
```

## 2. Sammeln (Workflow ausführen)

```bash
chmod +x recon-workflow.sh
# DOMAIN im Skript setzen (und USE_SHODAN=yes, falls CLI+Key vorhanden)
./recon-workflow.sh
```
Erzeugt im Ausgabeordner: `whois_*.txt`, `dns_records.txt`, `subs_*.txt`, `web_headers.txt`, `whatweb.txt`, optional `shodan_host.txt`.

Manuell ergänzen (aus Übung 06–08):
```bash
theHarvester -d <DOMAIN> -b bing,duckduckgo,crtsh -f harvest    # Mails/Hosts
# Google-Dorks im Browser: site:<DOMAIN> filetype:pdf  usw.
metagoofil -d <DOMAIN> -t pdf,docx -l 25 -o docs_out            # + exiftool
```

## 3. Verifizieren

`subs_resolving.txt` (vom Skript) listet lebende Subdomains. Für Erreichbarkeit/Dienste:
```bash
httpx -l subs_resolving.txt -silent -status-code -title -tech-detect
```

## 4. Attack-Surface-Übersicht (Korrelation)

Beispiel-Struktur:
```
<DOMAIN>  (Registrar X, erstellt 20xx, NS: ns1/ns2)
├── Netzblock 203.0.113.0/24 (Org Y, RIPE)
├── MX: mail.<DOMAIN> -> Google Workspace (SPF include:_spf.google.com)
├── DMARC: p=none            [FINDING]
├── Subdomains (auflösend):
│   ├── www      -> 203.0.113.10  (nginx, HSTS fehlt)
│   ├── vpn      -> 203.0.113.11  (in Shodan: port 443 sichtbar)
│   ├── dev      -> 203.0.113.12  (in Shodan: port 22 offen)  [FINDING]
│   └── old      -> CNAME auf totes S3-Bucket                 [FINDING: Takeover?]
├── E-Mails: {vorname.nachname}@<DOMAIN> (Schema)
└── Dokumente: Autor "m.mustermann", Word 2016 (Metadaten)
```

## 5. Findings & Risiko

| Finding | Risiko | Empfehlung |
|---------|--------|------------|
| DMARC-Policy `p=none` (kein Enforcement) | **High** | auf `p=quarantine`→`reject` erhöhen; DKIM prüfen |
| `dev.` mit offenem SSH in Shodan sichtbar | **High** | hinter VPN/Firewall, Management-Port schließen |
| `old.` zeigt auf gelöschtes Cloud-Bucket | **High** | dangling DNS-Record entfernen (Takeover-Schutz) |
| Metadaten mit echten Usernamen in PDFs | Med | Dokumente vor Upload scrubben (`exiftool -all=`) |
| Fehlende Security-Header (HSTS/CSP) | Med | Header am Webserver setzen |
| E-Mail-Namensschema öffentlich ableitbar | Low | Awareness/Anti-Phishing, MFA |

Risiko grob nach Erreichbarkeit + potenziellem Impact (CVSS-Denke).

## 6. Report-Struktur

1. **Management Summary** (3–5 Sätze: wie groß ist die externe Angriffsfläche, Top-3-Risiken).
2. **Scope & Methodik** (Ziel, Zeitraum, nur passive Quellen, Tools).
3. **Ergebnisse** (WHOIS/DNS/Subdomains/Web/OSINT/Shodan).
4. **Findings & Empfehlungen** (Tabelle oben, priorisiert).
5. **Anhang:** alle Befehle + Ausgabeordner → reproduzierbar.

## Skript ausführen

```bash
chmod +x recon-workflow.sh
./recon-workflow.sh      # vorher DOMAIN (und ggf. USE_SHODAN) setzen!
```

## Häufige Fehler / Troubleshooting

- **`jq`/`subfinder`/`whatweb`/`shodan` fehlen:** entsprechende Pakete installieren; das Skript überspringt fehlende Tools, statt abzubrechen.
- **crt.sh langsam/leer:** erneut versuchen; Subfinder liefert dann die Hauptmenge.
- **Shodan-Teil leer:** `USE_SHODAN=yes` + `shodan init <key>`; bei dynamischer Privat-IP hinter NAT ist nichts indexiert.
- **Versuchung, aktiv zu werden:** dieses Skript bleibt passiv. Aktive Scans gehören ins Thema `network-scanning` – und nur gegen freigegebene Ziele.
