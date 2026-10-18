# Übung 03 – Linux-Hardening (Dateirechte, Kernel, Module)

**Schwierigkeit: 3/10 · Dauer: ca. 60 Min.**

## Lernziele

- Kern-Härtungsmaßnahmen auf Linux umsetzen
- Dateirechte/SUID bereinigen (schließt PrivEsc-Vektoren)
- Kernel per sysctl härten; unnötige Kernel-Module blockieren
- Mount-Optionen und Host-Firewall als Härtung nutzen

## Theorie

Konkrete Linux-Härtung, die direkt die Angriffe aus `privilege-escalation` schließt:

- **SUID/SGID aufräumen:** nicht benötigte SUID-Bits entfernen (GTFOBins-Vektoren!), SUID-Set auditieren.
- **Dateirechte:** sensible Dateien korrekt (`/etc/shadow` 640 root:shadow, `/etc/passwd` 644, keine world-writable Dateien, kein `.` im PATH).
- **Kernel-Härtung (sysctl):** `kernel.randomize_va_space`, `kernel.dmesg_restrict`, `kernel.kptr_restrict`, `kernel.unprivileged_userns_clone=0`, `net.ipv4.*`-Spoofing-Schutz, `fs.suid_dumpable=0`.
- **Kernel-Module blockieren:** ungenutzte/gefährliche Module (z. B. `usb-storage`, exotische Dateisysteme) per blacklist deaktivieren.
- **Mount-Optionen:** `/tmp`,`/var/tmp`,`/home` mit `noexec,nosuid,nodev` (erschwert Payload-Ausführung/SUID).
- **Host-Firewall** (nftables/ufw): default-deny inbound.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `find -perm` / `chmod` | SUID/Rechte |
| `sysctl`/`/etc/sysctl.d` | Kernel-Parameter |
| `/etc/modprobe.d` | Module blacklisten |
| `/etc/fstab` | Mount-Optionen |
| `nft`/`ufw` | Host-Firewall |

## Lab-Setup

- Eine Linux-VM (idealerweise mit den Lynis-Funden aus Übung 02). **Snapshot.**

## Aufgabe (selbst lösen)

1. Auditiere das **SUID-Set** und entferne mind. ein unnötiges SUID-Bit (begründet). Prüfe Rechte auf `/etc/shadow`/`passwd` + world-writable Dateien.
2. Setze mehrere **sysctl-Härtungen** (ASLR, dmesg/kptr restrict, userns, Spoofing-Schutz) persistent und verifiziere.
3. **Blackliste** ein ungenutztes Kernel-Modul und prüfe, dass es nicht lädt.
4. Härte Mount-Optionen für `/tmp` (`noexec,nosuid,nodev`) und teste, dass dort keine Binary ausführbar ist.
5. Re-audite mit Lynis und vergleiche den **Hardening-Index** mit Übung 02.

**Ziel:** mehrere Kern-Härtungen umgesetzt (SUID/Rechte, sysctl, Module, Mounts) + messbar verbesserter Lynis-Index.

## SY0-701 Prüfungsbezug

- **OS-Hardening**, SUID/Rechte (schließt PrivEsc), **sysctl/Kernel-Härtung**, Mount-Optionen, Host-Firewall.
- **Least functionality** auf Kernel-/Dateisystem-Ebene.
- Begriffe: *OS hardening*, *SUID*, *ASLR*, *kernel hardening (sysctl)*, *noexec/nosuid mount*.
