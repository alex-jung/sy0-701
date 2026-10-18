# Übung 08 – Log- & Timeline-Analyse

**Schwierigkeit: 8/10 · Dauer: ca. 75 Min.**

## Lernziele

- Eine forensische Timeline aus mehreren Quellen erstellen
- Dateisystem-Zeitstempel (MACB) und Super-Timelines verstehen
- Logs quellenübergreifend zu einer Angriffskette verknüpfen
- Den vollständigen Ablauf (Initial Access → Impact) rekonstruieren

## Theorie

Eine **Timeline** ordnet alle Ereignisse chronologisch → sie beantwortet **„was geschah wann in welcher Reihenfolge"** und ist das Herz der Vorfallsrekonstruktion.

- **Dateisystem-Zeitstempel (MACB):** Modified, Accessed, Changed/Created, Birth → zeigen, wann Dateien erstellt/verändert/zugegriffen wurden.
- **Super-Timeline (plaso/log2timeline):** verschmilzt FS-Zeitstempel + Logs + Browser-/Registry-/Event-Artefakte zu **einer** Zeitleiste.
- **Multi-Source-Korrelation:** Firewall (Scan) + IDS (Exploit) + Host-Logs (Login/Prozess) + SIEM → die Kette (wie `logging-siem` 08, hier forensisch vertieft).

Voraussetzung: **synchronisierte Zeit (NTP)** über alle Quellen – sonst ist die Timeline falsch.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `log2timeline/plaso` + `psort` | Super-Timeline aus Image/Logs |
| Sleuth Kit `mactime` | FS-Timeline (bodyfile) |
| SIEM / `tshark` | Log-/Netz-Ereignisse |

## Lab-Setup

- Disk-Image + Logs des Vorfalls (Übung 05/06) + SIEM-Daten. Ein mehrstufiger Angriff als Grundlage.

## Aufgabe (selbst lösen)

1. Erzeuge eine **Dateisystem-Timeline** (mactime/bodyfile) und finde, **wann** die Angreifer-Artefakte (Webshell/Tools/Keys) entstanden.
2. Baue eine **Super-Timeline** (plaso) aus dem Image und filtere auf das relevante Zeitfenster.
3. **Korreliere** mit Netz-/SIEM-Events (Scan, Exploit, C2-Callback) – ergänze sie in die Timeline.
4. Rekonstruiere die vollständige **Angriffskette** (Initial Access → Execution → Persistence → C2 → Impact) mit Zeitpunkten.
5. Identifiziere den **Initial-Access-Zeitpunkt** und die **Verweildauer (Dwell Time)** bis zur Entdeckung.

**Ziel:** eine konsolidierte Timeline der gesamten Angriffskette mit Initial-Access-Zeitpunkt und Dwell Time.

## SY0-701 Prüfungsbezug

- **Timeline-/Log-Analyse**, MACB, Super-Timeline, **Multi-Source-Korrelation**.
- **Dwell Time / Time-to-Detect**, forensische Rekonstruktion.
- Begriffe: *timeline analysis*, *MACB timestamps*, *super timeline (plaso)*, *dwell time*, *correlation*.
