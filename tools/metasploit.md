# Metasploit Framework (msfconsole)

**Kategorie:** Exploitation-Framework

Modulare Plattform zum Ausnutzen von Schwachstellen. Bedient über die **msfconsole**. Enthält Exploits, Payloads, Auxiliary-/Post-Module und den Post-Exploitation-Payload **Meterpreter**. Mit PostgreSQL-DB für Hosts/Services/Creds.

```bash
msfconsole            # Framework starten
sudo msfdb init       # Datenbank einrichten (einmalig)
```

## Modultypen

| Typ | Zweck |
|-----|-------|
| exploit | Schwachstelle ausnutzen |
| payload | Code nach dem Exploit (Shell/Meterpreter) |
| auxiliary | Scanner/Brute-Force/Enum (ohne Payload) |
| post | Post-Exploitation |
| encoder / nop | Payload-Kodierung / Platzhalter |

## Wichtigste Konsolen-Befehle

| Befehl | Bedeutung |
|--------|-----------|
| `search <term>` | Module finden (`type:`, `cve:`, `platform:`) |
| `use <modul>` | Modul auswählen |
| `info` / `show options` | Doku / Optionen |
| `set` / `setg` / `unset` | Option setzen (lokal/global) |
| `set PAYLOAD <p>` / `show payloads` | Payload wählen |
| `check` / `exploit` / `run` | prüfen / ausführen |
| `sessions [-i <id>] [-u <id>]` | Sessions listen/interagieren/upgraden |
| `background` | Session in den Hintergrund |
| `db_nmap`, `hosts`, `services`, `creds`, `workspace` | DB nutzen |

## Schlüsseloptionen

`RHOSTS`/`RPORT` = Ziel · `LHOST`/`LPORT` = eigener Listener (reverse).

## Meterpreter (Post-Expl.-Payload)

In-Memory, verschlüsselt. Befehle u. a.: `sysinfo`, `getuid`, `ps`, `migrate`, `hashdump`, `download`/`upload`, `shell`, `run post/...`, `run autoroute`.

## Hinweis

Verschafft echten Zugriff → nur eigenes/freigegebenes Lab, Ziel-VMs per **Snapshot** sichern.

## Verwendet in

exploitation-metasploit 01–10 (durchgehend).
