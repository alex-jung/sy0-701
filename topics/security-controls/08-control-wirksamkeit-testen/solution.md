# Lösung – Übung 08: Control-Wirksamkeit

## 1./2. Drei Controls testen (Beispiele)

**Preventive – Host-Hardening/Firewall:**
- Pass-Kriterium: Portscan/Exploit scheitert, Dienst nicht erreichbar.
```bash
nmap -sV <gehaerteter-host>     # erwartet: wenige/keine offenen Ports
# Exploit aus exploitation-metasploit gegen gepatchten Host -> fail
```

**Detective – IDS/SIEM:**
- Pass-Kriterium: Alarm im SIEM.
```bash
# simuliere eine TTP (z.B. nmap-Scan / bekannte Signatur / Atomic-Test T1046)
nmap -sS <netz>        # erwartet: Suricata/Wazuh-Alarm "portscan"
# Nachweis: Alert im Wazuh/Kibana + Zeitstempel -> Time to Detect messen
```

**Corrective – Backup/Snapshot:**
- Pass-Kriterium: Daten/VM nach „Zerstörung" wiederhergestellt.
```bash
# Datei löschen -> Restore aus Backup/Snapshot -> Datei zurück (Hash identisch)
```

## 3. KPIs (Beispiel)

| KPI | Wert (Beispiel) |
|-----|-----------------|
| MTTD (Scan→Alarm) | z. B. 15 s |
| % erkannter Test-TTPs | z. B. 6/10 = 60 % |
| Patch-SLA (kritisch < 7 Tage) | eingehalten? |

## 4. Unwirksame Control

Beispiel: eine SIEM-Regel existiert, feuert aber nicht (falscher Decoder/zu enge Bedingung) → **kein** Alarm beim Test. Korrektur: Regel/Decoder anpassen, Test wiederholen bis Alarm kommt (Tuning, `logging-siem`/`ids-ips`).

## Hinweise / Troubleshooting

- Alle Tests nur im eigenen Lab; TTP-Simulationen harmlos halten (keine echte Malware).
- „Kein Alarm" kann an Logging-Pipeline liegen, nicht an der Bedrohung → Pipeline zuerst verifizieren.
- Wiederholbarkeit: Tests als Skript/Checkliste → spätere Re-Validierung (Continuous Validation).
