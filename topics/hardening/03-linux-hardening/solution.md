# Lösung – Übung 03: Linux-Hardening

> Snapshot vorher.

## 1. SUID & Rechte

```bash
find / -perm -4000 -type f 2>/dev/null          # SUID-Set prüfen
sudo chmod u-s /usr/bin/<unnötige-suid>          # unnötiges SUID entfernen
ls -l /etc/shadow /etc/passwd                     # 640 root:shadow / 644 root:root
find / -xdev -type f -perm -0002 2>/dev/null      # world-writable aufspüren
```
Entferne SUID bei Tools, die es nicht brauchen (z. B. historische GTFOBins-Kandidaten), korrigiere world-writable.

## 2. sysctl-Härtung

`/etc/sysctl.d/99-hardening.conf`:
```
kernel.randomize_va_space = 2
kernel.dmesg_restrict = 1
kernel.kptr_restrict = 2
kernel.unprivileged_userns_clone = 0
fs.suid_dumpable = 0
net.ipv4.conf.all.rp_filter = 1
net.ipv4.conf.all.accept_redirects = 0
net.ipv4.conf.all.log_martians = 1
```
```bash
sudo sysctl --system
sysctl kernel.kptr_restrict        # verifizieren
```

## 3. Modul blacklisten

`/etc/modprobe.d/blacklist-hardening.conf`:
```
install usb-storage /bin/true
blacklist firewire-core
```
```bash
sudo modprobe usb-storage && echo "geladen" || echo "blockiert"   # sollte blockiert sein
```

## 4. Mount-Optionen /tmp

`/etc/fstab` (bzw. systemd-Mount):
```
tmpfs /tmp tmpfs defaults,noexec,nosuid,nodev 0 0
```
```bash
sudo mount -o remount /tmp
cp /bin/ls /tmp/x && /tmp/x        # -> Permission denied (noexec) = Härtung wirkt
```

## 5. Re-Audit

```bash
sudo lynis audit system
```
Hardening-Index vergleichen (Übung 02 vorher) → sollte gestiegen sein; erledigte Suggestions sind weg.

## Härtung/Betrieb

Per Configuration Management (Ansible) ausrollen + Drift prüfen; Änderungen testen (SSH/Dienste nicht brechen).

## Häufige Fehler / Troubleshooting

- **System/Dienst kaputt nach SUID-Entfernung:** manche Binaries brauchen SUID (passwd/sudo) → nur unnötige; Snapshot zurück.
- **`/tmp noexec` bricht Installer/Build:** bewusst abwägen; für Builds temporär anderes TMPDIR.
- **sysctl nicht persistent:** in `/etc/sysctl.d/` + `sysctl --system`.
- **Modul lädt trotzdem:** `install ... /bin/true` statt nur `blacklist` (verhindert auch indirektes Laden).
