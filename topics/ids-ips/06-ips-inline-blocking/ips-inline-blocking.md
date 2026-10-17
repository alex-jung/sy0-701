# Übung 06 – IPS-Modus: inline Blocking/Drop

**Schwierigkeit: 6/10 · Dauer: ca. 55 Min.**

## Lernziele

- Vom IDS- in den IPS-Modus wechseln (inline Blocking in OPNsense)
- `alert` vs. `drop` verstehen und Regeln/Policies auf Drop setzen
- Einen Angriff real blockieren lassen und verifizieren
- Risiken des inline-Betriebs (FP, Ausfall) einschätzen

## Theorie

Im **IPS-Modus** arbeitet Suricata **inline** im Datenpfad (in OPNsense über Netmap auf dem Interface) und kann Pakete **droppen**, nicht nur alarmieren. Entscheidend ist die **Rule-Action**:
- **alert** → nur Alarm (IDS),
- **drop** → Paket verwerfen (IPS) – blockt den Angriff.

Man kann global per **Policy** Regeln auf Drop setzen oder einzelne Regeln/Kategorien. **Risiko:** ein False Positive blockt jetzt **echten** Traffic; inline = potenzieller Flaschenhals/Ausfallpunkt. Darum: erst im IDS-Modus beobachten/tunen (Übung 07), dann gezielt kritische, verlässliche Regeln auf Drop.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| IDS → Administration → „IPS mode" | inline aktivieren |
| IDS → Policy / Rules | Action auf Drop setzen |
| Kali | Angriff zum Blocken auslösen |

## Lab-Setup

- Suricata (Übung 02–05) auf dem Interface, über das der Test-Traffic läuft. Kali + Ziel. Backup (Blocking kann stören).

## Aufgabe (selbst lösen)

1. Aktiviere den **IPS-Modus** (inline) auf dem passenden Interface.
2. Setze eine **verlässliche** Regel (z. B. eine deiner Custom-Regeln oder eine klare Exploit-Signatur) auf **drop**.
3. Löse den entsprechenden Angriff von Kali aus und verifiziere, dass er **geblockt** wird (nicht nur alarmiert) – Action „blocked"/„dropped" im Log.
4. Vergleiche das Verhalten einer `alert`- vs. einer `drop`-Regel beim selben Traffic.
5. Diskutiere die Risiken: Was passiert bei einem False-Positive-Drop? Wie mitigierst du (Tuning, IDS-first)?

**Ziel:** Suricata blockt einen Angriff real inline, mit Verständnis von alert/drop und den Betriebsrisiken.

## SY0-701 Prüfungsbezug

- **IPS (inline) vs. IDS (passive)**; aktives Blocking.
- **False positive → Verfügbarkeitsrisiko** (Legitimes geblockt); Tuning-Notwendigkeit.
- Begriffe: *IPS inline*, *drop vs. alert*, *fail-open/fail-closed*, *false positive impact*.
