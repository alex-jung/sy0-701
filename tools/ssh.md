# ssh

**Kategorie:** Secure Shell / Zugriff & Pivoting

Verschlüsselter Fernzugriff (Port 22). In den Übungen vor allem für **Port-Forwarding / SOCKS-Proxy**, um über einen kompromittierten/erreichbaren Host in ein anderes Netzsegment zu pivoten.

```bash
ssh [Optionen] user@host
```

## Wichtigste Optionen

| Option | Bedeutung |
|--------|-----------|
| `-p <port>` | abweichender SSH-Port |
| `-i <key>` | Private-Key-Datei |
| `-N` | keinen Befehl ausführen (nur Tunnel) |
| `-f` | nach Login in den Hintergrund |
| `-v` / `-vvv` | Debug |
| `-o Option=Wert` | z. B. `-o StrictHostKeyChecking=no` |

## Port-Forwarding (Pivoting – Kern der Übung 09)

| Form | Bedeutung |
|------|-----------|
| `-L <lport>:<ziel>:<zport>` | **Local**: lokaler Port → Ziel durch den SSH-Host |
| `-R <rport>:<ziel>:<zport>` | **Remote**: Port auf dem SSH-Host → zurück zu dir |
| `-D <port>` | **Dynamic**: SOCKS-Proxy (mit proxychains nutzbar) |

## Beispiele

```bash
# SOCKS-Proxy über Pivot-Host, dann mit proxychains scannen
ssh -D 1080 -N user@192.168.20.10

# Lokales Forwarding: erreiche internen MySQL über den Pivot
ssh -L 3306:192.168.20.50:3306 user@192.168.20.10
# -> danach lokal: mysql -h 127.0.0.1 -P 3306 ...

# Remote-Forward (Reverse-Tunnel)
ssh -R 8080:127.0.0.1:80 user@extern
```

## Verwendet in

Übung 09 (SOCKS-Proxy + Port-Forwarding für Pivoting).
