# Übung 05 – NetBIOS / RPC Enumeration

**Schwierigkeit: 5/10 · Dauer: ca. 50 Min.**

## Lernziele

- NetBIOS-Namensdienst (137) und die zugehörigen Infos verstehen
- RPC/portmapper (111) und MSRPC (135) enumerieren
- Über `rpcclient` eine Null Session für erste User-/Domain-Abfragen nutzen
- Die Rolle dieser „Hilfsdienste" als Enumeration-Einfallstor begreifen

## Theorie

Neben den „großen" Diensten liefern **Namens- und RPC-Dienste** viel Kontext:

- **NetBIOS Name Service (UDP 137):** verrät NetBIOS-Namen, Domäne/Workgroup, Rolle und die **MAC-Adresse**. `nbtscan`/`nmblookup` fragen das ab.
- **RPC portmapper (111, Unix):** listet, welche RPC-Programme (NFS, mountd, NIS …) auf welchen Ports laufen → `rpcinfo`.
- **MSRPC (135, Windows):** Endpoint Mapper; über `rpcclient` lassen sich bei schwacher Konfiguration (Null Session) User, Gruppen, Domäne abfragen (Vollausbau in Übung 06).

Diese Dienste sind oft der „Kitt", der die eigentlichen Enumeration-Angriffe (SMB, NFS) erst ermöglicht.

## Verwendete Tools

| Tool | Zweck | Wichtige Optionen |
|------|-------|-------------------|
| `nbtscan` | NetBIOS-Namen im Netz | `nbtscan <range>`, `-v` |
| `nmblookup` | NetBIOS-Abfrage | `-A <ziel>` |
| `rpcinfo` | RPC/portmapper (Unix) | `-p <ziel>` |
| `rpcclient` | MSRPC/Samba-Abfragen | `-U "" -N <ziel>`, dann `srvinfo`, `enumdomusers` |
| `nmap` NSE | Ergänzung | `--script nbstat,msrpc-enum,rpcinfo` |

## Lab-Setup

- Metasploitable (Samba/NetBIOS, portmapper). Kali mit `nbtscan`, `samba-common-bin` (für `rpcclient`/`nmblookup`).

## Aufgabe (selbst lösen)

1. Ermittle mit `nbtscan`/`nmblookup` den **NetBIOS-Namen**, die **Workgroup/Domäne** und die **MAC** des Ziels.
2. Liste mit `rpcinfo -p` alle **RPC-Dienste** des Ziels auf. Welche erkennst du wieder (NFS/mountd)?
3. Baue mit `rpcclient` eine **Null Session** auf und frage `srvinfo` sowie erste Domäneninfos ab.
4. Teste, ob `rpcclient` dir bereits User/Gruppen zeigt (Vertiefung folgt in Übung 06).
5. Erkläre, warum man diese Hilfsdienste ins Enumeration-Bild einbezieht und wie man sie absichert.

**Ziel:** ein NetBIOS-/RPC-Profil des Ziels (Namen, Workgroup, MAC, RPC-Dienste) + erfolgreiche rpcclient-Null-Session.

## SY0-701 Prüfungsbezug

- **NetBIOS (137–139) / RPC (111/135)** als Ports/Protokolle und Enumeration-Quellen.
- **Null session / anonymous access** als Misconfiguration.
- **Attack surface reduction:** unnötige Namens-/RPC-Dienste deaktivieren/filtern.
- Begriffe: *NetBIOS*, *RPC/portmapper*, *MSRPC endpoint mapper*, *null session*, *workgroup/domain*, *hardening*.
