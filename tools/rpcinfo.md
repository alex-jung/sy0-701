# rpcinfo

**Kategorie:** Enumeration (RPC) · **Teil von:** `rpcbind`

Fragt den **portmapper/rpcbind** (Port 111) eines Hosts ab und listet alle registrierten RPC-Programme mit Version, Protokoll und Port – u. a. NFS, mountd, NIS, status.

```bash
rpcinfo [Optionen] <ziel>
```

## Wichtigste Optionen

| Option | Bedeutung |
|--------|-----------|
| `-p <ziel>` | alle registrierten RPC-Programme auflisten |
| `-s <ziel>` | kompakte Übersicht |
| `-T <proto>` | Transport (tcp/udp) |

## Beispiel

```bash
rpcinfo -p <ZIEL>
```
```
program vers proto   port  service
100000    2   tcp    111  portmapper
100005    1   udp  48002  mountd
100003    2   tcp   2049  nfs
```

## Hinweis

Zeigt, ob NFS/mountd (Übung 04) erreichbar sind. Installation: `sudo apt install rpcbind`.

## Verwendet in

enumeration 04 (NFS), 05 (NetBIOS/RPC), 10.
