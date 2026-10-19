# Lösung – Übung 07: Controls ↔ Threats

## 1./2. Szenario → ATT&CK + Controls

| Stufe (Taktik / Technik) | Preventive | Detective | Corrective |
|--------------------------|-----------|-----------|------------|
| Initial Access – Phishing (T1566) | Awareness, Mail-Filter, FIDO2 | SIEM-Mailalarm, Honeytoken | IR, Passwort-Reset |
| Execution (T1059) | App-Allowlist, Hardening | EDR/Sysmon→SIEM | Prozess killen, Restore |
| Credential Access (T1003/T1110) | MFA, starke Hashes, Lockout | SIEM-Loginanomalie | Credentials rotieren |
| Lateral Movement (T1021) | Segmentierung, Least Privilege | IDS/Zeek, SIEM-Korrelation | Containment/VLAN-Isolation |
| Exfiltration (T1041) | DLP, Egress-Filter (OPNsense) | IDS/NetFlow-Alarm | Verbindung kappen, IR |

## 3. NIST CSF

| Funktion | Beispiel-Control |
|----------|------------------|
| Identify | Asset-/Control-Inventar, Risk Assessment |
| Protect | Firewall, MFA, Hardening, Verschlüsselung |
| Detect | IDS/IPS, SIEM, Honeypots |
| Respond | IR-Playbooks, Containment |
| Recover | Backups/Snapshots, Restore-Prozess |

Prüfen: sind **alle** Funktionen besetzt? Typische Lücke im Lab: viel Protect, wenig Respond/Recover-Prozess.

## 4. Lücken (Beispiel)

- Keine **DLP** für Exfiltration → Egress-Filter + SIEM-Alarm als Minimalersatz.
- Kein **EDR** für Execution-Detection → Sysmon/auditd → SIEM-Regeln.
- Lateral Movement nur segmentiert, nicht erkannt → Zeek/Honeypot ergänzen.

## Hinweise / Troubleshooting

- ATT&CK-Navigator eignet sich, die Abdeckung farblich zu visualisieren (grün=detect+prevent, rot=Gap).
- Nicht jede Technik braucht eine eigene Control – Cluster/High-Value-TTPs priorisieren (threat-informed).
- „Protect-lastig" ist ein häufiges Muster → bewusst Detect/Respond/Recover stärken.
