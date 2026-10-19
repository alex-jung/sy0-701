# Lösung – Übung 03: Strukturen & Rollen

## 1. Strukturen

- **Board of Directors:** oberste Aufsicht/Verantwortung, setzt Risk Appetite, überwacht das Programm.
- **Security/Risk Committee:** steuert operativ-strategisch (Priorisierung, Policy-Freigabe, Risiko-Reviews).
- **Zentral vs. dezentral:** zentral = eine Security-Funktion gibt alles vor (konsistent, aber ggf. praxisfern); dezentral = Einheiten verantworten selbst (flexibel, aber inkonsistent). Oft Mischform.

## 2. Rollen

| Rolle | Kurzaufgabe |
|------|-------------|
| Data Owner | legt Klassifizierung/Zugriff fest (Business, entscheidet) |
| Data Steward | pflegt Datenqualität/Kennzeichnung |
| Data Custodian | technischer Schutz/Verwahrung (Backup/Access umsetzen) |
| CISO | verantwortet Security-Programm (oft accountable) |
| User | nutzt Daten gemäß Policy |

## 3. RACI (Beispiel)

| Aufgabe | Lab-Owner/CISO | Admin (Custodian) | Data Owner | User |
|---------|----------------|-------------------|-----------|------|
| Patching | A | R | C | I |
| Backup | A | R | C | I |
| Zugriffsvergabe | A | R | C/A* | I |
| Incident Response | A | R | C | I |
| Policy-Freigabe | A/R | C | C | I |

(*Zugriff auf Daten: Data Owner entscheidet, Custodian setzt um.)

## 4. Nur ein Accountable

Gäbe es zwei „Accountable", wäre bei einem Problem **niemand** eindeutig verantwortlich (jeder verweist auf den anderen) → Rechenschaft verwässert. Genau **ein** Accountable sichert klare Verantwortung; Responsible (Ausführende) können mehrere sein.

## Hinweise / Troubleshooting

- **Owner ≠ Custodian:** Owner entscheidet (Business), Custodian verwahrt (Technik). Klassischer Prüfungs-Stolperstein.
- Im Ein-Personen-Lab: Rollen trotzdem benennen (zeigt Verständnis + skaliert später).
- RACI: pro Zeile genau ein „A".
