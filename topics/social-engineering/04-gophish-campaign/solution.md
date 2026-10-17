# Lösung – Übung 04: GoPhish-Simulation

## 0. GoPhish starten

```bash
# Release entpacken, dann:
./gophish
# Admin-UI: https://127.0.0.1:3333  (Login-Daten stehen beim ersten Start im Terminal)
```

## 1. Sending Profile

Admin-UI → **Sending Profiles → New**: Name, SMTP-Host (dein Test-SMTP), From-Adresse. „Send Test Email" prüfen.

## 2. Template + Landing Page

- **Email Templates → New:** harmlose Awareness-Mail; GoPhish fügt den Tracking-Platzhalter `{{.URL}}` und `{{.Tracker}}` ein. Klar als Test gestaltet.
- **Landing Pages → New:** einfache Seite; **„Capture Submitted Data" aus** bzw. nur zur Schulung (keine echten Credentials speichern). Optional „Redirect to" auf eine Awareness-Seite nach Klick.

## 3. Group + Campaign

- **Users & Groups → New:** deine **eigenen** Test-Adressen (`{{.FirstName}}`-Platzhalter möglich).
- **Campaigns → New:** Template + Landing Page + Sending Profile + Group, URL = GoPhish-Tracking-URL → **Launch**.

## 4. Metriken

Dashboard zeigt live: **Email Sent → Email Opened → Clicked Link → Submitted Data → Reported**. Beispiel: 10 gesendet, 7 geöffnet, 4 geklickt → **40 % Klickrate** = Schulungsbedarf; wenige „Reported" = Melde-Kultur verbessern.

## 5. Awareness-Maßnahmen

- Gezielte Schulung für Klicker, **Melde-Button** einführen/bewerben, **wiederholte** Simulationen (Trend messen), positive Kommunikation (kein Bloßstellen), realistische Szenarien steigern.

## Gegenmaßnahmen / Einordnung

Die Simulation **ist** eine Awareness-Kontrolle; begleitend technisch: DMARC/Gateway/Link-Rewriting (Übung 03/10). Ziel ist Lernen, nicht „Erwischen".

## Häufige Fehler / Troubleshooting

- **Mails kommen nicht an:** Test-SMTP/Firewall; „Send Test Email" nutzen; Spam-Ordner.
- **Echte Credentials erfasst:** vermeiden – Landing Page nur zur Awareness, kein Capture.
- **Ohne Freigabe/Scope:** nicht zulässig – nur eigene/informierte Teilnehmer.
- **Tracking zeigt nichts:** `{{.Tracker}}`/`{{.URL}}` im Template korrekt eingebunden?
