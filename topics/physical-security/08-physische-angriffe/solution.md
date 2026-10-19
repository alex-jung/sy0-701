# Lösung – Übung 08: Physische Angriffe & Abwehr

## 1. Angriff → Gegenmaßnahme

| Angriff | Gegenmaßnahme |
|---------|---------------|
| Boot-/USB-Boot-Angriff | BIOS-Passwort, Boot-Order sperren, Secure Boot, FDE |
| BadUSB/Rubber Ducky | USB-Policy/Blocker, keine Fremd-Sticks, Awareness |
| Rogue AP/Netz-Drop | 802.1X/NAC, Port Security, Rogue-AP-Detection |
| Badge-Cloning | verschlüsselte Karten, badge+PIN, Shielding |
| Lockpicking/Bypass | hochwertige/elektronische Schlösser, mehrschichtig |
| Disk-Diebstahl | FDE/LUKS, abschließbares Rack |

## 2. Evil Maid

Ein Angreifer mit kurzem physischem Zugang manipuliert den **Bootloader/Firmware** (z. B. um die FDE-Passphrase abzugreifen) → beim nächsten Login wird sie geklaut. **FDE allein** schützt nicht gegen Manipulation **vor** der Entschlüsselung → **Secure Boot** (signierte Boot-Kette) + **TPM** (Measured Boot/Sealing) + Tamper-Seal nötig.

## 3. BadUSB / Rubber Ducky

Ein als Tastatur getarnter USB-Stick „tippt" blitzschnell Befehle (HID-Injection) → führt Payload mit Nutzerrechten aus. Controls: **USB-Port-Blocker/Policy**, Device-Control (nur erlaubte HID), Bildschirmsperre, **Awareness** („keine gefundenen Sticks einstecken").

## 4. „Physischer Zugriff = game over"

Mit physischem Zugriff lassen sich viele logische Controls umgehen (Boot, Disk, Reset, Implant). Am stärksten entschärfen:
1. **FDE** (Daten bei Diebstahl unlesbar),
2. **Secure Boot + BIOS/UEFI-Passwort/TPM** (keine Boot-Manipulation),
3. **Zutrittskontrolle + Tamper-Detection** (physischer Zugriff wird verhindert/erkannt).

## Hinweise / Troubleshooting

- FDE **plus** Secure Boot/TPM – einzeln lassen sich beide umgehen.
- Alte 125-kHz-Prox-Cards sind trivial klonbar → moderne, verschlüsselte Karten.
- Alles nur am **eigenen** Equipment testen; keine fremden Gebäude/Badges.
