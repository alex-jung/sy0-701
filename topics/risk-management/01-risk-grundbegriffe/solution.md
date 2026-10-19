# Lösung – Übung 01: Risk-Grundbegriffe

## 1. Definitionen

- **Asset:** etwas Schützenswertes (Daten/System/Dienst).
- **Threat:** potenzielle Gefahrenquelle/-ereignis (z. B. Ransomware-Gruppe).
- **Vulnerability:** ausnutzbare Schwäche (z. B. ungepatchter Dienst).
- **Likelihood:** Eintrittswahrscheinlichkeit.
- **Impact:** Schadenshöhe (CIA/Geschäft).
- Gleichung: **Risk ≈ Likelihood × Impact**; Voraussetzung meist **Threat + Vulnerability**.

## 2. Lab-Risiken (Beispiele)

- Angreifer (Threat) nutzt ungepatchtes Metasploitable (Vuln) → Kompromittierung/Datenverlust (Impact) auf Ziel-VM (Asset).
- Fehlbedienung (Threat) + fehlendes Backup (Vuln) → Verlust der Lab-Configs (Impact).
- Stromausfall (Threat) + keine USV (Vuln) → Ausfall OPNsense (Impact, Verfügbarkeit).

## 3. Inherent vs Residual

- **Inherent:** ungepatchter Dienst, **kein** Schutz → hohes Risiko.
- **Residual:** nach Segmentierung + IDS + eingeschränktem Zugriff bleibt ein **kleineres** Rest-Risiko (nicht null). Controls senken Likelihood/Impact, eliminieren Risiko selten vollständig.

## 4. Appetite vs Tolerance

- **Risk Appetite (strategisch):** „Im Lab akzeptiere ich bewusst verwundbare Test-VMs." (grundsätzliche Bereitschaft)
- **Risk Tolerance (pro Risiko):** „Diese VM darf verwundbar sein, **solange** sie isoliert und ohne Internet ist." (akzeptable Abweichung/Grenze)

## Hinweise / Troubleshooting

- „Threat" und „Vulnerability" nicht verwechseln: eine Bedrohung ohne passende Schwäche ergibt kaum Risiko (und umgekehrt).
- Residual Risk ist das, worüber das Management entscheidet (akzeptieren oder weiter behandeln).
- Qualitativ reicht hier; die Zahlen kommen in Übung 03/04.
