# Übung 06 – Geräte- & Medien-Schutz

**Schwierigkeit: 6/10 · Dauer: ca. 60 Min.**

## Lernziele

- Hardware und Datenträger physisch schützen
- Asset-/Media-Handling (Inventar, Transport, Entsorgung) verstehen
- Physischen und logischen Schutz verzahnen (FDE, Ports, Tamper)

## Theorie

Geräte und Medien sind direkte Diebstahls-/Manipulationsziele. Schutzmaßnahmen (SY0-701):

- **Device locks:** Kabelschloss (Kensington), abschließbare **Racks/Schränke**, gesicherte Serverräume.
- **Asset tracking/Inventar:** Tags/Asset-IDs, **tamper-evident seals** (zeigen Manipulation), ggf. GPS/Geofencing (mobil).
- **Port/Interface-Schutz:** USB/Port-Blocker, deaktivierte Boot-Optionen/BIOS-Passwort, **port security** (Netz).
- **Media handling:** sichere Lagerung/Transport (verschlüsselt), **chain of custody** (Beweiskette), **sichere Entsorgung/Sanitization** (`data-protection` 08: shred/degauss/crypto erase).
- **Faraday cage/TEMPEST** (Abstrahlung/HF – hohe Sicherheit), **removable media policy**.

Verzahnung mit logisch: **FDE** (gestohlene Disk nutzlos), BIOS/Boot-Lock (kein USB-Boot), Tamper-Detection + Alarm. Prinzip: physischer Diebstahl darf **keinen** Datenzugriff bedeuten.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| (konzeptionell) | Geräte-/Medien-Schutz |
| FDE (cryptsetup) | logische Ergänzung |

## Lab-Setup

- Dein Mini-PC/Netzwerkgeräte/Datenträger als Objekt.

## Aufgabe (selbst lösen)

1. Liste deine Lab-Hardware/-Medien und ordne je einen physischen Schutz zu (Schloss/Rack/Seal/FDE).
2. Erkläre, wie physischer Schutz + **FDE** + BIOS/Boot-Lock zusammen „Diebstahl ≠ Datenzugriff" sichern.
3. Beschreibe sicheres **Media Handling** (Lagerung, Transport, Entsorgung) und **chain of custody**.
4. Erkläre tamper-evident seals und Port-/USB-Schutz mit je einem Einsatzfall.

**Ziel:** ein stimmiges Konzept für physischen Geräte-/Medien-Schutz, verzahnt mit FDE/BIOS.

## SY0-701 Prüfungsbezug

- **1.0/2.0** device/cable locks, racks, tamper-evident seals, asset tracking, port/USB protection, media handling, Faraday cage/TEMPEST.
- Begriffe: *cable/device lock*, *tamper-evident seal*, *asset tracking*, *port security/USB blocker*, *media handling/chain of custody*, *Faraday/TEMPEST*, *FDE*.
