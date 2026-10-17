# Lösung – Übung 04: Regelsätze verwalten

## 1. HOME_NET definieren

**IDS → Administration → `Home networks`:** deine Lab-Netze eintragen, z. B. `192.168.1.0/24,192.168.20.0/24,192.168.40.0/24`. Wichtig, weil viele Regeln `$EXTERNAL_NET -> $HOME_NET` matchen – ist HOME_NET falsch, feuern Regeln nicht (false negatives) oder überall (FP).

## 2. Auto-Update

**IDS → Administration → Schedule / Download:** tägliches Regel-Update aktivieren (Cron). So bleiben Signaturen aktuell, ohne manuelles Nachladen.

## 3. Regel zerlegen

```
alert tcp $EXTERNAL_NET any -> $HOME_NET 445 (msg:"ET EXPLOIT ... SMB"; flow:to_server,established; content:"|ff|SMB"; sid:2024218; rev:4; classtype:attempted-admin;)
```
- `alert` Action · `tcp` Protokoll · `$EXTERNAL_NET any -> $HOME_NET 445` Flow.
- `msg` Beschreibung · `flow`/`content` Match-Bedingungen · **`sid`** eindeutige ID · `rev` Version · `classtype` Kategorie/Severity-Hinweis.

## 4. SID/Kategorie-Management

**IDS → Rules:** nach SID/Signatur filtern → eine rauschende Regel **deaktivieren** (Häkchen/Disable) oder per **Policy** steuern. Eine benötigte **Kategorie** (z. B. `exploit`) aktivieren. Apply → Regeln neu laden.

## 5. Veraltete Feeds = Risiko

Signaturbasiert erkennt nur **bekannte** Muster. Ohne aktuelle Feeds fehlen Signaturen für neue CVEs/Malware → **false negatives** (Angriff läuft unerkannt). Darum: automatischer Update-Prozess + ergänzend Anomaly/HIDS/Zeek für Unbekanntes.

## Häufige Fehler / Troubleshooting

- **Regeln feuern nicht:** HOME_NET falsch/leer → zuerst korrekt setzen.
- **Nach Disable immer noch Alerts:** Regeln nach Änderung **neu laden**/Apply; richtige SID?
- **Update schlägt fehl:** Internet/Proxy der Firewall, Feed-URL/Abo (ET Pro braucht Key).
- **Zu viele Kategorien:** Performance/FP → nur relevante aktivieren.
