# Lösung – Übung 03: Zutrittskontrolle

## 1. Lock-Typen

| Typ | Sicherheit | Komfort | Kosten |
|-----|-----------|---------|--------|
| Mechanisch (Schlüssel) | mittel (Picking/Kopie) | mittel | niedrig |
| Cipher/Combination | mittel (shoulder surfing) | hoch | niedrig |
| Electronic (Badge) | hoch (Logging/Revoke) | hoch | mittel |
| Biometrisch/Smart | hoch (+ Faktor) | hoch | hoch |

## 2. Physische MFA + Biometrie

- **Badge + PIN** = „have" (Badge) + „know" (PIN) → zwei Faktor-Arten = physisches MFA (wie `authentication` 01).
- **Biometrie** = „are" (Fingerprint/Iris) → FAR/FRR/CER beachten (Trade-off Fehlakzeptanz/-abweisung).

## 3. Tailgating/Piggybacking + Abwehr

- **Tailgating:** unbefugte Person folgt dicht hinter einer berechtigten durch die Tür (ohne deren Wissen); **Piggybacking** mit deren (gutgläubigem) Einverständnis.
- **Abwehr:** **Mantrap/Access Control Vestibule** (zwei Türen, nur eine Person), Drehkreuz, Awareness („keine Fremden mitnehmen"), Wachdienst, anti-passback.

## 4. Gestufte Zutrittskontrolle (Lab)

```
Öffentlich → [Haus-/Wohnungstür: Schloss]
  → [Lab-Raum: abschließbar + ggf. Sensor/Log]
    → [Rack/Schrank: abschließbar] → Gerät (FDE)
```
Least Privilege (nur du), Logging (wer/wann – im Unternehmen Badge-Log), sensible Zone (Rack) zusätzlich gesichert.

## Hinweise / Troubleshooting

- Badge-Systeme erlauben **Logging + sofortigen Entzug** (Vorteil ggü. mechanischem Schlüssel).
- Biometrie nicht änderbar bei Kompromittierung → als **zweiter** Faktor, nicht allein.
- Mantrap ist die Kern-Antwort auf Tailgating (Prüfungsklassiker).
