# Lösung – Übung 09: Shodan & Censys

## 1. CLI einrichten + eigenes Host-Profil

```bash
pip install shodan            # falls nicht vorhanden
shodan init <DEIN_API_KEY>    # Key aus account.shodan.io
# eigene öffentliche IP ermitteln:
curl -s ifconfig.me ; echo
# Host-Profil abfragen:
shodan host <DEINE_OEFFENTLICHE_IP>
```
Ausgabe: offene Ports, erkannte Produkte/Versionen, Banner, TLS-Zertifikate, letzter Scan-Zeitpunkt, ggf. gelistete CVEs.

## 2. Indexierte Assets finden

```bash
shodan search --fields ip_str,port,org,product "hostname:<DEINE_DOMAIN>"
shodan search "net:<DEIN_NETZBLOCK>"        # z.B. net:203.0.113.0/24
```
Zeigt, welche deiner Hosts Shodan kennt und welche Dienste darauf sichtbar sind. Web-GUI (shodan.io) gibt zusätzlich die übersichtliche Host-Detailseite.

## 3. Aggregierte Statistik (keine Einzelziele)

```bash
shodan count port:3389 country:DE                 # Anzahl offener RDP in DE
shodan stats --facets country port:3389           # Top-Länder
shodan stats --facets org "product:MySQL port:3306"
```
`count`/`stats` liefern **anonyme Summen/Verteilungen** – ideal, um Exposure-Trends zu verstehen, ohne einzelne fremde Systeme anzufassen.

## 4. Shodan vs. eigener aktiver Scan

```bash
sudo nmap -sS -sV <DEINE_OEFFENTLICHE_IP>    # eigener Scan (autorisiert, eigenes Asset)
```
Mögliche Abweichungen und Gründe:
- **Shodan zeigt veraltete Daten:** letzter Shodan-Scan liegt zurück → Dienst inzwischen geändert/geschlossen.
- **Shodan sieht mehr/andere Ports:** es scannt über lange Zeit viele Ports; dein Scan ist ein Zeitpunkt.
- **Dein Scan sieht mehr:** interne/gefilterte Dienste, die von außen (Shodans Sicht) nicht erreichbar sind → Firewall/NAT.
→ Kernaussage: Shodan = externe Sicht über Zeit; aktiver Scan = aktuelle, gezielte Momentaufnahme.

## 5. Blue-Team: exponierter Dienst

1. **Verifizieren** (eigener Scan), ob der Dienst wirklich offen/aktuell ist (Shodan kann veraltet sein).
2. **Eindämmen:** Firewall-Regel/Segmentierung (OPNsense), Dienst hinter **VPN** legen oder ganz abschalten, Management-Ports (RDP/SSH/DB) **nie** offen ins Internet.
3. **Härten/patchen:** Version aktualisieren, Auth + MFA, TLS.
4. **Monitoring:** eigene Assets regelmäßig in Shodan/Censys prüfen (Shodan Monitor / Alerts).

## Censys-Alternative

```bash
censys search 'services.service_name: RDP and location.country: Germany'
censys view <IP>
```

## Häufige Fehler / Troubleshooting

- **`shodan init` schlägt fehl:** Key aus account.shodan.io prüfen; manche Filter (`vuln:`) brauchen bezahlte Membership.
- **Eigene IP nicht in Shodan:** normal bei dynamischer Privat-IP hinter CGNAT/NAT – dann an eigener Domain/VPS üben, nicht an Fremdzielen.
- **`pip`-Installation:** ggf. `pipx install shodan` oder venv nutzen (PEP 668 auf Kali).
- **Verwechslung passiv/aktiv:** Shodan abfragen = passiv; die gelisteten Fremd-IPs selbst anzuscannen wäre aktiv und ohne Erlaubnis tabu.
