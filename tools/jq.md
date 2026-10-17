# jq

**Kategorie:** JSON-Verarbeitung (Hilfstool)

Kommandozeilen-Prozessor für JSON. In der Recon genutzt, um JSON-APIs (z. B. crt.sh, theHarvester-Reports, Shodan) zu filtern und auszuwerten.

```bash
jq [Optionen] '<filter>' [datei]
```

## Wichtigste Bausteine

| Ausdruck | Bedeutung |
|----------|-----------|
| `.` | Eingabe unverändert (pretty-print) |
| `.feld` | Feld auslesen |
| `.[]` | über Array iterieren |
| `.[].name` | Feld aus jedem Array-Element |
| `-r` | rohe Strings (ohne Anführungszeichen) |
| `-c` | kompakt (eine Zeile pro Objekt) |
| `select(.x==…)` | filtern |

## Beispiele

```bash
# Subdomains aus crt.sh-JSON
curl -sS "https://crt.sh/?q=%25.example.com&output=json" | jq -r '.[].name_value' | sort -u

# Hosts aus theHarvester-Report
jq -r '.hosts[]?' harvest.json

# nur bestimmte Felder
jq -r '.[] | [.ip_str, .port] | @csv' shodan.json
```

## Hinweis

Installation: `sudo apt install jq`.

## Verwendet in

reconnaissance 05 (crt.sh parsen), 07 (Reports), 10 (Workflow).
