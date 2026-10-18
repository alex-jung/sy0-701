# Lösung – Übung 08: Patch- & Vulnerability-Management

> Snapshot (Patches + Reboot).

## 1. Scan

Credentialed-Scan mit Greenbone/Nessus (aus `vulnerability-scanning` 07) → CVE-Liste mit Severity/QoD. Alternativ schnell: `nmap --script vuln` + Paketstand (`apt list --upgradable`).

## 2. Priorisierung

Nicht nur CVSS: **CVSS × Exposure × Exploit-Verfügbarkeit**.
```
1. Critical, internetexponiert, Exploit "in the wild" (CISA KEV) -> sofort
2. Critical, intern/segmentiert -> hoch
3. High ohne bekannten Exploit -> geplant
4. Low/kein Impact -> Routine
```

## 3. Patchen (mit Prozess)

```bash
sudo apt update && sudo apt upgrade        # bzw. gezielt einzelnes Paket
sudo apt install unattended-upgrades       # Auto-Security-Updates
```
Prozess: erst **Staging/Pilot-Ring** testen, dann breit; **Wartungsfenster**; **Rollback** (Snapshot/vorheriges Paket) dokumentiert.

## 4. Re-Scan (Validierung)

Scan wiederholen → die gepatchten CVEs sind weg (Vorher/Nachher-Report). Ohne Re-Scan ist „gepatcht" nur eine Behauptung.

## 5. Kompensierende Kontrollen (Legacy)

Für ein nicht patchbares System (z. B. altes OT/App):
- **Segmentieren/isolieren** (OPNsense-VLAN, nur nötige Flows),
- **Virtual Patching** (IPS/Suricata-Regel gegen den konkreten Exploit, `ids-ips`),
- Zugriff einschränken (Allowlist/Jump-Host), verschärftes Monitoring.

## Härtung/Betrieb

Regelmäßiger Scan-Zyklus, SLAs je Severity (z. B. Critical 72h), Asset-Inventar (man patcht nur, was man kennt), Metriken (offene Criticals, Zeit-bis-Patch).

## Häufige Fehler / Troubleshooting

- **Nur CVSS priorisiert:** Exposure/Exploit-Reife mit einbeziehen (KEV zuerst).
- **Patch ohne Test:** Produktionsausfall → Staging/Ringe/Rollback.
- **Kein Re-Scan:** Validierung fehlt.
- **Legacy ungeschützt „weil nicht patchbar":** kompensierende Kontrollen sind Pflicht.
