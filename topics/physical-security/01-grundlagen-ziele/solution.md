# Lösung – Übung 01: Grundlagen physischer Sicherheit

## 1. Physisch hebelt logisch aus

- **Boot-/Disk-Angriff:** Angreifer bootet von USB oder baut die Disk aus → liest Daten, umgeht OS-Login (sofern nicht FDE, `data-protection` 03).
- **Hardware-Manipulation:** Hardware-Keylogger/Rogue-Device anstecken, Reset-Taste/Jumper, physischer Konsolenzugang → Credentials/Config.

## 2. Controls nach Typ

| Control | Typ |
|---------|-----|
| Zaun | preventive + deterrent |
| Kamera | detective + deterrent |
| Schloss | preventive |
| Wachmann | detective/operational + deterrent |
| Beleuchtung | deterrent |
| Mantrap/Access Control Vestibule | preventive (gegen tailgating) |
| Warnschild | deterrent |
| Bewegungssensor | detective |

## 3. Deter→Detect→Delay→Deny (Einbruch Lab-Raum)

- **Deter:** sichtbare Kamera/Schild → Täter schreckt ab.
- **Detect:** Bewegungssensor/Kamera meldet Zutritt.
- **Delay:** abgeschlossene Tür + Rack-Schloss verzögern.
- **Deny/Respond:** Alarm → Reaktion (Benachrichtigung/eingreifen), Zugriff verhindert.

## 4. CPTED (Beispiele)

- **Natural surveillance:** Lab-Raum einsehbar/Sichtachse, keine toten Winkel.
- **Natural access control:** klare, begrenzte Zugänge (eine abschließbare Tür).
- **Territorial reinforcement/Zonierung:** klare Grenzen (öffentlich vs. privat), Beschilderung, Beleuchtung.

## Hinweise / Troubleshooting

- Physische Sicherheit ist die **unterste Schicht** der Defense in Depth – wird oft unterschätzt.
- FDE (`data-protection`) ist die logische Antwort auf „Disk-Diebstahl", ersetzt aber keine Zutrittskontrolle.
- Dieselbe Control kann mehrere Typen sein (Kamera = detektiv **und** abschreckend).
