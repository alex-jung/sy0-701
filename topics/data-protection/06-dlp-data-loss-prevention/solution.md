# Lösung – Übung 06: DLP

## 1. DLP-Typen

| Typ | überwacht | Abfluss-Weg |
|-----|-----------|-------------|
| Network DLP | Daten in transit (Gateway/Proxy) | Mail/Web-Upload |
| Endpoint DLP | Gerät (USB/Clipboard/Druck) | USB-Stick |
| Storage/Cloud DLP | Daten at rest (Shares/Cloud) | Cloud-Sharing (CASB) |

## 2. Mini-DLP-Scanner (Regex)

```python
import re, sys
patterns = {
  "Kreditkarte": r"\b(?:\d[ -]?){13,16}\b",
  "IBAN": r"\b[A-Z]{2}\d{2}[A-Z0-9]{10,30}\b",
}
for line in open(sys.argv[1]):
    for name,p in patterns.items():
        if re.search(p, line): print(f"[DLP] {name} gefunden: {line.strip()}")
```
```bash
python3 dlp.py testdaten.txt    # meldet Treffer (Detection)
```
(Produktiv: Luhn-Check für Kartennummern gegen False Positives.)

## 3. DLP-Policies (Beispiel)

| Bedingung | Aktion |
|-----------|--------|
| „confidential"-Tag + Mail an externe Domain | **block** + alert |
| Kreditkartenmuster in Web-Upload | block + quarantine |
| „restricted"-Datei auf USB kopieren | block + log + notify |

## 4. Grenzen + Ergänzung

| Grenze/Umgehung | Ergänzung |
|------------------|-----------|
| Verschlüsselter/privater Verkehr | TLS-Inspektion/Proxy, Endpoint-DLP |
| Foto vom Bildschirm / analoge Lücke | Awareness, Need-to-know |
| Unklassifizierte Daten | Labeling/Classification (Übung 02) |
| Persönliche Geräte/BYOD | MDM, CASB, Policy |

## Hinweise / Troubleshooting

- DLP ist nur so gut wie **Klassifizierung/Labeling** – ohne Labels viele False Positives/Lücken.
- Zu aggressive Policies → Nutzer umgehen DLP → mit Awareness + sinnvollen Ausnahmen balancieren.
- DLP ergänzt, ersetzt nicht Encryption/Zugriffskontrolle.
