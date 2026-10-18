# YARA

**Kategorie:** Malware-Erkennung (Signaturregeln)

„Pattern-Matching-Schweizermesser" für Malware: Regeln beschreiben **Strings/Bytes/Bedingungen**, mit denen man Dateien/Prozesse/Speicher auf bekannte Malware oder ganze **Familien** scannt – über den Hash hinaus.

```bash
yara [Optionen] <regel.yar> <ziel>
```

## Regel-Struktur

```yara
rule name {
  meta:   author = "..."  sha256 = "..."
  strings:
    $a = "C2string" ascii wide
    $b = { 6A 40 68 00 30 00 00 }     // Byte-Pattern
  condition:
    uint16(0) == 0x5A4D and 2 of them  // PE + Strings
}
```
- **strings:** Text (`ascii`/`wide`/`nocase`), Hex-Bytes, Regex.
- **condition:** Logik (`all/any/N of them`, Offsets, Dateityp, Imports via `pe`-Modul).

## Wichtige Optionen

| Option | Bedeutung |
|--------|-----------|
| `-r` | rekursiv (Verzeichnis) |
| `-s` | gematchte Strings anzeigen |
| `-p <n>` | parallel |
| `--scan-list` | Dateiliste scannen |

## Beispiele

```bash
yara -r rules.yar /pfad/zum/scan
yara -s sample.yar sample.exe
```

## Hinweise

Regeln **spezifisch** halten (sonst False Positives); gegen Gutware testen. Einsatz in EDR/Scannern/`logging-siem`. IOCs aus der Analyse (Übung 03–09) → YARA-Regel (Übung 10). `pe`/`math`-Module für stärkere Conditions.

## Verwendet in

malware-analysis 10 (IOC→YARA); Bezug ids-ips/logging-siem (Detection).
