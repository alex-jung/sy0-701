# Canarytokens

**Kategorie:** Deception (Honeytokens)

Erzeugt kleine **Köder-Token**, die bei Nutzung einen Alarm (Mail/Webhook) auslösen – ideal, um Eindringlinge **nach** dem Perimeter zu erkennen (Lateral Movement, Insider, Datenabfluss). Hosted auf canarytokens.org oder **self-hosted** (Thinkst, Docker).

## Token-Typen (Auswahl)

| Typ | Trigger |
|-----|---------|
| DNS | Namensauflösung des eindeutigen Hosts |
| Web-URL / Pixel | Abruf der URL/des Bildes |
| MS-Word/Excel/PDF | Öffnen des Köder-Dokuments |
| AWS-Key | Verwendung des Fake-Credentials |
| QR / Cloned Website / Folder (DIR) | Scan/Zugriff |

## Self-hosted (Docker)

```bash
git clone https://github.com/thinkst/canarytokens-docker
# .env konfigurieren (Domain, SMTP), dann:
docker compose up -d
```

## Hinweise

Token glaubwürdig **in echten Systemen** platzieren (Config, Share, Wiki). Platzierung dokumentieren (sonst verwirren sie das eigene Team). Alerts in SIEM/IR einspeisen (High Priority). Verwandt: OpenCanary, Thinkst Canary (Appliance), Honeyfiles.

## Verwendet in

honeypots 06 (Honeytokens & Canaries), 09, 10.
