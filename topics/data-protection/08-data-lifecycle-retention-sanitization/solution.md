# Lösung – Übung 08: Lifecycle, Retention & Sanitization

## 1. Lifecycle (Logs, Beispiel)

create (SIEM erzeugt) → store (verschlüsselt, Zugriff beschränkt) → use (Analyse/Hunt) → archive (komprimiert/WORM) → **destroy** nach Retention.
- **Retention:** z. B. 90–365 Tage (geschäftlich/rechtlich); danach löschen (Datenminimierung).

## 2. rm vs shred

```bash
echo "sensibel" > t.txt
rm t.txt            # entfernt nur den Verzeichnis-Eintrag -> Daten noch auf Disk (recoverbar)
# korrekt (HDD):
shred -vfz -n 3 geheim.txt    # mehrfach überschreiben + löschen
```
`rm`/Papierkorb = nur Referenz weg; Rohblöcke bleiben, bis überschrieben.

## 3. Clear/Purge/Destroy

| Methode | Szenario | Datenklasse |
|---------|----------|-------------|
| Clear (überschreiben) | interne Wiederverwendung desselben Geräts | internal |
| Purge (Secure/Crypto Erase) | Weitergabe/Verkauf des Mediums | confidential |
| Destroy (shred/degauss) | End-of-Life, höchste Sensitivität | restricted/top secret |

## 4. Cryptographic Erase + SSD + Zertifikat

- **Cryptographic Erase:** bei verschlüsseltem Medium nur den **Schlüssel** vernichten → Daten unentschlüsselbar (schnell, auch für große/SSD-Medien).
- **SSD:** Überschreiben unzuverlässig (wear-leveling/over-provisioning) → **ATA Secure Erase**/Hersteller-Tool oder Crypto Erase.
- **Sanitization-Zertifikat:** dokumentierter Nachweis (Methode/Medium/Datum/Verantwortlicher) für Compliance/Audit bei Entsorgung/Weitergabe.

## Hinweise / Troubleshooting

- Höhere Datenklasse → gründlichere Methode (clear→purge→destroy).
- `shred` wirkt auf Journaling-/CoW-FS und SSDs nur eingeschränkt → besser Full-Disk/Crypto Erase.
- Retention sowohl „nicht zu lang" (Risiko) als auch „nicht zu kurz" (rechtlich) – Balance dokumentieren.
