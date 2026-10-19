# Lösung – Übung 07: MITRE ATT&CK & TTPs

## 1. Tactic/Technique/Procedure

- **Tactic:** Initial Access (Ziel: reinkommen).
- **Technique:** Phishing (T1566).
- **Procedure:** „Mail mit Fake-Login-Link auf geklonte OWA-Seite, Opfer gibt Creds ein, AiTM-Proxy relayt."

## 2. Honeypot-Kette → ATT&CK

| Stufe | Taktik | Technik (ID) |
|-------|--------|--------------|
| SSH-Brute-Force erfolgreich | Credential Access / Initial Access | Brute Force (T1110) |
| `uname -a`, `cat /proc/cpuinfo` | Discovery | System Info Discovery (T1082) |
| `wget http://.../bot` | Command & Control / — | Ingress Tool Transfer (T1105) |
| `chmod +x; ./bot` | Execution | Command & Scripting Interpreter (T1059) |
| Crontab/rc.local | Persistence | Scheduled Task/Cron (T1053) |

## 3. Cyber Kill Chain + Unterschied

Kill Chain: Recon → Weaponization → Delivery (Brute-Force-Login) → Exploitation (Execution) → Installation (bot/persistence) → C2 (wget/C2) → Actions.
- **Kill Chain:** linear, phasen-/perimeterorientiert, grob.
- **ATT&CK:** nicht-linear, granular (viele Techniken je Taktik), gut für Detection-Mapping. ATT&CK ergänzt die grobe Kill-Chain-Sicht.

## 4. Diamond Model (Beispiel)

- **Adversary:** opportunistisches SSH-Botnet.
- **Capability:** Brute-Force-Tool + ELF-Bot.
- **Infrastructure:** Quell-IP + Download-Server (C2).
- **Victim:** dein Honeypot (vorgeblich SSH-Server).
→ Pivoting: von der Infrastructure (C2-IP) zu weiteren Opfern/Kampagnen.

## Hinweise / Troubleshooting

- Eine Aktion kann mehreren Taktiken dienen (wget = C2 **und** Ingress Tool Transfer).
- ATT&CK-Navigator eignet sich, Detection-Abdeckung farblich zu zeigen (Bezug `security-controls` 07).
- Kill Chain/Diamond/ATT&CK sind komplementär, kein Entweder-oder.
