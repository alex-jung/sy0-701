# Übung 08 – Physische Angriffe & Abwehr

**Schwierigkeit: 8/10 · Dauer: ca. 75 Min.**

## Lernziele

- Typische physische Angriffe verstehen und abwehren
- Hardware-/Boot-/Medien-Angriffe und ihre Gegenmaßnahmen kennen
- Surveillance/Detection-Umgehung und RFID/Badge-Angriffe einordnen

## Theorie

Physische Angriffe zielen direkt auf Hardware/Zutritt und umgehen logische Controls. Beispiele (SY0-701 + Praxis):

- **Boot-/Evil-Maid:** von USB booten, Disk ausbauen, Bootloader manipulieren → Gegen: **FDE**, BIOS/UEFI-Passwort + **Secure Boot**, Boot-Reihenfolge sperren, Tamper-Seal.
- **Hardware implants/Rogue devices:** Hardware-Keylogger, **Rubber Ducky/BadUSB**, **Rogue AP**, Netzwerk-Tap/Drop-Box → Gegen: Port-/USB-Schutz, 802.1X/NAC, Port Security, Tamper-Detection, Device-Inventar.
- **RFID/Badge-Angriffe:** **cloning/skimming** von Prox-Cards → Gegen: moderne verschlüsselte Karten (kein 125 kHz-Clear), badge + PIN, Shielding.
- **Lock bypass:** Lockpicking, **shimming**, bump keys, Bypass → Gegen: hochwertige Schlösser, elektronische Schlösser + Logging, mehrschichtig.
- **Surveillance evasion**, **cutting power/comms**, **dumpster diving** (Übung 05), **theft**.

Prinzip: **physischer Zugriff = game over**, wenn keine FDE/Tamper/Detection → daher Verzahnung physisch↔logisch + Defense in Depth. Tests nur am eigenen Eigentum/autorisiert.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| (konzeptionell) | Angriff/Abwehr-Analyse |
| FDE/Secure Boot (Bezug) | Abwehr |

## Lab-Setup

- Konzeptionell; eigene Hardware als Beispiel (keine Angriffe gegen Dritte).

## Aufgabe (selbst lösen)

1. Ordne 6 physische Angriffe je einer Gegenmaßnahme zu (Boot-Angriff, BadUSB, Rogue AP, Badge-Cloning, Lockpicking, Disk-Diebstahl).
2. Erkläre den **Evil-Maid**-Angriff und warum FDE allein nicht reicht (Bootloader-Manipulation) → Secure Boot/TPM.
3. Beschreibe, wie **BadUSB/Rubber Ducky** funktioniert und welche Controls greifen (USB-Policy/Blocker, Awareness).
4. Begründe „physischer Zugriff = game over" und welche 3 Controls das am stärksten entschärfen.

**Ziel:** physische Angriffe und ihre Abwehr verstehen und die Verzahnung physisch↔logisch begründen.

## SY0-701 Prüfungsbezug

- **2.0** physical attacks: brute force/bypass, RFID cloning, environmental; BadUSB/rogue devices; evil maid; mitigations (FDE/Secure Boot/NAC/port security).
- Begriffe: *evil maid*, *BadUSB/Rubber Ducky*, *RFID cloning/skimming*, *rogue AP/device*, *lock bypass/shimming*, *Secure Boot/TPM*, *FDE*.
