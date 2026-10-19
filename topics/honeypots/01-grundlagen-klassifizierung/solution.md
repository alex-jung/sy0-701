# Lösung – Übung 01: Honeypot-Grundlagen & Klassifizierung

## 1. Vergleich Interaktionsgrade

| Kriterium | Low | Medium | High |
|-----------|-----|--------|------|
| Realismus | gering (emulierte Antworten) | mittel (emulierte Shell) | maximal (echtes OS) |
| Erkenntnisgewinn | gering | mittel (Befehle, Malware-Download) | hoch (voller TTP-Verlauf) |
| Risiko | niedrig | niedrig–mittel | **hoch** (Pivot-Gefahr) |
| Beispiel | Dionaea | **Cowrie** | echte verwundbare VM |

## 2. Zuordnung

- **Cowrie** → Honeypot, medium-interaction (SSH/Telnet).
- **Dionaea** → Honeypot, low-interaction (Multi-Service).
- **Echtes verwundbares Windows** → Honeypot, high-interaction.
- **Fake-`salaries.xlsx`** → **Honeyfile** (Köder-Datei).
- **Fake-AWS-Key in Config** → **Honeytoken** (Köder-Credential).

## 3. Warum weniger False Positives

Ein IDS bewertet **echten** Produktivverkehr und muss zwischen gut/böse unterscheiden → unvermeidlich Fehlalarme. Ein Honeypot hat **keinen legitimen Zweck**; es gibt keine „normalen" Nutzer. Daher ist **jede** Interaktion anomal → fast jeder Alarm ist echt (hohes Signal-Rausch-Verhältnis).

## 4. Zwei Risiken High-Interaction

- **Pivot/Sprungbrett:** einmal kompromittiert, kann der Angreifer von dort dein restliches Netz angreifen → strenge Ausgangsfilterung nötig.
- **Betriebs-/Rechtsrisiko:** der Honeypot könnte zum Angriff auf **Dritte** (DDoS, Spam) missbraucht werden → Egress strikt begrenzen, überwachen, zurücksetzen.

## Häufige Fehler / Troubleshooting

- Honeypot als „einfach eine offene VM" ohne Segmentierung → wird zur Gefahr.
- Verwechslung Honeyfile (Datei) vs. Honeytoken (Datensatz/Credential).
- Research- vs. Production-Zweck nicht getrennt → falsche Erwartungen an den Output.
