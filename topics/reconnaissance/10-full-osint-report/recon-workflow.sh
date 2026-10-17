#!/usr/bin/env bash
#
# recon-workflow.sh – Gerüst für PASSIVE OSINT-Aufklärung (Übung 10).
#
# ⚠️  NUR gegen deine EIGENE / ausdrücklich freigegebene Domain verwenden.
# ⚠️  Dieses Skript macht bewusst nur PASSIVE Lookups (öffentliche Register,
#     CT-Logs, Shodan-Index). Keine aktiven Scans/Brute-Force gegen das Ziel.
# ⚠️  LIES das Skript, bevor du es ausführst, und setze DOMAIN unten.
#
# Voraussetzungen: whois, dig, subfinder (optional amass), curl, jq,
#                  whatweb (optional), shodan-CLI (optional, API-Key nötig).

set -uo pipefail

# ------------------------- ANPASSEN -------------------------
DOMAIN="example.com"         # DEINE autorisierte Zieldomain
USE_SHODAN="no"              # "yes", wenn shodan-CLI + API-Key eingerichtet
# ------------------------------------------------------------

OUTDIR="osint_${DOMAIN}_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$OUTDIR"; cd "$OUTDIR"
echo "[*] Ziel: $DOMAIN   Ergebnisse: $(pwd)"

echo "[*] 1/6 WHOIS (Domain + IP)"
whois "$DOMAIN" > whois_domain.txt 2>/dev/null || true
IP=$(dig +short "$DOMAIN" A | head -n1)
[ -n "${IP:-}" ] && whois "$IP" > whois_ip.txt 2>/dev/null || true
echo "    A-Record: ${IP:-n/a}"

echo "[*] 2/6 DNS-Records"
{
  for t in A AAAA NS MX SOA TXT; do
    echo "== $t =="; dig +short "$DOMAIN" "$t"
  done
  echo "== DMARC =="; dig +short "_dmarc.$DOMAIN" TXT
} > dns_records.txt
cat dns_records.txt

echo "[*] 3/6 Subdomains (passiv: crt.sh + subfinder)"
curl -sS "https://crt.sh/?q=%25.${DOMAIN}&output=json" 2>/dev/null \
  | jq -r '.[].name_value' 2>/dev/null \
  | sed 's/\*\.//g' | tr 'A-Z' 'a-z' | sort -u > subs_crtsh.txt || true
command -v subfinder >/dev/null && subfinder -d "$DOMAIN" -all -silent 2>/dev/null | sort -u > subs_subfinder.txt || true
cat subs_crtsh.txt subs_subfinder.txt 2>/dev/null | sort -u > subs_all.txt
echo "    Subdomains gesamt: $(wc -l < subs_all.txt 2>/dev/null || echo 0)"

echo "[*] 4/6 Verifizieren (welche Subdomains lösen auf?)"
: > subs_resolving.txt
while read -r s; do
  [ -z "$s" ] && continue
  dig +short "$s" A | grep -q . && echo "$s" >> subs_resolving.txt
done < subs_all.txt
echo "    auflösend: $(wc -l < subs_resolving.txt)"

echo "[*] 5/6 Web-Footprint (Header + whatweb) der Hauptdomain"
curl -sSIL "http://$DOMAIN"  > web_headers.txt 2>/dev/null || true
command -v whatweb >/dev/null && whatweb -a1 "$DOMAIN" > whatweb.txt 2>/dev/null || true

echo "[*] 6/6 Exposure (Shodan, optional/passiv)"
if [ "$USE_SHODAN" = "yes" ] && command -v shodan >/dev/null && [ -n "${IP:-}" ]; then
  shodan host "$IP" > shodan_host.txt 2>/dev/null || true
  echo "    shodan_host.txt geschrieben"
else
  echo "    übersprungen (USE_SHODAN=no oder keine CLI/IP)"
fi

echo
echo "[*] Fertig. Artefakte in $(pwd):"
ls -1
echo
echo "[!] Nächster Schritt (manuell): korrelieren -> Attack-Surface-Übersicht,"
echo "    Findings mit Risiko (DMARC fehlt? exponierte Dienste? tote Subdomains?)"
echo "    + Empfehlungen in den Report schreiben."
