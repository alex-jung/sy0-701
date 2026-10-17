# showmount

**Kategorie:** Enumeration (NFS) · **Teil von:** `nfs-common`

Fragt einen NFS-Server (über `mountd`/RPC), welche Verzeichnisse er **exportiert** und für welche Clients. Erster Schritt der NFS-Enumeration.

```bash
showmount [Optionen] <ziel>
```

## Wichtigste Optionen

| Option | Bedeutung |
|--------|-----------|
| `-e` | Export-Liste anzeigen (wichtigste Option) |
| `-a` | alle aktiven Mounts (host:dir) |
| `-d` | nur die gemounteten Verzeichnisse |
| `--no-headers` | ohne Kopfzeile |

## Beispiel

```bash
showmount -e <ZIEL>
```
```
Export list for <ZIEL>:
/          *            <- an jeden exportiert (kritisch)
/srv/data  192.168.56.0/24
```

## Danach: mounten

```bash
sudo mount -t nfs <ZIEL>:/ /mnt/nfs -o vers=3,nolock
```

## Hinweis

Installation: `sudo apt install nfs-common`. Braucht erreichbaren portmapper (111).

## Verwendet in

enumeration 04 (NFS Enumeration), 10.
