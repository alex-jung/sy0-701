# Lösung – Übung 09: Threat Hunting & Pyramid of Pain

## 1. Hunt-Hypothesen (Beispiele)

- H1: „Nach erfolgreichem SSH-Login lädt ein Angreifer ein ausführbares File (T1105) und führt es aus (T1059)."
- H2: „Es gibt Beaconing (regelmäßige, gleich große Verbindungen) zu einer externen IP (C2, T1071)."

## 2. Hunt durchführen (Beispiel)

```bash
# H1 – Honeypot/SIEM:
jq -r 'select(.eventid=="cowrie.command.input") | .input' cowrie.json | grep -E 'wget|curl'
# H2 – PCAP/Zeek: regelmäßige Intervalle/gleiche Paketgrößen zu einer IP
tshark -r cap.pcap -q -z conv,ip | sort -k7 -n     # Volumen/Timing auffällig?
```
Dokumentiere: Query, Treffer (z. B. `wget`-Download gefunden) oder Null-Fund, und Schluss (Hypothese bestätigt/verworfen).

## 3. Pyramid of Pain – Zuordnung + Anheben

| Meine Detection | Ebene | Robustheit |
|-----------------|-------|------------|
| Hash-Blocklist | Hash | niedrig |
| C2-IP-Block | IP | niedrig |
| C2-Domain | Domain | mittel |
| „wget+chmod+exec in SSH-Session" | **TTP** | hoch |

Anheben: statt nur die konkrete IP/den Hash zu blocken, eine Regel auf das **Verhalten** (Download+Ausführung nach Login) schreiben → funktioniert auch bei neuer IP/neuem Hash.

## 4. Neue Detection (Beispiel)

- SIEM-Korrelation: `cowrie.login.success` + (`wget`|`curl`) + `chmod +x` innerhalb 60 s → High-Alert (T1105/T1059).
- Suricata: Download einer ausführbaren Datei über HTTP kurz nach SSH-Session.

## Hinweise / Troubleshooting

- Hunting braucht **gute Telemetrie** – erst Logging/Sichtbarkeit sicherstellen (`logging-siem`).
- Null-Fund ist auch ein Ergebnis (Hypothese verworfen / Sichtbarkeitslücke erkannt).
- Ziel ist, Detection **nach oben** (TTP) zu verschieben → Angreifer-„Schmerz" maximieren.
