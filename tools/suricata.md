# Suricata

**Kategorie:** IDS/IPS-Engine (Blue Team)

Leistungsstarke Open-Source-IDS/IPS-Engine: signaturbasiert + Protokoll-/App-Layer-Analyse, Multi-Threaded, EVE-JSON-Ausgabe. In OPNsense als Plugin (**Services → Intrusion Detection**), auch standalone auf Linux.

## Modi

- **IDS (detect):** alarmiert nur (passiv). Sicher zum Lernen/Tunen.
- **IPS (inline):** blockt/dropt (in OPNsense via Netmap auf dem Interface).

## Regel-Grundstruktur

```
<action> <proto> <src> <sport> -> <dst> <dport> (msg:"..."; content:"..."; sid:1000001; rev:1; classtype:...;)
```
- action: `alert` (IDS) / `drop` (IPS) · Variablen `$HOME_NET`/`$EXTERNAL_NET`.
- Keywords: `content`, `pcre`, `flow`, `flags`, `http.uri/header/user_agent`, `threshold`, `sid`, `rev`, `classtype`.

## Betrieb

| Aufgabe | Wo |
|---------|-----|
| Regelsätze (ET Open) laden/updaten | IDS → Download / Scheduler |
| Regeln/Kategorien an/aus | IDS → Rules / Policy |
| eigene Regeln | IDS → User-defined rules (SID ≥ 1000000) |
| Alerts | IDS → Alerts / `eve.json` |
| Tuning | suppress / threshold (`threshold.config`) |

## Hinweise

`$HOME_NET` korrekt setzen (häufigste FP-Ursache). RAM-hungrig. TLS-Inhalt unsichtbar → mit Zeek ergänzen. Regel-Feeds aktuell halten (sonst false negatives). Nur eigenes Lab.

## Verwendet in

ids-ips 02–08, 10; Bezug firewall-opnsense, network-scanning 08 (Evasion).
