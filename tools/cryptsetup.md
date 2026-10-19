# cryptsetup (LUKS)

**Kategorie:** Encryption at Rest (Linux Disk/Volume Encryption)

Standard-Tool für **LUKS/dm-crypt** – transparente Block-/Volume-Verschlüsselung unter Linux (Full Disk Encryption, verschlüsselte Container/Partitionen). Schützt Daten **at rest** (verlorene/entsorgte Disk, gestohlenes Backup).

```bash
cryptsetup luksFormat /dev/sdX        # Volume verschlüsseln (Passphrase)
cryptsetup open /dev/sdX name         # entsperren -> /dev/mapper/name
cryptsetup close name                 # schließen
```

## Wichtige Befehle

| Befehl | Zweck |
|--------|-------|
| `luksFormat` | Device als LUKS initialisieren |
| `open`/`close` | ent-/sperren (dm-mapper) |
| `luksAddKey`/`luksRemoveKey` | Key-Slots verwalten |
| `luksHeaderBackup`/`-Restore` | Header sichern/wiederherstellen |
| `luksDump` | Header/Key-Slots anzeigen |
| `status` | Mapping-Status |

## Hinweise

Schützt nur im **gesperrten** Zustand (läuft das System entsperrt, sind Daten „in use"). **LUKS-Header + Passphrase sichern** (Header-Verlust = Daten weg). Schlüssel kann aus Passphrase/TPM/KMS kommen (Key Management). Für Tests Loopback-Datei statt echter Disk. Verwandt: BitLocker/FileVault (FDE), TDE (DB).

## Verwendet in

data-protection 03 (Encryption at Rest), 08 (Cryptographic Erase), 10.
