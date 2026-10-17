# Übung 04 – NFS Enumeration

**Schwierigkeit: 4/10 · Dauer: ca. 45 Min.**

## Lernziele

- NFS und seine Abhängigkeit von RPC/portmapper verstehen
- Exportierte Verzeichnisse (Exports) auflisten
- Einen offenen Export mounten und auf Daten/Berechtigungen prüfen
- Das Risiko schwacher Export-Optionen (`no_root_squash`, `*`) erkennen

## Theorie

**NFS** (Network File System, Port 2049, über **RPC**/portmapper 111) teilt Verzeichnisse übers Netz. Der Server definiert in `/etc/exports`, **welche Verzeichnisse** für **welche Clients** freigegeben sind. Schwache Konfiguration = großes Risiko:

- Export an `*` (jeder darf mounten) → Dateizugriff ohne Auth.
- **`no_root_squash`** → root des Clients wird als root auf dem Server behandelt → Dateien als root lesen/schreiben, potenziell Privilege Escalation.
- NFS vertraut klassisch der **UID** des Clients → man kann lokal einen User mit passender UID anlegen und so an fremde Dateien kommen.

`showmount` fragt den Server, welche Exports es gibt; danach `mount` zum Zugriff.

## Verwendete Tools

| Tool | Zweck | Wichtige Optionen |
|------|-------|-------------------|
| `showmount` | Exports auflisten | `-e <ziel>` (Exports), `-a` (aktive Mounts) |
| `rpcinfo` | RPC-Dienste/portmapper | `-p <ziel>` |
| `mount` | Export einhängen | `-t nfs <ziel>:/export /mnt/...`, `-o vers=3` |
| `nmap` NSE | NFS-Infos | `--script nfs-showmount,nfs-ls,nfs-statfs` |

## Lab-Setup

- Metasploitable (NFS aktiv, `/` oft exportiert). Kali mit `nfs-common` (`sudo apt install nfs-common`).
- Mount-Punkt auf Kali: `sudo mkdir -p /mnt/nfs`.

## Aufgabe (selbst lösen)

1. Liste mit `showmount -e` alle **Exports** des Ziels auf. Welche Verzeichnisse sind freigegeben, für welche Clients?
2. Bestätige über `rpcinfo -p`, dass NFS + portmapper laufen.
3. **Mounte** einen offenen Export auf Kali und sieh dir Inhalt + Berechtigungen an.
4. Finde heraus, ob du sensible Dateien lesen kannst (z. B. unter dem gemounteten Pfad). Was wäre bei `no_root_squash` möglich?
5. Erkläre, wie man NFS-Exports korrekt absichert.

**Ziel:** eine Liste der NFS-Exports + ein erfolgreich gemounteter Share, aus dem du Daten lesen kannst.

## SY0-701 Prüfungsbezug

- **File sharing services & misconfiguration:** offene Exports = Information Disclosure / unautorisierter Zugriff.
- **RPC/portmapper (111)** als Enabler; Dienste, die man kennen/filtern muss.
- **Privilege escalation** via `no_root_squash` – Zusammenspiel Netz + lokale Rechte.
- Begriffe: *NFS*, *RPC/portmapper*, *export*, *root squash*, *least privilege*, *misconfiguration*.
