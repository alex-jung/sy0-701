# Lösung – Übung 07: Tuning

## 1. Lauteste SIDs finden

```bash
# eve.json auswerten: Top-Signaturen nach Häufigkeit
jq -r 'select(.event_type=="alert") | .alert.signature_id' /var/log/suricata/eve.json | sort | uniq -c | sort -rn | head
```
Oder im **Alerts-Tab** nach Signatur gruppieren. Die Top-SIDs bewerten: echt/relevant vs. FP/irrelevant.

## 2. Suppress für eine Quelle

In OPNsense (IDS → Administration → „User-defined" / suppress) bzw. `threshold.config`:
```
suppress gen_id 1, sig_id 2024218, track by_src, ip 192.168.56.50
```
→ SID 2024218 wird für deinen autorisierten Scanner (192.168.56.50) **nicht** mehr alarmiert, bleibt aber für alle anderen Quellen aktiv.

## 3. Threshold setzen

```
# nur 1 Alert pro 60s pro Quelle für eine rauschende Regel:
threshold gen_id 1, sig_id 2024218, type limit, track by_src, count 1, seconds 60
```
`type limit` begrenzt Alert-Spam; `type threshold` alarmiert erst ab N; `type both` kombiniert.

## 4. Irrelevante Kategorie/Regel deaktivieren

**IDS → Rules/Policy:** eine für dein Lab irrelevante Kategorie (z. B. `games`, `p2p`) oder eine konkrete Dauer-FP-SID **disablen**. Apply.

## 5. Vorher/Nachher & Alert Fatigue

Alert-Zahl vor/nach dem Tuning vergleichen (z. B. 500/Tag → 30/Tag). **Alert Fatigue:** bei Überflutung ignorieren Analysten Alerts / übersehen echte Angriffe (false negatives durch Überlastung). Tuning macht jeden Alert **actionable** → höhere echte Erkennungsrate.

## Härtung/Betrieb

Tuning ist **fortlaufend** (neue Regeln, neue FP). Suppress gezielt (nicht ganze Regeln wegwerfen = Gefahr false negatives), dokumentieren, warum etwas unterdrückt wurde.

## Häufige Fehler / Troubleshooting

- **Regel ganz deaktiviert statt suppress:** schafft false negatives – lieber `suppress by_src/by_dst`.
- **HOME_NET-FP:** viele FP verschwinden, wenn HOME_NET korrekt ist (Übung 04) – zuerst prüfen.
- **Threshold zu aggressiv:** echte Angriffe werden mit-limitiert → maßvoll.
- **Änderung wirkungslos:** Regeln/Threshold-Config neu laden/Apply.
