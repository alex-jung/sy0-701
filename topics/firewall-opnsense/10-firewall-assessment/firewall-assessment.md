# Übung 10 – Firewall-Assessment & Rule-Review + Report

**Schwierigkeit: 10/10 · Dauer: ca. 2–3 Std.**

## Lernziele

- Ein vollständiges Firewall-/Perimeter-Assessment durchführen
- Das Regelwerk systematisch auditieren (least privilege, tote/überbreite Regeln)
- Die Konfiguration von außen UND innen verifizieren (nmap durch die Firewall)
- Findings priorisieren und einen Review-Report erstellen

## Theorie

Firewall-Regelwerke „verrotten" über Zeit: überbreite Regeln, verwaiste Port Forwards, `any/any`-Altlasten, undokumentierte Einträge. Ein **Rule Review / Firewall Assessment** prüft systematisch:

1. **Exposure (North-South):** welche Dienste sind von WAN erreichbar (Port Forwards)? Nötig? Quelle eingeschränkt?
2. **Regel-Hygiene:** `any/any`, zu breite Ports, **tote/ungenutzte** Regeln (Hit-Count), fehlende Beschreibungen, Reihenfolge-Probleme.
3. **Segmentierung (East-West):** halten die Inter-VLAN-Regeln? (mit `nmap` durch die Firewall testen, Bezug `network-scanning` Übung 09).
4. **Egress:** ausgehend begrenzt?
5. **Betrieb:** Logging, Backup, Updates, HA, Management-Härtung.

Ergebnis: priorisierte Findings + Härtung. `firewall-review-template.md` ist das Gerüst.

## Verwendete Tools

Kombination aus Übung 01–09: OPNsense Web-UI (Rules/States/Logs/Diagnostics), `nmap`/`tcpdump` (Verifikation von mehreren Segmenten) + `firewall-review-template.md`.

## Lab-Setup

- Das aufgebaute OPNsense-Lab mit mehreren Segmenten + Test-Hosts + Kali. Backup.

## Aufgabe (selbst lösen)

Auditiere dein eigenes OPNsense-Regelwerk wie bei einem Review.

1. **Exposure:** liste alle Port Forwards + WAN-Pass-Regeln. Ist jede nötig, dokumentiert, quell-eingeschränkt?
2. **Hygiene:** finde `any/any`-/überbreite Regeln, tote Regeln (Hit-Count = 0 über längere Zeit), fehlende Beschreibungen.
3. **Segmentierungs-Test:** scanne mit `nmap` aus jedem Segment, ob die Isolation (Guest/IoT) hält – decken sich Soll (Regeln) und Ist?
4. **Egress + Betrieb:** prüfe Egress-Policy, Logging, Backup-Stand, Updates, Management-Härtung.
5. **Report:** fülle `firewall-review-template.md` – Findings mit Risiko + Empfehlung, priorisiert.

**Ziel:** ein belegtes Firewall-Assessment (Exposure + Hygiene + Segmentierung + Betrieb) mit priorisierten Härtungsempfehlungen.

## SY0-701 Prüfungsbezug

- **Firewall rule review / configuration audit**, least privilege, **attack surface reduction**.
- **Verifikation** (nmap durch die Firewall) = Soll/Ist-Abgleich; **secure network design**.
- Begriffe: *rule review/audit*, *least privilege*, *attack surface*, *segmentation verification*, *change management*.
