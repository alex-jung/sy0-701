# Übung 10 – Vollständige passive OSINT-Aufklärung + Report

**Schwierigkeit: 10/10 · Dauer: ca. 2–3 Std.**

## Lernziele

- Alle Recon-Techniken zu einer methodischen, **rein passiven** Aufklärung kombinieren
- Einen reproduzierbaren OSINT-Workflow aufbauen (Scope → Sammeln → Korrelieren → Report)
- Die vollständige **externe Angriffsfläche** eines autorisierten Ziels dokumentieren
- Findings bewerten und in Remediation-Empfehlungen übersetzen

## Theorie

Eine professionelle Recon-Phase ist **strukturiert und passiv** (solange der Auftrag nichts anderes erlaubt). Bewährter Ablauf:

1. **Scope & Autorisierung:** Welche Domains/IP-Bereiche sind in-scope? Schriftliche Freigabe (*rules of engagement*). Hier: **deine eigene Domain/Infrastruktur.**
2. **Organisation & Register:** WHOIS (Domain + IP), ASN/Netzblöcke, Registrar.
3. **DNS:** A/AAAA/MX/NS/TXT, SPF/DMARC, (AXFR falls erlaubt).
4. **Subdomains:** CT-Logs, passive Aggregatoren → verifizieren.
5. **Web-Footprint:** Technologien, Security-Header, WAF, historische Stände.
6. **People/OSINT:** E-Mails, Namensschema, Dokumente + Metadaten.
7. **Exposure:** Shodan/Censys – was ist von außen sichtbar.
8. **Korrelation & Report:** alles zusammenführen, Attack Surface darstellen, Findings mit Risiko + Empfehlung.

Das beiliegende `recon-workflow.sh` verkettet die **passiven** Schritte. **Lies es, bevor du es nutzt**, und setze `DOMAIN` auf dein autorisiertes Ziel.

## Verwendete Tools

Kombination aus Übung 01–09: `whois`, `dig`, `subfinder`/`amass`, `curl`/`whatweb`/`wafw00f`, `theHarvester`, `exiftool`/`metagoofil`, `shodan` – plus `recon-workflow.sh` (beiliegend).

## Lab-Setup

- Kali + Internet, Tools aus den vorherigen Übungen installiert.
- **Ziel = deine eigene Domain/Infrastruktur** (oder ausdrücklich freigegeben). Für die Shodan-Teile dein API-Key.

## Aufgabe (selbst lösen)

Du bekommst den „Auftrag", die **externe Angriffsfläche deiner eigenen Domain** rein passiv zu kartieren und einen Report zu liefern.

1. **Scope:** lege Ziel-Domain und zugehörige IP-Bereiche fest (WHOIS/ASN). Dokumentiere die Autorisierung.
2. **Sammeln:** führe die passiven Schritte (WHOIS, DNS, Subdomains, Web-Footprint, E-Mails/Metadaten, Shodan) durch – nutze `recon-workflow.sh` als Gerüst und ergänze manuell.
3. **Verifizieren:** welche Subdomains/Hosts leben wirklich, welche Dienste sind von außen erreichbar?
4. **Korrelieren:** baue eine **Attack-Surface-Übersicht** (Domain → Subdomains → IPs/Netzblöcke → Dienste → verratene Infos/E-Mails).
5. **Findings & Risiko:** markiere Schwachpunkte (fehlendes DMARC, exponierte Dienste in Shodan, Metadaten-Leaks, vergessene Subdomains) mit Risiko High/Med/Low + **Empfehlung**.
6. **Report:** erstelle einen strukturierten OSINT-Report (Management-Summary + Details + Empfehlungen) und lege alle Befehle reproduzierbar ab.

**Ziel:** ein vollständiger, reproduzierbarer, rein passiver OSINT-Report über dein eigenes Ziel – das Gesamtprodukt aus Übung 01–09, inkl. priorisierten Empfehlungen.

## SY0-701 Prüfungsbezug

- **Reconnaissance-Phase** im Pentest-/Kill-Chain-Kontext; **rules of engagement / scope / authorization** (2.0/5.0).
- **Attack Surface Management** und **OSINT** als Threat-Intel-Grundlage (4.0).
- **Mitigations zusammengeführt:** SPF/DKIM/DMARC, Metadaten-Scrubbing, Exposure-Reduktion, Asset-Inventory gegen Shadow IT.
- Begriffe: *rules of engagement*, *attack surface management*, *OSINT*, *threat intelligence*, *footprinting*, *data minimization*.
