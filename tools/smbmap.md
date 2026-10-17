# smbmap

**Kategorie:** Enumeration (SMB)

Zeigt SMB-Freigaben **mit Berechtigungen** (READ/WRITE/NO ACCESS) übersichtlich an, kann rekursiv durch Shares laufen, Dateien suchen/herunterladen und Kommandos ausführen (bei ausreichenden Rechten).

```bash
smbmap -H <ziel> [-u user -p pass]
```

## Wichtigste Optionen

| Option | Bedeutung |
|--------|-----------|
| `-H <ziel>` | Ziel-Host |
| `-u '' -p ''` | anonym (Null Session) |
| `-u user -p pass` | mit Credentials |
| `-r [share]` | rekursiv auflisten |
| `-R [share]` | rekursiv, komplett |
| `--download <pfad>` | Datei herunterladen |
| `-x '<cmd>'` | Kommando ausführen (wenn erlaubt) |

## Beispiele

```bash
smbmap -H <ZIEL> -u '' -p ''
smbmap -H <ZIEL> -u msfadmin -p msfadmin -r tmp
smbmap -H <ZIEL> -u '' -p '' --download 'tmp/flag.txt'
```

## Hinweis

Installation: `sudo apt install smbmap`.

## Verwendet in

enumeration 02 (SMB Basics), 06, 10.
