# netcat (nc)

**Kategorie:** Netzwerk-Multitool („TCP/IP Swiss Army Knife")

Liest/schreibt rohe TCP- und UDP-Verbindungen. In den Übungen für **manuelles Banner-Grabbing** (Dienst-/Versionsinfo ohne Scanner). Darüber hinaus für Listener, Datei-Transfer und Reverse/Bind-Shells (im Lab).

> Varianten: `nc` (traditional/BSD), `ncat` (Nmap-Projekt, kann TLS/Proxy), `nc.openbsd`. Optionen können leicht abweichen.

```bash
nc [Optionen] <host> <port>
```

## Wichtigste Optionen

| Option | Bedeutung |
|--------|-----------|
| `-l` | Listen-Modus (Server) |
| `-p <port>` | lokalen Port festlegen |
| `-v` / `-vv` | verbose (Verbindungsinfo) |
| `-n` | keine DNS-Auflösung |
| `-u` | UDP statt TCP |
| `-w <sek>` | Timeout |
| `-z` | Zero-I/O, nur Portcheck (Scan) |
| `-k` | (ncat) Listener offen halten |

## Beispiele

```bash
# Banner grabben
nc 192.168.56.100 21
printf 'HEAD / HTTP/1.0\r\n\r\n' | nc 192.168.56.100 80

# Portcheck
nc -zv 192.168.56.100 20-25

# Listener <-> Client (Chat/Datei im Lab)
nc -lvnp 4444                 # Server
nc 192.168.56.50 4444         # Client
nc -lvnp 4444 > datei.bin     # Datei empfangen
nc 192.168.56.50 4444 < datei.bin   # Datei senden
```

## Verwendet in

Übung 04 (manuelles Banner-Grabbing FTP/HTTP).
