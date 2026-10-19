# shred

**Kategorie:** Media Sanitization (sichere Löschung)

Coreutils-Tool, das Dateien/Devices **mehrfach überschreibt**, um Wiederherstellung zu erschweren – im Gegensatz zu `rm` (entfernt nur den Verzeichnis-Eintrag, Daten bleiben auf der Disk).

```bash
shred -vfz -n 3 datei        # 3x überschreiben, dann Nullen, dann löschen
shred -vfz -n 1 /dev/sdX     # ganzes Device (Vorsicht!)
```

## Wichtige Optionen

| Option | Zweck |
|--------|-------|
| `-n N` | Anzahl Überschreib-Durchgänge |
| `-z` | abschließend mit Nullen überschreiben (tarnt) |
| `-u` | Datei danach löschen |
| `-f` | Rechte ggf. ändern, um zu schreiben |
| `-v` | Fortschritt |

## Hinweise

Auf **Journaling-/CoW-Dateisystemen** (ext4-journal, btrfs/ZFS) und **SSDs** (wear-leveling) ist dateiweises `shred` **unzuverlässig** → besser Full-Disk-Overwrite, **ATA Secure Erase** oder **Cryptographic Erase** (Key vernichten). Einordnung in NIST SP 800-88 (Clear/Purge/Destroy): `shred` ≈ Clear/Purge für HDDs. Für höchste Sensitivität physische Zerstörung (degauss/shred-HW).

## Verwendet in

data-protection 08 (Sanitization), 10; Bezug incident-response/hardening.
