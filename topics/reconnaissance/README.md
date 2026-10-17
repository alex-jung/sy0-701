# Thema: Reconnaissance (Information Gathering)

Praxis-Übungen zur **Aufklärungsphase** – dem ersten Schritt jeder Kill Chain, *vor* dem aktiven Scannen (`network-scanning`). Schwerpunkt: **passive & semi-passive** Informationsbeschaffung (OSINT), DNS, WHOIS, Subdomains, Suchmaschinen, Metadaten, Shodan.

> ⚠️ **Ethik & Scope – unbedingt lesen.**
> Recon berührt oft reale Dritte. In diesen Übungen gilt:
> - **Aktive** Tests (Scans, Brute-Force, Zonentransfer-Versuche, Exploits) **nur** gegen eigene/ausdrücklich freigegebene Ziele: deine Lab-VMs, deine **eigene** Domain, oder `scanme.nmap.org` (von Nmap offiziell zum Üben freigegeben).
> - **Passive** Lookups in **öffentlichen Registern** (WHOIS, DNS, Certificate Transparency, Suchmaschinen) sind reines Lesen öffentlich verfügbarer Daten – harmlos, aber nutze sie verantwortungsvoll und **nie als Einstieg in einen Angriff** auf fremde Systeme.
> - Fremde Personen/Firmen nicht aktiv „durchleuchten", belästigen oder angreifen. OSINT-Technik lernen ≠ Dritte zum Ziel machen.

## Lernziele

- Passive vs. aktive Reconnaissance sicher unterscheiden
- Die öffentliche Angriffsfläche (Attack Surface) eines Ziels methodisch kartieren
- DNS, WHOIS, Subdomains, Zertifikate, Suchmaschinen und Metadaten als Infoquellen nutzen
- Shodan/Censys für exponierte Assets verstehen
- Ergebnisse zu einem strukturierten OSINT-Report verdichten

## Abgedeckte SY0-701-Domänen

- **2.0 Threats, Vulnerabilities & Mitigations** – Reconnaissance als Angriffsphase, OSINT, Attack Surface, Threat Actors
- **4.0 Security Operations** – Attack Surface Management, Asset Discovery, Threat Intelligence
- **1.0 General Security Concepts** – Datenquellen, Begriffe

## Übungen (Schwierigkeit 1 → 10)

| #  | Übung | Schwierigkeit |
|----|-------|---------------|
| 01 | WHOIS & Domain-Registrierungsdaten | 1/10 |
| 02 | DNS-Records abfragen (dig/host/nslookup) | 2/10 |
| 03 | Web-Footprinting & Technology Fingerprinting | 3/10 |
| 04 | DNS-Zonentransfer (eigenes BIND-Lab) | 4/10 |
| 05 | Subdomain-Enumeration (passiv) | 5/10 |
| 06 | Google Dorking / Search-Engine-Recon | 6/10 |
| 07 | theHarvester – E-Mails, Hosts, OSINT-Aggregation | 7/10 |
| 08 | Metadata Harvesting (Dokumente/Bilder) | 8/10 |
| 09 | Shodan & Censys – exponierte Assets | 9/10 |
| 10 | Vollständige passive OSINT-Aufklärung + Report | 10/10 |

## Übungsziele (autorisiert)

- **Eigene Domain** – wenn du eine besitzt, dein bestes Übungsziel für WHOIS/DNS/Subdomains.
- **`scanme.nmap.org`** – von Nmap zum Üben freigegeben (auch aktiv).
- **Lab-VMs** – für aktive Teile (eigener BIND-Server in Übung 04, DVWA/Metasploitable für Web-Footprinting).
- **`example.com` / `iana.org`** – harmlose Demo-Domains für reine Lesevorgänge (WHOIS/DNS-Struktur zeigen).

## Lab-Voraussetzungen

- **Kali Linux** – `whois`, `dig`/`host`/`nslookup`, `dnsenum`/`dnsrecon`, `whatweb`, `wafw00f`, `subfinder`/`amass`, `theHarvester`, `exiftool`, `metagoofil`, Shodan-CLI
- **Internetzugang** (für öffentliche Register / Shodan)
- **Eigene BIND9-VM** (nur Übung 04, Setup dort beschrieben)
- **DVWA/Metasploitable** (Übung 03 Web-Footprinting)
- Optional: **Shodan-Account** (kostenloser API-Key für Übung 09/10)

Reihenfolge: starte bei `01-whois/`. Pro Übung erst die `.md` lösen, dann `solution.md` öffnen.
