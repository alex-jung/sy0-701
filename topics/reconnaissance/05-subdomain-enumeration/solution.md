# Lösung – Übung 05: Subdomain-Enumeration

`<DOMAIN>` = deine eigene / eine große öffentliche Domain.

## 1. Certificate Transparency (crt.sh) – passiv

```bash
curl -sS "https://crt.sh/?q=%25.<DOMAIN>&output=json" \
  | jq -r '.[].name_value' \
  | sed 's/\*\.//g' | tr 'A-Z' 'a-z' | sort -u > subs_crtsh.txt
wc -l subs_crtsh.txt
```
`%25` = URL-codiertes `%` (Wildcard). `jq` extrahiert `name_value`; `sort -u` dedupliziert. CT-Logs liefern oft dutzende Subdomains – komplett passiv (du fragst crt.sh, nicht das Ziel).

## 2. subfinder / amass (passiv)

```bash
subfinder -d <DOMAIN> -all -silent | sort -u > subs_subfinder.txt
amass enum -passive -d <DOMAIN> -silent | sort -u > subs_amass.txt

# zusammenführen
cat subs_crtsh.txt subs_subfinder.txt subs_amass.txt | sort -u > subs_all.txt
# Nur das Delta gegenüber crt.sh sehen:
comm -13 subs_crtsh.txt <(sort -u subs_subfinder.txt subs_amass.txt)
```
Die Aggregatoren ziehen weitere Quellen (Suchmaschinen, Threat-Intel) und bringen meist zusätzliche Treffer.

## 3. Verifizieren (Resolution + Live)

```bash
# welche lösen auf?
while read s; do dig +short "$s" A | grep -q . && echo "$s"; done < subs_all.txt > subs_resolving.txt

# welche antworten per HTTP(S)? (httpx)
httpx -l subs_resolving.txt -silent -status-code -title -tech-detect
```
Nicht alle gefundenen Namen leben noch – `subs_resolving.txt` ist die belastbare Liste.

## 4. Aktive Brute-Force (nur eigene Domain / lab.local)

```bash
dnsrecon -d lab.local -n 192.168.56.60 -t brute -D /usr/share/seclists/Discovery/DNS/subdomains-top1million-5000.txt
# oder
amass enum -active -brute -d <DEINE_DOMAIN> -silent
```
Brute-Force findet Namen, die **kein öffentliches Zertifikat** haben und daher nicht in CT-Logs stehen (z. B. interne/nicht-TLS-Hosts). Umgekehrt findet CT auch Namen, die man nie erraten würde. → Quellen ergänzen sich.

## 5. Interessante Namen & Takeover

- Heiße Kandidaten: `admin`, `dev`, `staging`, `test`, `vpn`, `git`, `jenkins`, `backup`, `api`, `mail`, `internal`.
- **Subdomain-Takeover:** zeigt z. B. `blog.<DOMAIN>` per CNAME auf `xyz.github.io` / `*.s3.amazonaws.com`, aber die Ressource existiert nicht mehr („dangling"), kann ein Angreifer sie neu registrieren und Inhalte unter der Subdomain hosten. Check: CNAME-Ziel + Fehlermeldung des Providers.

## Häufige Fehler / Troubleshooting

- **`jq`/`subfinder`/`amass`/`httpx` fehlen:** `sudo apt install jq amass`; subfinder/httpx ggf. aus ProjectDiscovery (`apt install subfinder httpx-toolkit` oder via `go install`).
- **crt.sh leer/Timeout:** Dienst zeitweise langsam; erneut versuchen oder `output=json` weglassen und HTML parsen.
- **Wildcard-DNS verfälscht Brute-Force:** `*.domain` löst alles auf → `dnsrecon`/`amass` erkennen Wildcards; sonst Treffer gegenprüfen.
- **Rate-Limits bei aktiver Enum:** gegen Fremdziele unterlassen; nur eigene Domain/Lab aktiv brute-forcen.
