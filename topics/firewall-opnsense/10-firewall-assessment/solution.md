# Lösung – Übung 10: Firewall-Assessment

Beispiel-Review des eigenen OPNsense. `firewall-review-template.md` ist das Gerüst.

## 1. Exposure

**Firewall → NAT → Port Forward** + **Rules → WAN** durchgehen. Je Eintrag: Ziel, Quelle, Zweck, Notwendigkeit. Finding-Beispiel: Port Forward mit `Source any` → auf benötigte Quelle/Alias einschränken.

## 2. Hygiene

- `any/any`-Regeln suchen (v. a. Rest-Default-Allow auf LAN).
- **Hit-Count:** Firewall → Rules zeigt Treffer pro Regel → Regeln mit 0 Treffern über Wochen = Kandidaten zum Entfernen.
- Beschreibungen prüfen; Reihenfolge (spezifisch vor breit).

## 3. Segmentierungs-Test (nmap)

Aus jedem Segment testen (Soll/Ist):
```bash
# vom GUEST-Host:
nmap -Pn 192.168.1.0/24       # LAN -> soll filtered sein
# vom IoT-Host:
nmap -Pn 192.168.1.10
```
Weicht Ist von Soll ab (z. B. IoT erreicht LAN), ist das ein **Finding** (Regel/Reihenfolge korrigieren).

## 4. Egress & Betrieb

- Egress-Policy vorhanden? (Floating, Übung 07).
- Logging + Remote-Syslog (Übung 06), Backup aktuell (Übung 09), Firmware aktuell, HA, 2FA/Management-Härtung.

## 5. Report

`firewall-review-template.md` ausfüllen: Exposure-Tabelle, Hygiene-Findings, Segmentierungs-Soll/Ist, Egress/Betrieb, priorisierte Empfehlungen. nmap-Belege + Regel-Export in den Anhang.

## Priorisierung (Beispiel)

1. **Segmentierung bricht** (IoT→LAN offen) – P1.
2. **Exposure zu weit** (Port Forward any) – P1.
3. **any/any intern** – P2; **kein Egress-Filter** – P2.
4. **tote/undokumentierte Regeln** – P3.

## Härtung (gebündelt)

least privilege im Regelwerk, Quellen einschränken, Segmentierung verifizieren, Egress-Filter, Logging/SIEM, Backups/Updates/HA, Management-Härtung – und das Review **regelmäßig** wiederholen (Change-Management).

## Häufige Fehler / Troubleshooting

- **Nur Regeln angeschaut, nicht getestet:** Soll/Ist mit nmap verifizieren – Regeln lügen manchmal (Reihenfolge/States).
- **Alte States:** nach Korrektur States zurücksetzen, sonst gilt die alte Verbindung.
- **Report ohne Priorisierung:** Findings nach Risiko ordnen, sonst unbrauchbar für die Umsetzung.
- **Kein Backup vor Änderungen:** immer erst sichern (Übung 09).
