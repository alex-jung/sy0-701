# Ghidra

**Kategorie:** Reverse Engineering (Disassembler + Decompiler)

Von der NSA veröffentlichtes Open-Source-RE-Framework: zerlegt Binaries (PE/ELF/…) in **Assembly** und erzeugt **C-ähnlichen Pseudocode** (Decompiler). Zentral für statisches Malware-Reversing.

```
ghidra        # GUI starten -> Projekt -> Binary importieren -> Auto-Analyze
```

## Wichtige Funktionen

| Funktion | Zweck |
|----------|-------|
| **Decompiler** | Pseudocode je Funktion (lesbarer als ASM) |
| **Symbol Tree / Imports** | Einstieg über API-Aufrufe |
| **Defined Strings** | Strings + „References to" (Xrefs) |
| **References/Xref** | wer nutzt diese Funktion/diesen String |
| Function Graph | Kontrollfluss |
| Umbenennen/Kommentieren | Analyse-Fortschritt festhalten |

## Workflow (Malware)

1. Import + Auto-Analyze.
2. Über **Strings/Imports + Xrefs** zur Schlüsselfunktion (C2/Krypto/Persistence).
3. **Decompiler** lesen, Variablen umbenennen, Logik verstehen.
4. Für Laufzeitwerte ergänzend Debugger (x64dbg/gdb, Übung 07).

## Hinweise

Gepackte Samples erst entpacken (Übung 08), sonst nur der Stub. Nur eigenes, isoliertes Lab. Alternative CLI: radare2/rizin.

## Verwendet in

malware-analysis 07 (Disassembly), 08, 10.
