# Lösung – Übung 04: Lab-Control-Inventar

## 1./2. Inventar (Auszug, Beispiel)

| Control | Asset/Risiko | Kategorie | Typ | Status | Owner |
|---------|--------------|-----------|-----|--------|-------|
| OPNsense Firewall-Regeln | Perimeter/Netz | technical | preventive | aktiv | du |
| Suricata IDS/IPS | Angriffserkennung | technical | detective(/preventive) | aktiv | du |
| Wazuh SIEM + Alerts | Monitoring | technical | detective | aktiv | du |
| VLAN-Segmentierung | Lateral Movement | technical | preventive | aktiv | du |
| Lynis-Hardening | Host-Angriffsfläche | technical/operational | preventive | teilweise | du |
| Patch-/Update-Routine | Schwachstellen | operational | corrective/preventive | teilweise | du |
| Backups/Snapshots | Datenverlust/Ransomware | operational | corrective | aktiv | du |
| MFA (TOTP/FIDO2) | Account-Takeover | technical | preventive | geplant | du |
| SSH Key/Cert-Auth | Credential-Angriffe | technical | preventive | aktiv | du |
| VPN (WireGuard) | Remote-Zugriff | technical | preventive | aktiv | du |
| Verschlüsselung (TLS/at-rest) | Vertraulichkeit | technical | preventive | teilweise | du |
| Lab-Policy/Scope | Governance | managerial | directive | aktiv | du |
| Warnbanner/Autorisierung | unbefugte Nutzung | managerial | deterrent/directive | aktiv | du |
| Honeypot/Honeytokens | Breach-Früherkennung | technical | detective | optional | du |
| Abgeschlossener Schrank | physischer Zugriff | physical | preventive/deterrent | aktiv | du |

## 3. Verifikation (Stichprobe)

```bash
# Firewall-Regel vorhanden? (OPNsense GUI / ruleset)
# IDS läuft?
systemctl status suricata
# Hardening-Stand?
sudo lynis audit system | grep "Hardening index"
```

## 4. Verteilung

Zähle je Kategorie/Typ. Typisches Lab: **viele technical/preventive**, wenige **physical** und **managerial/operational** → erste Lücken-Indizien (z. B. kaum dokumentierte Prozesse, dünne physische/operationale Controls). Das motiviert die Gap-Analyse (Übung 05).

## Hinweise / Troubleshooting

- „Geplant/teilweise" ehrlich markieren – ein Inventar voller „aktiv" ohne Nachweis ist wertlos.
- Owner auch im Ein-Personen-Lab benennen (Verantwortlichkeit = Governance-Übung).
- Inventar versionieren (Grundlage für spätere Reviews).
