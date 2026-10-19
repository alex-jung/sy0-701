# Lösung – Übung 03: Social Engineering

## 1. Techniken

| Technik | Kurz |
|---------|------|
| Phishing | Massen-Mail mit Köder/Link |
| Spear phishing | gezielt auf Person/Org zugeschnitten |
| Whaling | gegen Führungskräfte (hoher Wert) |
| Smishing | per SMS |
| Vishing | per Telefon/Voice |
| Pharming | Opfer auf Fake-Site umleiten (DNS/hosts) |
| Pretexting | erfundener Vorwand/Story |
| Baiting | physischer/digitaler Köder (USB) |
| Tailgating | physisch durch Tür „mitlaufen" |
| Watering hole | präparierte, vom Ziel besuchte Website |

## 2. Influence-Prinzipien (Beispiele)

- „Ihr Konto wird in 24 h gesperrt!" → **urgency** (+ fear).
- „Anweisung vom CEO, bitte sofort überweisen" → **authority** (BEC).
- „Nur noch 2 Plätze frei" → **scarcity**.
- „Alle Kollegen haben schon bestätigt" → **social proof/consensus**.
- „Hallo, hier ist dein IT-Kollege Max" → **liking/trust/familiarity**.

## 3. Phishing vs Spear vs Whaling

- **Phishing:** breit gestreut, generisch, viele Empfänger.
- **Spear phishing:** gezielt, personalisiert (Name/Kontext/OSINT).
- **Whaling:** Spear phishing gegen **hochrangige** Ziele (C-Level) – hoher potenzieller Schaden.

## 4. Gegenmaßnahmen

| Gruppe | Technisch | Menschlich |
|--------|-----------|-----------|
| Mail-Phishing | SPF/DKIM/DMARC, Mail-Filter, FIDO2 | Awareness, Melde-Button |
| Voice/SMS | Nummernfilter, Rückruf-Verifikation | Verifikationsprozess, Skepsis |
| Physisch (tailgating) | Mantrap/Badge | Wachsamkeit, Begleitpflicht |
| Pharming | DNSSEC, HSTS/TLS-Prüfung | URL prüfen, Lesezeichen |

## Hinweise / Troubleshooting

- Mehrere Prinzipien treten oft **kombiniert** auf (authority + urgency).
- BEC nutzt selten Malware → technische Filter allein reichen nicht → Prozess/Verifikation.
- Praxis/Simulation im eigenen Lab: `social-engineering` + `gophish` (autorisiert).
