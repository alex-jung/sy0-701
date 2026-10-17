# enum4linux / enum4linux-ng

**Kategorie:** Enumeration (SMB/Samba/Windows)

All-in-one-Enumeration für SMB/NetBIOS: Benutzer, Gruppen, Shares, Passwort-Policy, OS/Workgroup, RID-Cycling – in einem Durchlauf. `enum4linux-ng` ist der modernere Rewrite (JSON/YAML-Output, zuverlässiger).

```bash
enum4linux-ng -A <ziel>        # ng: alles
enum4linux   -a <ziel>         # klassisch: alles
```

## Wichtigste Optionen

| Option (ng) | Bedeutung |
|-------------|-----------|
| `-A` | alle Enumerationen |
| `-U` / `-G` / `-S` | nur User / Gruppen / Shares |
| `-P` | Passwort-Policy |
| `-u user -p pass` | mit Credentials |
| `-oJ <datei>` | JSON-Output |

| Option (klassisch) | Bedeutung |
|--------------------|-----------|
| `-a` | alle · `-U -G -S -P -r` einzeln · `-r` RID-Cycling |

## Beispiele

```bash
enum4linux-ng -A <ZIEL>
enum4linux-ng -A -u msfadmin -p msfadmin <ZIEL>
enum4linux -a <ZIEL>
```

## Hinweis

Nutzt intern `smbclient`/`rpcclient`/`nmblookup`. `enum4linux-ng`: `pipx install enum4linux-ng` oder aus GitHub; `enum4linux` ist in Kali vorhanden.

## Verwendet in

enumeration 06 (SMB Deep), 10.
