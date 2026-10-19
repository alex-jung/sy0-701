# Lösung – Übung 09: Platzierung & Risiken

## 1. Standorte (Beispiel)

| Standort | Erkennt | Nutzen |
|----------|---------|--------|
| Extern/WAN | Internet-Massen-Scans, Brute-Force-Botnets | Research, Trend-Intel (viel Rauschen) |
| DMZ (neben echten Diensten) | Perimeter-Tests, gezielte Exploits | mittlere Relevanz |
| **Intern (User-/Server-VLAN)** | **Lateral Movement, Insider** | **höchste Relevanz** – fast nur echte Breaches |

## 2. Deception-Strategie (Beispiel)

- 1 Cowrie in DMZ + 1 interner Dienst-Honeypot (OpenCanary) im Server-VLAN.
- **Honeytokens** breit gestreut: Fake-Creds in Configs, Honeyfiles auf File-Shares, 1 Canary-Account im AD.
- Alle Events → Wazuh/ELK (`logging-siem`), Honeytoken-/interne Honeypot-Alarme = **High** und direkt in den IR-Playbook-Trigger (`incident-response`).
- Interne Köder priorisiert (höchstes Signal, geringste False Positives).

## 3. Einhegung (OPNsense, Beispielregeln)

Honeypot-VLAN `HPOT`:
- **Egress-Deny:** `HPOT → any` block (log), nur Log-Weiterleitung zum SIEM explizit erlaubt.
- **Kein Zugriff auf interne Netze:** `HPOT → LAN/SERVER/ MGMT` block.
- **Inbound:** nur die Köder-Ports; Management nur aus `MGMT`.
- Default-Deny + Logging; IDS (Suricata) im Inline-Modus am VLAN.

## 4. Risiko-Tabelle

| Risiko | Gegenmaßnahme |
|--------|---------------|
| Pivot/Sprungbrett | Egress-Deny, Segmentierung, kein Trust, Monitoring, Snapshots/Reset |
| Recht (Hack-back/Entrapment/Datenschutz) | nur eigene Köder, kein Gegenangriff, Daten minimieren, dokumentieren |
| Betrieb (vergessene/veraltete Honeypots) | Inventar, Updates, Owner, regelmäßige Reviews |
| Fingerprinting | Banner/Antworten anpassen, Standardkonfigs vermeiden, realistisch tarnen |

## Härtung/Betrieb

- Honeypot niemals Teil von Backup/Domain-Trust/Monitoring-Agents mit Zugriff nach innen.
- Alarmketten testen (Tabletop), sonst „Deception ohne Reaktion".

## Häufige Fehler / Troubleshooting

- Honeypot im selben Segment wie Produktiv → Pivot-Risiko, falsche Alarme.
- Nur externe Platzierung → man sieht nur Rauschen, keine echten internen Breaches.
- Deception ohne SIEM/IR-Anbindung → Köder lösen aus, aber niemand reagiert.
