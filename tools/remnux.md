# REMnux

**Kategorie:** Malware-Analyse-Distribution (Blue Team)

Linux-Distribution mit vorinstallierten **Malware-Analyse-Tools** (statisch, dynamisch, Netzwerk, Dokument, Reversing). Zentrale Analyse-Workstation im isolierten Lab; Pendant auf Windows ist **FLARE-VM**.

## Enthaltene Tool-Kategorien (Auswahl)

| Kategorie | Tools |
|-----------|-------|
| Statisch/PE | `pefile`, `rabin2`, `floss`, `capa`, `yara`, DIE |
| Dokument/Script | `oletools` (olevba/oledump), `box-js`, CyberChef |
| Reversing | Ghidra, radare2/rizin, gdb |
| Netzwerk/Dynamik | INetSim, Wireshark, `fakedns` |
| Memory | Volatility |

## Nutzung

- Als **isolierte** VM (Übung 01), ohne Internet, mit INetSim als Fake-Internet.
- Samples in definiertem Ordner, Snapshots, kein Produktiv-/Heimnetz.

## Hinweis

REMnux bündelt nur Tools – das Wissen (Übung 03–09) ist entscheidend. Updates offline/kontrolliert. Nur eigenes, isoliertes Lab; keine funktionsfähige Malware bauen/verbreiten.

## Verwendet in

malware-analysis 01 (Lab), 03–10 (als Analyse-Plattform).
