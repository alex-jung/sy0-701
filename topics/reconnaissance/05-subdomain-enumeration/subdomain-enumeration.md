# Übung 05 – Subdomain-Enumeration (passiv)

**Schwierigkeit: 5/10 · Dauer: ca. 50 Min.**

## Lernziele

- Subdomains eines Ziels finden, ohne es direkt anzugreifen
- **Certificate Transparency (CT)** als mächtige passive Quelle nutzen
- Passive Aggregatoren (`subfinder`, `amass -passive`) einsetzen
- Gefundene Subdomains verifizieren (Resolution) – und Risiken wie Subdomain-Takeover verstehen

## Theorie

Jede Subdomain ist eine potentielle **neue Angriffsfläche** (`dev.`, `staging.`, `vpn.`, `admin.`). Zwei Wege:

- **Passiv (bevorzugt):** Daten aus Dritt-Quellen abgreifen, **ohne** das Ziel zu kontaktieren:
  - **Certificate Transparency Logs** (`crt.sh`): Jedes öffentliche TLS-Zertifikat wird protokolliert – inkl. aller abgedeckten (Sub-)Domains. Extrem ergiebig und völlig passiv.
  - **Passive Aggregatoren** (`subfinder`, `amass -passive`): bündeln viele OSINT-APIs (CT, Suchmaschinen, Threat-Intel).
- **Aktiv (laut):** DNS-Brute-Force (`amass`/`dnsrecon -t brute`) rät Namen aus Wortlisten und fragt den DNS – erzeugt Traffic Richtung Name-Server.

**Subdomain-Takeover:** zeigt eine Subdomain per CNAME auf einen nicht mehr existierenden Cloud-Dienst, kann ein Angreifer diesen Dienst übernehmen – wichtiger Risiko-Begriff.

## Verwendete Tools

| Tool | Zweck | Wichtige Optionen |
|------|-------|-------------------|
| `crt.sh` (Web/`curl`) | CT-Logs abfragen | `?q=%25.<domain>&output=json` |
| `subfinder` | passive Subdomain-Enum | `-d <domain>`, `-silent`, `-all` |
| `amass` | Enum (passiv/aktiv) | `enum -passive -d <domain>`, `-brute` |
| `dnsrecon`/`dnsenum` | DNS-Brute-Force (aktiv) | `-t brute -D <wortliste>` |
| `dig`/`httpx` | Treffer verifizieren | Resolution / Live-Check |

## Lab-Setup

- Kali + Internet. **Passive** Teile: deine eigene Domain oder eine große öffentliche Domain (nur Lesen aus CT-Logs, harmlos).
- **Aktive** Brute-Force-Teile: deine eigene Domain oder den BIND-Server aus Übung 04 (`lab.local`).

## Aufgabe (selbst lösen)

1. Hole über **crt.sh** alle Subdomains aus den Certificate-Transparency-Logs einer Domain und erstelle eine deduplizierte Liste.
2. Ergänze die Liste mit **`subfinder`** und/oder **`amass -passive`**. Wie viele *zusätzliche* Subdomains kommen hinzu?
3. **Verifiziere**, welche der gefundenen Subdomains tatsächlich auflösen (A-Record vorhanden) und welche „live" sind.
4. **Aktiv (nur eigene Domain / lab.local):** führe eine DNS-Brute-Force mit einer kleinen Wortliste durch. Findest du Namen, die in CT-Logs *nicht* auftauchten? Warum?
5. Überlege: Welche Subdomain-Namen deuten auf besonders interessante Ziele hin – und was ist ein Subdomain-Takeover?

**Ziel:** eine verifizierte Subdomain-Liste aus mehreren Quellen plus Verständnis, warum passive CT-Logs und aktives Brute-Forcing unterschiedliche Treffer liefern.

## SY0-701 Prüfungsbezug

- **Attack Surface Management / asset discovery** (4.0): Subdomains = oft vergessene, ungepatchte Assets (*shadow IT*).
- **Certificate Transparency** als Konzept (1.0/3.0): öffentliche Logs für ausgestellte Zertifikate (Nebeneffekt: Subdomain-Leak).
- **Subdomain takeover** als Schwachstellenklasse (dangling DNS / dangling CNAME).
- Begriffe: *passive vs. active recon*, *certificate transparency*, *shadow IT*, *subdomain takeover*, *attack surface*.
