# Lösung – Übung 06: Geräte- & Medien-Schutz

## 1. Hardware/Medien + Schutz (Beispiel)

| Asset | Physischer Schutz |
|-------|-------------------|
| Mini-PC | abschließbarer Schrank/Rack + Kabelschloss |
| Datenträger/Backups | verschlossener Safe/Schrank + FDE |
| Netzwerkgeräte (OPNsense/Switch) | Rack-Schloss, Raum gesichert |
| USB-Sticks | verschlossene Lagerung, verschlüsselt, Inventar |

## 2. Diebstahl ≠ Datenzugriff

- **FDE/LUKS:** gestohlene Disk ist ohne Key nutzlos (`data-protection` 03).
- **BIOS/Boot-Lock:** kein USB-/Live-Boot → kein Umgehen des OS.
- **Physischer Schutz:** verzögert/verhindert Zugriff + Tamper-Detection.
Zusammen: selbst bei Diebstahl bleiben Daten vertraulich.

## 3. Media Handling + Chain of Custody

- **Lagerung:** verschlossen, klimatisiert, Zugriff beschränkt; Backups verschlüsselt + offsite (3-2-1).
- **Transport:** verschlüsselt, versiegelt, dokumentiert.
- **Entsorgung:** Sanitization (shred/degauss/crypto erase) + Zertifikat (`data-protection` 08).
- **Chain of Custody:** lückenlose Dokumentation, wer wann Zugriff auf ein Medium hatte (v. a. forensisch, `incident-response`).

## 4. Seals + Port-Schutz

- **Tamper-evident seal** am Gehäuse/Rack: zeigt, ob jemand geöffnet hat (Einsatz: Server/Beweismittel).
- **Port/USB-Schutz:** USB-Blocker/deaktivierte Ports gegen Rogue-Devices/Datenabfluss (Einsatz: öffentlich zugängliche Terminals, Kiosk).

## Hinweise / Troubleshooting

- Physisch + logisch zusammen denken: Rack-Schloss **und** FDE/BIOS-Lock.
- Tamper-Seals müssen **geprüft** werden, sonst nutzlos.
- Entsorgung/Chain of Custody werden oft vergessen → häufige Lücke.
