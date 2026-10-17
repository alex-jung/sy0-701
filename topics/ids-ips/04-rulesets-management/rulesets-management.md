# Übung 04 – Regelsätze verwalten (ET Open, SID, Kategorien)

**Schwierigkeit: 4/10 · Dauer: ca. 50 Min.**

## Lernziele

- Regelsätze/Feeds verstehen und aktuell halten
- Den Aufbau einer Suricata-Regel lesen (SID, msg, Optionen)
- Regeln per Kategorie, SID und Policy verwalten (enable/disable)
- Feed-Aktualität als Detection-Voraussetzung begreifen

## Theorie

Signaturbasierte Erkennung ist nur so gut wie die **Regelsätze** und ihre **Aktualität**. Quellen: **ET Open** (frei), ET Pro (kommerziell), abuse.ch, Snort-VRT. In OPNsense lädt/aktualisiert man sie zeitgesteuert.

Eine Suricata-Regel (lesen, nicht nur anwenden):
```
alert tcp $EXTERNAL_NET any -> $HOME_NET 80 (msg:"..."; content:"..."; sid:2010935; rev:3; classtype:...;)
```
- **action** (alert/drop), **protocol**, **src → dst** (Variablen `$HOME_NET`/`$EXTERNAL_NET`), **options** (`msg`, `content`, `pcre`, `flow`, **sid**, **rev**, **classtype**).
- **SID** identifiziert die Regel → man kann einzelne SIDs **enable/disable/suppress** (Tuning, Übung 07).
- **Kategorien** (scan, exploit, malware, policy …) erlauben grobe Auswahl.

Wichtig: `$HOME_NET` korrekt definieren (eigene Netze), sonst matchen Regeln falsch.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| IDS → Download | Feeds laden/aktualisieren |
| IDS → Rules | Kategorien/SIDs aktivieren/deaktivieren, filtern |
| IDS → Administration → Scheduler | Auto-Update |
| IDS → Administration → `HOME_NET` | eigene Netze definieren |

## Lab-Setup

- Laufende Suricata (Übung 02). Mehrere ET-Open-Kategorien verfügbar.

## Aufgabe (selbst lösen)

1. Definiere **`$HOME_NET`** korrekt (deine Lab-Netze) und erkläre, warum das wichtig ist.
2. Richte ein **automatisches Regel-Update** (Scheduler) ein.
3. Öffne eine konkrete Regel und **zerlege** sie (action/proto/src/dst/msg/sid/content/classtype).
4. **Deaktiviere** eine rauschende/irrelevante Regel per SID und **aktiviere** eine Kategorie, die du brauchst.
5. Erkläre, warum veraltete Feeds ein Detection-Risiko sind (false negatives).

**Ziel:** sauber definiertes `$HOME_NET`, automatische Updates, eine gelesene/zerlegte Regel und gezieltes SID-/Kategorie-Management.

## SY0-701 Prüfungsbezug

- **Rule/signature management**, Feed-Aktualität, `$HOME_NET`/Variablen.
- **False negatives** durch veraltete Regeln; Update-Prozess.
- Begriffe: *signature/rule*, *SID*, *rule feed/threat intel*, *tuning*, *false negative*.
