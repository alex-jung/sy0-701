# radare2 / rizin

**Kategorie:** Reverse Engineering (CLI)

Kommandozeilen-Framework für Binäranalyse/Reversing: Disassembly, Analyse, Patching, Debugging. Mächtig und skriptbar; **rizin** ist ein benutzerfreundlicher Fork (mit Cutter als GUI). Gute CLI-Ergänzung/Alternative zu Ghidra.

```bash
r2 -A <binary>        # -A = voll analysieren (aaa)
```

## Wichtige Befehle

| Befehl | Zweck |
|--------|-------|
| `aaa` | alles analysieren |
| `afl` | Funktionsliste |
| `iz` / `izz` | Strings (Daten / ganze Datei) |
| `ii` | Imports |
| `axt @ <sym>` | Xrefs zu Symbol/String |
| `pdf @ <fn>` | Disassembly der Funktion |
| `s <addr>` / `V`/`VV` | seek / Visual / Graph-Modus |
| `ood` + `db <addr>` | Debug-Modus + Breakpoint |

## Beispiele

```bash
r2 -A sample.exe
> iz~http          # Strings mit "http"
> axt @ str.gate   # wer nutzt den String
> pdf @ main
```

## Hinweise

Steile Lernkurve; für Einsteiger Ghidra/Cutter-GUI. Gepackte Samples erst entpacken (Übung 08). Nur eigenes, isoliertes Lab.

## Verwendet in

malware-analysis 04 (PE/Imports), 07 (Disassembly), 08.
