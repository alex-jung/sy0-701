# Lösung – Übung 04: NFS Enumeration

`<ZIEL>` = Metasploitable-IP.

## 1. Exports auflisten

```bash
showmount -e <ZIEL>
```
Beispiel (Metasploitable 2):
```
Export list for <ZIEL>:
/ *
```
→ Das gesamte Root-Dateisystem `/` ist an **`*` (jeden)** exportiert = kritische Fehlkonfiguration.

## 2. RPC bestätigen

```bash
rpcinfo -p <ZIEL>
```
Zeigt u. a. `portmapper` (111), `nfs` (2049), `mountd`. NFS funktioniert nur, wenn portmapper erreichbar ist.

NSE-Alternative:
```bash
nmap -p111,2049 --script nfs-showmount,nfs-ls,nfs-statfs <ZIEL>
```

## 3. Mounten

```bash
sudo mkdir -p /mnt/nfs
sudo mount -t nfs <ZIEL>:/ /mnt/nfs -o vers=3,nolock
ls -la /mnt/nfs
```
Jetzt liegt das Ziel-Dateisystem unter `/mnt/nfs`.

## 4. Daten lesen & no_root_squash-Szenario

```bash
ls -la /mnt/nfs/home
cat /mnt/nfs/etc/passwd           # Benutzerliste
ls -la /mnt/nfs/root             # evtl. nur root lesbar
```
- Mit normalem Mount siehst du alles, was für die exportierte UID lesbar ist.
- Bei **`no_root_squash`** wird dein lokaler root als Server-root behandelt → du kannst z. B. `/root` lesen, SSH-Keys ablegen (`~/.ssh/authorized_keys`) oder eine SUID-Binary platzieren → **Privilege Escalation / Zugang**.
- UID-Trick (klassisch): existiert auf dem Server `msfadmin` mit UID 1000, legt man lokal einen User mit UID 1000 an und liest dessen Dateien.

Aufräumen:
```bash
sudo umount /mnt/nfs
```

## 5. Absicherung

- Exports **nie an `*`** – nur konkrete Hosts/Netze: `/srv/share 192.168.56.70(ro,root_squash)`.
- **`root_squash`** (Default) belassen, **`no_root_squash` vermeiden**; möglichst `ro` (read-only).
- **`all_squash`** + anon-UID für reine Datenablage; NFSv4 mit Kerberos (`sec=krb5`) für echte Auth.
- RPC/NFS-Ports per Firewall nur für berechtigte Clients öffnen.

## Häufige Fehler / Troubleshooting

- **`showmount`/`mount` fehlt:** `sudo apt install nfs-common`.
- **`mount: wrong fs type` / hängt:** NFS-Version erzwingen (`-o vers=3`) bzw. `-o vers=4`; `rpcbind` auf Kali laufen lassen.
- **`access denied`:** Export ist doch auf bestimmte Hosts beschränkt (gut gehärtet) – dann Enumeration dokumentieren, nicht mounten.
- **Permission beim Lesen:** ohne `no_root_squash` greifen die normalen Dateirechte; das ist erwartetes Verhalten.
