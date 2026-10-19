# Lösung – Übung 01: Control-Typen

## 1. Definitionen + Zeitbezug

| Typ | Ein-Satz-Definition | Zeit |
|-----|---------------------|------|
| Preventive | verhindert den Vorfall | davor |
| Detective | erkennt den Vorfall | währenddessen/danach |
| Corrective | behebt/begrenzt nach dem Vorfall | danach |
| Deterrent | schreckt den Täter ab | davor |
| Compensating | Ersatz, wenn primäre Control fehlt | ersetzend |
| Directive | gibt vor/verpflichtet | steuernd |

## 2. Klassifizierung (Beispiele)

| Beispiel | Typ(en) |
|----------|---------|
| Firewall-Regel | preventive |
| IDS-Alarm | detective |
| Backup-Restore | corrective |
| Warnbanner | deterrent (+ directive) |
| Security-Policy | directive |
| MFA | preventive |
| Kamera (sichtbar + Aufzeichnung) | deterrent **und** detective |
| Zaun | preventive + deterrent |
| Patch (nach Vorfall) | corrective |
| Verschlüsselung | preventive |
| Awareness-Training | preventive (+ directive) |
| Account-Lockout | preventive (+ detective-Signal) |

## 3. Doppelzuordnung

Eine **sichtbare Überwachungskamera** schreckt ab (**deterrent**, weil Täter sie sehen) **und** zeichnet Vorfälle auf (**detective**). Wirkung hängt vom Blickwinkel ab, nicht von der Technik.

## 4. „Gestohlener Laptop"

- **Preventive:** Full-Disk-Encryption, Kabelschloss.
- **Detective:** MDM-/Geo-Tracking, Login-Anomalie-Alarm.
- **Corrective:** Remote-Wipe, Ersatzgerät, Zugangsdaten rotieren.

## Hinweise / Troubleshooting

- „Verhindern" (preventive) ≠ „abschrecken" (deterrent): ein Schloss verhindert, ein „Vorsicht Hund"-Schild schreckt ab.
- Compensating ist eine **bewusste Ersatz**-Control (oft dokumentiert/temporär), nicht einfach „irgendeine zusätzliche".
