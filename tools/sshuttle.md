# sshuttle

**Kategorie:** Pivoting (VPN über SSH)

Tunnelt **ganze Subnetze transparent über eine SSH-Verbindung** – wie ein leichtgewichtiges VPN. Kein proxychains nötig: interne Hosts sind danach direkt erreichbar (inkl. DNS). Braucht nur SSH-Zugang zum Pivot und Python auf dem Pivot.

```bash
sshuttle -r user@pivot <subnetz> [Optionen]
```

## Wichtigste Optionen

| Option | Bedeutung |
|--------|-----------|
| `-r user@pivot` | SSH-Pivot (Remote) |
| `<subnetz>` | zu tunnelndes Netz, z. B. `192.168.20.0/24` |
| `--dns` | DNS über den Pivot auflösen |
| `-x <netz>` | Netz vom Tunnel ausnehmen |
| `-N` | Routen automatisch vom Pivot übernehmen |
| `-v` | verbose |

## Beispiele

```bash
sshuttle -r user@pivot 192.168.20.0/24
sshuttle --dns -r user@pivot 192.168.20.0/24
# danach direkt (ohne proxychains):
nmap -sT 192.168.20.50
ssh admin@192.168.20.50
```

## Hinweis

Braucht **root lokal** (setzt Routing/iptables) und Python auf dem Pivot. Komfortabler als `-D`+proxychains für ganze Netze; nur eigene/freigegebene Umgebungen.

## Verwendet in

post-exploitation-pivoting 05 (SSH-Tunneling), 10.
