# Lösung – Übung 07: theHarvester

`<DOMAIN>` = deine eigene Domain.

## 1. Mehrere keyless Quellen

```bash
theHarvester -d <DOMAIN> -b bing,duckduckgo,crtsh,certspotter,hackertarget -l 500
# einzelne Quelle testen, wenn eine zickt:
theHarvester -d <DOMAIN> -b crtsh
```
`-b all` nutzt alle Quellen, scheitert aber oft an fehlenden API-Keys einzelner Module – dann gezielt die keyless Quellen wählen.

## 2. E-Mails & Namensschema

theHarvester listet im Abschnitt `[*] Emails found:` die Adressen. Ableitung:
```
max.mustermann@<DOMAIN>
erika.beispiel@<DOMAIN>
   -> Schema: {vorname}.{nachname}@<DOMAIN>
```
Mit dem Schema + einer Namensliste ließen sich weitere Adressen bilden (Basis für Phishing/Spraying – hier nur zur Analyse, nicht zum Versand).

## 3. Hosts/Subdomains vergleichen

Abschnitt `[*] Hosts found:` enthält Subdomains + IPs. Diff gegen Übung 05:
```bash
theHarvester -d <DOMAIN> -b crtsh -f harvest   # schreibt harvest.json/.html
# Hosts aus JSON ziehen und vergleichen:
jq -r '.hosts[]?' harvest.json | sed 's/:.*//' | sort -u > subs_harvester.txt
comm -3 subs_harvester.txt subs_all.txt        # subs_all.txt aus Übung 05
```
Meist große Überschneidung (beide nutzen CT), theHarvester bringt über Suchmaschinen teils zusätzliche Hosts.

## 4. Report

```bash
theHarvester -d <DOMAIN> -b bing,duckduckgo,crtsh -f report
# erzeugt report.html und report.json
xdg-open report.html
```

## 5. Blue-Team: Exposure & Phishing-Abwehr

- **Weniger öffentliche Mailadressen:** Rollen-Postfächer (`info@`, `kontakt@`) statt persönlicher Adressen im Web; Adressen als Bild/obfuskiert.
- **Anti-Spoofing:** **SPF** (hart `-all`), **DKIM**, **DMARC** (`p=reject`) → erschwert gefälschte Absender.
- **E-Mail-Security-Gateway / Filter**, Anhang-Sandboxing, Link-Rewriting.
- **Security-Awareness-Training** + simulierte Phishing-Tests.
- **MFA** überall → selbst erbeutete Credentials nützen wenig.

## Häufige Fehler / Troubleshooting

- **Quelle liefert nichts / Fehler:** einzelne Module brauchen API-Keys (`/etc/theHarvester/api-keys.yaml`) oder sind rate-limited; keyless Quellen nutzen.
- **`theHarvester` nicht gefunden:** `sudo apt install theharvester` (Binary teils `theHarvester` groß/klein je nach Version).
- **Shodan-Integration (`-s`):** braucht gültigen Shodan-API-Key (siehe Übung 09).
- **Leere Ergebnisse bei kleiner Domain:** normal – wenig öffentlicher Fußabdruck. Technik an eigener Domain üben, nicht an Fremdzielen.
