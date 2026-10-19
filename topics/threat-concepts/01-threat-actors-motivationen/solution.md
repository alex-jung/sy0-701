# Lösung – Übung 01: Threat Actors & Motivationen

## 1. Charakterisierung

| Actor | int/ext | Ressourcen | Sophistication |
|-------|---------|------------|----------------|
| Nation-state/APT | extern | sehr hoch | sehr hoch |
| Organized crime | extern | hoch | hoch |
| Hacktivist | extern | mittel | mittel |
| Insider | intern | variabel | niedrig–hoch |
| Unskilled attacker | extern | niedrig | niedrig |
| Shadow IT | intern | niedrig | n/a (Risikoquelle) |

## 2. Motivation → Actor

| Motivation | typischer Actor |
|------------|-----------------|
| Financial gain | organized crime |
| Espionage/data exfiltration | nation-state/APT |
| Ideology/political | hacktivist |
| Revenge/sabotage | (böswilliger) insider |
| Chaos/disruption | unskilled attacker |
| Ethical (autorisiert) | Pentester/Red Team |

## 3. Warum Insider gefährlich

- Haben **legitimen Zugang**, Kenntnis interner Systeme/Prozesse und umgehen Perimeter-Controls. Selbst bei geringer „Sophistication" ist der Schaden hoch, weil sie **innen** sitzen und Vertrauen genießen → schwer zu erkennen (Deception/Honeytokens, UEBA helfen).

## 4. Lab-Bedrohungsprofil (Beispiel)

- **Plausibel:** opportunistische externe Scans/Brute-Force (unskilled/automatisiert), Supply-Chain (kompromittiertes Image), eigenes Fehlverhalten (fahrlässiger „Insider").
- **Unwahrscheinlich:** gezielter Nation-state/APT (kein lohnendes Ziel). → Controls risikobasiert priorisieren (nicht gegen APT überinvestieren).

## Hinweise / Troubleshooting

- APT ≠ „ein Tool", sondern ein **Akteur-Typ** (hoch ressourciert, persistent).
- Shadow IT ist kein Angreifer, aber eine reale **Angriffsfläche** (Übung 02).
- Motivation hilft, realistische Szenarien zu wählen (Threat Modeling, Übung 10).
