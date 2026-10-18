# Lösung – Übung 05: Beweissicherung

## 1. Order of Volatility (für den Host)

1. RAM + flüchtig (Prozesse, Verbindungen, angemeldete User, Zeit) — **zuerst**
2. Netz-/Kernel-Status (arp, routing, sockets)
3. Disk (Image)
4. zentrale/Remote-Logs (liegen schon im SIEM)
5. Archiv/physisch

## 2. Flüchtige Live-Daten sichern

```bash
date -u > evidence/00_time.txt
ps auxww > evidence/01_procs.txt
ss -tunap > evidence/02_connections.txt
who; last > evidence/03_logins.txt
ip a; ip route; arp -an > evidence/04_net.txt
# (RAM-Image: Übung 06)
```
Auf externes Medium schreiben, Ausgaben hashen.

## 3. Disk-Image + Hashes

```bash
# VOR dem Image: Quell-Device hashen
sudo sha256sum /dev/sdX > evidence/disk_pre.sha256
# Image erstellen (dc3dd hasht beim Lesen gleich mit):
sudo dc3dd if=/dev/sdX of=evidence/disk.img hash=sha256 log=evidence/dc3dd.log
# oder dd + Hash danach:
sudo dd if=/dev/sdX of=evidence/disk.img bs=4M conv=noerror,sync status=progress
sudo sha256sum evidence/disk.img > evidence/disk_post.sha256
```
`disk_pre` (Device) und `disk_post` (Image) müssen **übereinstimmen** → das Image ist eine korrekte, unveränderte Kopie.

## 4. Chain of Custody (Formular)

```
Beweis-ID:   EV-2026-001
Beschreibung: Disk-Image Host X (/dev/sdX)
Quelle:      Host X, isoliert um <Zeit>
Erstellt:    <Datum/Zeit UTC> von <Name>
Hash:        sha256 <wert>
Aufbewahrung: <Ort/verschlossen>
Übergaben:   <wer -> wer, wann>  (lückenlos!)
```

## 5. Warum am Image arbeiten

Jede Analyse am Original kann es **verändern** (mounten schreibt Zeitstempel!) → Beweiswert zerstört. Darum: Original read-only/write-blocker, **alle Analysen an der verifizierten Kopie**; der Hash beweist jederzeit die Unverändertheit.

## Häufige Fehler / Troubleshooting

- **Original gemountet (rw):** verändert Metadaten → nur read-only (`mount -o ro,noexec,nodev` bzw. Loop vom Image).
- **Reihenfolge falsch:** erst Disk, dann RAM → RAM-Beweise verloren (Volatility!).
- **Kein Hash:** Beweis nicht verwertbar.
- **Doku-Lücke in CoC:** Verwertbarkeit gefährdet.
