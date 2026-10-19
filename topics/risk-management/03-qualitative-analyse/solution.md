# Lösung – Übung 03: Qualitative Analyse

## 1. Skalen (Beispiel)

**Likelihood 1–5:** 1 sehr selten (<1×/Jahr) … 5 sehr häufig (wöchentlich).
**Impact 1–5:** 1 vernachlässigbar … 5 kritisch (Totalausfall/Datenverlust).

## 2. Bewertung (Auszug)

| ID | L | I | Level (L×I) |
|----|---|---|-------------|
| R1 ungepatchter Dienst | 4 | 5 | 20 (High) |
| R2 kein Backup | 3 | 5 | 15 (High) |
| R5 OPNsense-Fehlkonfig | 3 | 5 | 15 (High) |
| R8 Secrets im Repo | 3 | 4 | 12 (Med-High) |
| R3 schwache Passwörter | 3 | 3 | 9 (Med) |
| R9 Fehlbedienung | 3 | 3 | 9 (Med) |
| R10 Supply Chain | 2 | 4 | 8 (Med) |
| R4 Malware-Ausbruch | 1 | 5 | 5 (Low-Med) |
| R6 Stromausfall | 2 | 3 | 6 (Low-Med) |
| R7 Lizenz/veraltet | 2 | 2 | 4 (Low) |

## 3. Heatmap (5×5)

```
Impact
 5 |      R4        R2,R5  R1
 4 |          R10   R8
 3 |      R6        R3,R9
 2 |          R7
 1 |
   +------------------------------
     1     2     3     4     5   Likelihood
```
Rot (≥15): R1, R2, R5. Gelb (6–14): R3, R6, R8, R9, R10. Grün (≤5): R4, R7 (+R6 je nach Grenze).

## 4. Top-5 + Grenzen

Top-5: **R1, R2, R5, R8, R3**.
Grenzen: (1) **subjektiv** – „High" ist Einschätzung, nicht gemessen; (2) nicht **monetär/aggregierbar** → keine Kosten-Nutzen-Aussage für Control-Investitionen (dafür quantitativ, Übung 04).

## Hinweise / Troubleshooting

- Skalen **vorab** definieren, sonst sind Bewertungen nicht vergleichbar.
- Heatmap ist ein Kommunikations-Tool fürs Management – klar und knapp halten.
- Gleiches Level kann unterschiedliche L/I-Kombis haben (20 = 4×5 oder 5×4) → Kontext beachten.
