# Greenbone / OpenVAS (GVM)

**Kategorie:** Vulnerability-Scanner (umfassend) · **Ressourcenhungrig**

Greenbone Vulnerability Management (früher **OpenVAS**) ist ein vollwertiger Open-Source-Schwachstellenscanner mit ständig aktualisiertem **NVT-Feed** (zehntausende Checks), Web-UI (GSA), Severity/QoD und Reporting. Pendant zu Nessus.

## Setup / Betrieb (Kali)

```bash
sudo apt install gvm
sudo gvm-setup            # initialisiert + zeigt das admin-Passwort (notieren!)
sudo gvm-check-setup      # Setup verifizieren
sudo gvm-feed-update      # NVT-/SCAP-/CERT-Feed laden (dauert lange)
sudo gvm-start            # Dienste + Web-UI starten
# Web-UI: https://127.0.0.1:9392
```
Passwort neu setzen:
```bash
sudo runuser -u _gvm -- gvmd --user=admin --new-password='NeuesPW'
```

## Arbeitsablauf (Web-UI / GSA)

| Schritt | Ort |
|---------|-----|
| Credentials (für authenticated) | Configuration → Credentials |
| Ziel definieren | Configuration → Targets |
| Scan starten | Scans → Tasks (Scan Config „Full and fast") |
| Ergebnisse | Scans → Results (Severity/QoD, Filter `severity>7 qod>70`) |
| Report exportieren | Report → Download (PDF/CSV/XML) |

## Begriffe

- **NVT** = Network Vulnerability Test (Plugin). **QoD** = Quality of Detection (Konfidenz 0–100 %).
- **Credentialed Scan** = mit SSH/SMB-Login → genauer, weniger FP.

## Hinweis

Braucht ≥ 4 GB RAM + mehrere GB Platz; Erst-Feed-Sync dauert lange. CLI-Automatisierung via `gvm-cli`/`gvm-script`.

## Verwendet in

vulnerability-scanning 05 (Setup), 06 (Report), 07 (Credentialed), 10.
