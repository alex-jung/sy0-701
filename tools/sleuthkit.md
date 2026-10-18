# The Sleuth Kit (TSK) & Autopsy

**Kategorie:** Disk-Forensik (Incident Response)

Werkzeugsammlung zur **Disk-/Dateisystem-Forensik** an Images: Dateisystem durchgehen, gelöschte Dateien, Zeitstempel (MACB), Timelines. **Autopsy** ist die GUI dazu.

```bash
<tool> <image.img>
```

## Wichtige Tools

| Tool | Zweck |
|------|-------|
| `mmls` | Partitionstabelle |
| `fls` | Dateien/Verzeichnisse listen (auch gelöschte, `-rd`) |
| `icat` | Dateiinhalt per Inode extrahieren |
| `istat` | Metadaten/Zeitstempel eines Inodes |
| `fls -m` + `mactime` | Dateisystem-**Timeline** (bodyfile) |

## Beispiele

```bash
mmls disk.img
fls -r -m / disk.img > bodyfile
mactime -b bodyfile -d -y > timeline.csv
fls -rd disk.img                 # gelöschte Dateien
icat disk.img <inode> > datei.out
```

## Hinweise

An **Images/Kopien** arbeiten (read-only), Hash prüfen (`incident-response` 05). Für Super-Timelines zusätzlich `plaso/log2timeline`. Autopsy für GUI-Analyse. Nur eigenes Lab.

## Verwendet in

incident-response 06 (Disk-Forensik), 08 (Timeline), 10.
