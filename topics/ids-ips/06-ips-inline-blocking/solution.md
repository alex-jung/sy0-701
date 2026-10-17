# Lösung – Übung 06: IPS-Modus (inline)

## 1. IPS aktivieren

**IDS → Administration:** „**IPS mode**" ✓ und das Interface wählen, über das der Traffic läuft (Netmap-fähig). Apply/Restart. (Hinweis: inline braucht ein Interface im Datenpfad; auf reinen Mirror-Ports geht nur IDS.)

## 2. Regel auf Drop

- **IDS → Policy:** eine Policy anlegen, die eine Kategorie/ausgewählte SIDs auf **Action = Drop** setzt, **oder**
- in der (Custom-)Regel `alert` → `drop` ändern:
```
drop http any any -> $HOME_NET any (msg:"LOCAL Block Scanner UA"; http.user_agent; pcre:"/(sqlmap|nikto)/i"; sid:1000003; rev:2; classtype:attempted-recon;)
```
Regeln neu laden.

## 3. Angriff blocken + verifizieren

```bash
nikto -h http://<ZIEL>/        # löst die Drop-Regel aus
```
Im **Alerts/Log**: Action = **blocked/dropped** (nicht nur „allowed"). Der Request kommt beim Ziel nicht (vollständig) an → Angriff unterbunden. `drop` verwirft das Paket; die Verbindung läuft ins Leere.

## 4. alert vs. drop

- `alert`: Traffic passiert, es gibt nur einen Log-Eintrag (IDS).
- `drop`: Traffic wird **verworfen** (IPS) → der Angriff/Scan schlägt fehl. Sichtbar am Action-Feld und daran, dass das Ziel den Request nicht mehr beantwortet.

## 5. Risiken & Mitigation

Ein **False-Positive-Drop** blockt echten, legitimen Traffic → Verfügbarkeitsproblem (z. B. eine zu breite Regel dropt normale Nutzer). Mitigation:
- Erst **IDS-Modus** + Tuning (Übung 07), nur **verlässliche** Regeln auf Drop,
- schrittweise Rollout, Monitoring der Drops, klare Rückroll-Möglichkeit,
- inline-Ausfall bedenken (Fail-open/closed-Verhalten, HA).

## Härtung/Betrieb

Kritische, FP-arme Signaturen (bekannte Exploits/C2) auf Drop; breite/rauschende Regeln auf Alert; regelmäßiges Review der Drops.

## Häufige Fehler / Troubleshooting

- **Blockt nicht, nur Alert:** IPS-Mode aus, oder Regel steht auf `alert`/Policy nicht Drop; falsches Interface (Mirror statt inline).
- **Netmap/Interface-Probleme:** Hardware-Offloading (LRO/TSO) auf dem Interface deaktivieren.
- **Legitimes blockiert:** Regel zu breit → suppress/disable (Übung 07), IDS-first.
- **Durchsatz sinkt:** inline kostet Leistung → ausreichend Ressourcen.
