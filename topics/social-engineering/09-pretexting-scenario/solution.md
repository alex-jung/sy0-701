# Lösung – Übung 09: Pretexting & Szenario

> Planung/Analyse gegen eigene/fiktive Org; Durchführung nur autorisiert mit informierten Teilnehmern.

## 1. Szenario (Beispiel: Lieferanten-BEC)

```
Ziel:            Buchhaltung ändert Bankverbindung eines "Lieferanten"
Erfolgskriterium: Mitarbeiter leitet Zahlung an neues (Test-)Konto / bestätigt Änderung
```

## 2. Multi-Kanal-Pretext

```
Kanal 1 (Mail): "Lieferant X" (Lookalike-Domain) -> "Unsere Bankdaten haben sich geändert,
                 bitte künftige Zahlungen auf IBAN ... (Urgency: offene Rechnung fällig)"
Kanal 2 (Call): Follow-up "wie per Mail angekündigt" -> Authority + Familiarity,
                 baut auf Kanal 1 auf (Konsistenz!)
```
Durchziehende Prinzipien: **Authority, Urgency, Familiarity/Consistency**. Der zweite Kanal erhöht Glaubwürdigkeit massiv.

## 3. Safety / Scope

- **Scope:** nur Buchhaltungs-Testteilnehmer; keine echten Überweisungen (Test-Konto/Abbruch vor Ausführung).
- **Abbruch:** bei Stress/Eskalation sofort aufklären; keine Schädigung/Drohung.
- **Autorisierung:** Management-Freigabe, Kontaktperson, dokumentierter Rahmen.

## 4. Ablauf

```
1) OSINT: Lieferantenbeziehung + Buchhaltungs-Kontakt (rollenbasiert)
2) Mail (Kanal 1) mit Bankdatenänderung
3) Warten / Follow-up-Anruf (Kanal 2) zur Bestätigung
4) Zielhandlung angefragt -> Erfolgskriterium geprüft
5) Aufklärung + Dokumentation
```

## 5. Detection/Abwehr (wo hätte es stoppen müssen)

- **Mail:** DMARC/Lookalike-Domain-Erkennung, externer-Absender-Banner (Kanal 1 auffällig).
- **Prozess:** **Vier-Augen-/Dual-Control** bei Bankdatenänderung, **Rückruf an die offiziell hinterlegte** Lieferantennummer (nicht die aus der Mail), Freigabe-Workflow.
- **Awareness:** „Bankdatenänderung immer verifizieren" → Mitarbeiter hätte verifizieren müssen.

## Gegenmaßnahmen (gebündelt)

Prozesskontrollen (Dual Control, Verifikation über bekannten Kanal), DMARC/Mail-Security, Lieferanten-Stammdaten-Governance, regelmäßige Awareness/Simulation gegen BEC.

## Häufige Fehler / Troubleshooting

- **Echte Zahlung/echter Lieferant:** nie – Test-Konto, Abbruch vor Ausführung.
- **Nur ein Kanal gedacht:** gerade die Multi-Kanal-Konsistenz macht BEC gefährlich.
- **Keine Abwehr-Analyse:** das Szenario dient dazu, Prozess-/Erkennungslücken zu finden.
