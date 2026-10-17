# netdiscover

**Kategorie:** Host Discovery · **Benötigt root:** ja (Raw-Frames)

ARP-basiertes Discovery-Tool für das lokale Segment. Kann **aktiv** scannen (ARP-Requests senden) oder **passiv** nur mithören – Letzteres erzeugt keinen eigenen Traffic und ist dadurch unauffällig.

```bash
sudo netdiscover [Optionen]
```

## Wichtigste Optionen

| Option | Bedeutung |
|--------|-----------|
| `-r <range>` | Zielbereich aktiv scannen, z. B. `-r 192.168.56.0/24` |
| `-l <datei>` | Range-Liste aus Datei |
| `-i <iface>` | Interface wählen (z. B. `eth0`) |
| `-p` | **passiver** Modus (nur mithören, nichts senden) |
| `-P` | maschinenlesbare Ausgabe (parsebar) |
| `-N` | keine Kopfzeile ausgeben |
| `-f` | „fast mode" (nur eine Adresse pro Host anpingen) |
| `-s <t>` | Sleep-Zeit zwischen Paketen (leiser) |

## Beispiele

```bash
sudo netdiscover -r 192.168.56.0/24     # aktiv scannen
sudo netdiscover -p -i eth0             # passiv mithören
```

## Hinweise

- Funktioniert nur **im selben Broadcast-Segment** (ARP wird nicht geroutet).
- Ohne `-r`/`-l` erkennt netdiscover gängige private Ranges automatisch.

## Verwendet in

Übung 01 (Host Discovery).
