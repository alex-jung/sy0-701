# Übung 03 – Encryption at Rest (LUKS/FDE)

**Schwierigkeit: 3/10 · Dauer: ca. 60 Min.**

## Lernziele

- Verschlüsselung at-rest praktisch umsetzen (LUKS/FDE)
- Ebenen der Verschlüsselung (Full Disk / Volume / File / Database) unterscheiden
- Grenzen von at-rest-Verschlüsselung verstehen

## Theorie

**Encryption at Rest** schützt gespeicherte Daten gegen physischen Zugriff/Diebstahl (verlorener Laptop, entsorgte Disk, gestohlenes Backup). Ebenen:

- **Full Disk Encryption (FDE):** ganze Disk (LUKS/dm-crypt, BitLocker, FileVault). Schützt im **ausgeschalteten** Zustand.
- **Volume/Partition-Encryption**, **File-/Folder-Encryption** (einzelne Dateien), **Database Encryption** (TDE – Transparent Data Encryption, column-/field-level).
- Schlüssel kommt aus Passphrase/KDF, TPM, HSM oder KMS (Übung 07).

Wichtig: FDE schützt **nicht**, solange das System **läuft/entsperrt** ist (Daten sind dann „in use", Übung 01) und auch nicht vor legitimen Nutzern/Malware mit Zugriff. Für granularen Schutz kombiniert man FDE (Baseline) mit File-/DB-Encryption (sensible Felder) und Zugriffskontrolle.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `cryptsetup` (LUKS) | Volume-/Disk-Encryption |
| `openssl enc` | File-Encryption (aus `cryptography-basics`) |
| TPM/KMS (Konzept) | Schlüsselhaltung |

## Lab-Setup

- Linux-Host mit `cryptsetup`; eine Test-Loopback-Datei/zweite Disk (keine Produktivdaten!).

## Aufgabe (selbst lösen)

1. Erstelle ein **LUKS**-verschlüsseltes Volume (Loopback-Datei genügt), öffne/mounte es, lege Testdaten ab, schließe es wieder.
2. Zeige, dass die Daten im **geschlossenen** Zustand nicht lesbar sind (Rohzugriff auf das Device), im geöffneten schon.
3. Verschlüssele zusätzlich eine **einzelne Datei** (openssl) und erkläre, wann File- vs. Full-Disk-Encryption sinnvoll ist.
4. Erkläre die **Grenzen** von at-rest-Encryption (System läuft/entsperrt, Insider/Malware).

**Ziel:** at-rest-Verschlüsselung praktisch umsetzen (LUKS + File) und ihre Schutzgrenzen verstehen.

## SY0-701 Prüfungsbezug

- **3.0/1.0** encryption at rest, FDE, volume/file/database encryption (TDE), key storage (TPM/HSM/KMS).
- Begriffe: *encryption at rest*, *FDE/LUKS/dm-crypt*, *TDE*, *file/volume encryption*, *TPM/HSM/KMS*, *at-rest limits*.
