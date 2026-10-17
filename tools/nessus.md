# Nessus (Essentials)

**Kategorie:** Vulnerability-Scanner (kommerziell) · **optional**

Weit verbreiteter kommerzieller Schwachstellenscanner von Tenable. **Nessus Essentials** ist kostenlos für bis zu 16 IPs – gute Alternative/Ergänzung zu Greenbone, um einen zweiten Scanner kennenzulernen (Plugins, Policies, Reporting).

## Setup (Kali)

```bash
# .deb von tenable.com/downloads/nessus herunterladen, dann:
sudo dpkg -i Nessus-*.deb
sudo systemctl start nessusd
# Web-UI:
#   https://127.0.0.1:8834
```
Beim ersten Start: **Nessus Essentials** wählen, Aktivierungscode (per Mail) eingeben, Plugins werden geladen (dauert).

## Arbeitsablauf (Web-UI)

| Schritt | Ort |
|---------|-----|
| Scan-Policy wählen | New Scan → z. B. „Basic Network Scan", „Advanced" |
| Credentials (authenticated) | Scan → Credentials (SSH/SMB) |
| Ziel + Start | Targets eintragen → Launch |
| Ergebnisse | Scan → Hosts/Vulnerabilities (Severity, VPR/CVSS) |
| Export | Report → PDF/CSV/Nessus |

## Begriffe

- **Plugins** = Nessus-Checks (Pendant zu GVMs NVTs).
- **VPR** (Vulnerability Priority Rating) = Tenables risikobasiertes Scoring zusätzlich zu CVSS.
- **Credentialed Scan** wie bei GVM → genauer, weniger FP.

## Hinweis

Essentials ist auf 16 IPs limitiert und nicht für kommerzielle Nutzung. Konzeptionell identisch zu Greenbone (Übung 05–07). Nur eigene Ziele scannen.

## Verwendet in

vulnerability-scanning (optionale Alternative zu Greenbone, README).
