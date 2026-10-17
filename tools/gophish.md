# GoPhish

**Kategorie:** Phishing-Simulation (Security Awareness)

Open-Source-Plattform für **autorisierte Phishing-Simulationen** in Awareness-Programmen. Admin-UI + Tracking; misst, wie Mitarbeiter auf Test-Phishing reagieren – um gezielt zu schulen, **nicht** um Dritte anzugreifen.

```bash
./gophish          # Admin-UI: https://127.0.0.1:3333 (Zugangsdaten beim 1. Start im Log)
```

## Bausteine

| Komponente | Zweck |
|------------|-------|
| Sending Profile | SMTP-Absender (Test-SMTP) |
| Email Template | die Test-Mail (`{{.URL}}`, `{{.Tracker}}`) |
| Landing Page | Zielseite, trackt Klick (kein echtes Credential-Capture nötig) |
| Users & Groups | **eigene** Test-Empfänger |
| Campaign | verbindet alles + startet |

## Metriken

Sent → Opened → Clicked → Submitted Data → **Reported**. KPIs: Klickrate ↓, Melderate ↑ über Zeit.

## Hinweis

Nur **eigene Test-Adressen / informierte Teilnehmer mit Freigabe**. Ziel ist Awareness/Schulung; Landing Page zur Aufklärung statt echtem Datenabgriff. Release von getgophish (GitHub).

## Verwendet in

social-engineering 04 (Phishing-Simulation), 10 (Metriken/Programm).
