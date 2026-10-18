# Übung 05 – Beweissicherung (Order of Volatility, Chain of Custody)

**Schwierigkeit: 5/10 · Dauer: ca. 60 Min.**

## Lernziele

- Die Order of Volatility verstehen und Beweise in richtiger Reihenfolge sichern
- Beweise forensisch korrekt sichern (Imaging + Hashing, Integrität)
- Chain of Custody und rechtliche Verwertbarkeit sicherstellen
- Live- vs. Dead-Acquisition unterscheiden

## Theorie

**Order of Volatility:** flüchtige Beweise zuerst sichern, bevor sie verschwinden:
1. **CPU-Register/Cache**, 2. **RAM/Arbeitsspeicher + aktive Verbindungen/Prozesse**, 3. **flüchtige Daten (routing/arp/sockets)**, 4. **Disk**, 5. **Logs auf Remote/zentral**, 6. **physisch/Archiv**.

Forensische Prinzipien:
- **Integrität:** vor **und** nach der Sicherung **Hash** (SHA-256) bilden → beweist, dass das Image nicht verändert wurde. **Write-Blocker**/read-only beim Zugriff auf Original.
- **Chain of Custody:** lückenlose Dokumentation, **wer** **wann** **was** mit dem Beweis gemacht hat (Übergaben, Lagerung) → Verwertbarkeit vor Gericht.
- **Live Acquisition** (laufendes System: RAM, flüchtig – Übung 06) vs. **Dead Acquisition** (ausgeschaltet: Disk-Image).
- **Arbeiten an Kopien**, nie am Original.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `dd` / `dc3dd` / `dcfldd` | Disk-/Partition-Image |
| `sha256sum` / `md5sum` | Hash/Integrität |
| `avml` / LiME | RAM-Image (Übung 06) |
| Chain-of-Custody-Formular | Doku |

## Lab-Setup

- Kompromittierter, **isolierter** Lab-Host (Übung 04). Ein Ziel-Datenträger/Image-Speicher. Snapshot.

## Aufgabe (selbst lösen)

1. Lege die **Order of Volatility** für deinen Host fest: welche Beweise sicherst du in welcher Reihenfolge?
2. Sichere flüchtige Live-Daten (laufende Prozesse, Netzverbindungen, angemeldete User, Zeit) **vor** dem Disk-Image.
3. Erstelle ein **Disk-Image** (dd/dc3dd) eines Datenträgers/einer Partition und bilde **vorher/nachher Hashes** – stimmen sie überein?
4. Fülle ein **Chain-of-Custody**-Protokoll aus (Beweis-ID, Zeit, Quelle, Hash, wer).
5. Erkläre, warum man am **Image** arbeitet und das Original read-only behandelt.

**Ziel:** flüchtige Daten + ein gehashtes Disk-Image korrekt gesichert, mit Chain-of-Custody-Doku – forensisch verwertbar.

## SY0-701 Prüfungsbezug

- **Order of volatility**, **forensic imaging**, **hashing/integrity**, **write blocker**, **chain of custody**.
- Live vs. dead acquisition; „arbeite an Kopien"; rechtliche Verwertbarkeit.
- Begriffe: *order of volatility*, *chain of custody*, *forensic image*, *hashing*, *write blocker*.
