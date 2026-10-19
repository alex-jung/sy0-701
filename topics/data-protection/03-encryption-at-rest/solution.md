# Lösung – Übung 03: Encryption at Rest (LUKS)

## 1. LUKS-Volume

```bash
dd if=/dev/zero of=crypt.img bs=1M count=100
sudo cryptsetup luksFormat crypt.img          # Passphrase setzen
sudo cryptsetup open crypt.img secure         # -> /dev/mapper/secure
sudo mkfs.ext4 /dev/mapper/secure
sudo mkdir -p /mnt/secure && sudo mount /dev/mapper/secure /mnt/secure
echo "geheime Lab-Daten" | sudo tee /mnt/secure/test.txt
sudo umount /mnt/secure
sudo cryptsetup close secure
```

## 2. Geschlossen vs offen

```bash
# geschlossen: Rohdaten sind verschlüsselt/unlesbar
sudo strings crypt.img | grep -i "geheime"     # -> nichts
# geöffnet (nach cryptsetup open + mount): Daten lesbar
```
Im geschlossenen Zustand liefert das Device nur Zufallsbytes.

## 3. File-Encryption + Wann was

```bash
openssl enc -aes-256-cbc -pbkdf2 -salt -in geheim.txt -out geheim.enc
```
- **FDE/LUKS:** Baseline-Schutz ganzer Systeme gegen Diebstahl (einfach, transparent).
- **File-Encryption:** granular – einzelne sensible Dateien, auch auf unverschlüsseltem System/zur Weitergabe.
- Oft kombiniert: FDE (Gerät) + File/DB-Encryption (einzelne sensible Daten) + Zugriffskontrolle.

## 4. Grenzen

- Läuft das System **entsperrt**, sind Daten entschlüsselt verfügbar → kein Schutz gegen Malware/legitime Nutzer/Memory-Angriffe (data in use).
- Schützt v. a. gegen **physischen** Diebstahl/Entsorgung.
- Schlüssel-Schutz ist entscheidend (schwache Passphrase/geleakter Key = kein Schutz) → Key Management (Übung 07).

## Hinweise / Troubleshooting

- Loopback/zweite Disk nutzen – **nie** mit Produktiv-/Systemdaten experimentieren.
- LUKS-Header/Passphrase sichern (Header-Verlust = Daten weg).
- TDE bei DBs schützt die Dateien, nicht Abfragen im Betrieb (in use).
