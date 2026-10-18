# Volatility

**Kategorie:** Memory-Forensik (Incident Response)

Framework zur Analyse von **RAM-Images**. Findet, was auf der Platte fehlt: laufende/versteckte Prozesse, Netzverbindungen, **fileless Malware**, Injection, Credentials, Befehlshistorie. **Volatility 3** erkennt Profile meist automatisch.

```bash
vol -f <mem-image> <plugin>
```

## Wichtige Plugins (Linux / windows.*)

| Plugin | Zweck |
|--------|-------|
| `linux.pslist` / `windows.pslist` | Prozessliste |
| `linux.pstree` / `windows.pstree` | Prozessbaum (Eltern/Kind) |
| `linux.sockstat` / `windows.netscan` | Netzverbindungen (C2) |
| `linux.malfind` / `windows.malfind` | Code-Injection |
| `linux.bash` / `windows.cmdline` | Befehls-/Kommandozeile |
| `windows.hashdump` | Credential-Hashes |

## Beispiele

```bash
vol -f mem.lime linux.pstree
vol -f mem.lime linux.sockstat
vol -f mem.raw windows.malfind
```

## Hinweise

RAM-Image vorher sichern (avml/LiME für Linux, WinPmem/DumpIt für Windows). Order of Volatility beachten (`incident-response` 05/06). An Kopien/Images arbeiten. Nur eigenes Lab.

## Verwendet in

incident-response 06 (Memory-Forensik), 08, 10.
