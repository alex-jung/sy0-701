# Übung 07 – Eradication & Recovery

**Schwierigkeit: 7/10 · Dauer: ca. 65 Min.**

## Lernziele

- Eradication (Bedrohung entfernen) von Recovery (Wiederherstellen) unterscheiden
- Die Grundursache (Root Cause) schließen, nicht nur Symptome
- Sauber wiederherstellen (Known-Good, verschärfte Überwachung)
- Wiederaufnahme-Kriterien und Rückfall-Risiko verstehen

## Theorie

Nach Containment + Beweissicherung:

- **Eradication:** die Bedrohung **vollständig entfernen** – Malware, Webshells, Persistence (cron/Keys/Services/Tasks), kompromittierte Konten; **und die Grundursache schließen** (Patch der ausgenutzten Lücke, Fehlkonfig beheben, Credentials rotieren). Wird die Root Cause nicht geschlossen, kommt der Angreifer zurück.
- **Recovery:** Systeme in den **Normalbetrieb** zurückführen – idealerweise **Neuaufsetzen aus Known-Good/Backup** (bei tiefer Kompromittierung sicherer als „bereinigen", da Rootkits/versteckte Persistence schwer auszuschließen). Danach **verschärfte Überwachung**, um Rückfall zu erkennen.
- **Wiederaufnahme-Kriterien:** wann gilt ein System als „sauber genug" für die Rückkehr? (verifiziert, gepatcht, überwacht).

Faustregel bei tiefer Kompromittierung (root/SYSTEM/DA): **nicht bereinigen, sondern neu aufsetzen** + Secrets rotieren.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Snapshot/Backup-Restore | Known-Good-Wiederherstellung |
| Patch-/Config-Mgmt | Root Cause schließen |
| SIEM/IDS | verschärfte Nachüberwachung |

## Lab-Setup

- Der kompromittierte, analysierte Host (Übung 03–06). Snapshot/Backup des Known-Good-Stands. Detection-Stack.

## Aufgabe (selbst lösen)

1. Bestimme die **Root Cause** (wie kam der Angreifer rein? – aus der Forensik) und schließe sie (Patch/Config/Credential-Rotation).
2. **Eradiziere** alle gefundenen Persistence-/Malware-Artefakte (cron, authorized_keys, Services, Webshell, Konten).
3. **Recovery:** setze den Host aus **Known-Good** neu auf / stelle ein sauberes Backup wieder her (begründe „bereinigen vs. neu aufsetzen").
4. Richte **verschärfte Überwachung** ein (zusätzliche Alerts/IoC-Watchlist) und beobachte auf Rückkehr.
5. Definiere **Wiederaufnahme-Kriterien** und erkläre das Rückfall-Risiko bei unvollständiger Eradication.

**Ziel:** Root Cause geschlossen, Bedrohung vollständig entfernt, System sauber wiederhergestellt + nachüberwacht.

## SY0-701 Prüfungsbezug

- **Eradication & Recovery**, **Root Cause Analysis**, **Known-Good/Restore**, „rebuild vs. clean".
- **Credential Rotation**, verschärftes Monitoring, Wiederaufnahme-Kriterien.
- Begriffe: *eradication*, *recovery*, *root cause*, *known-good/golden image*, *rebuild vs. remediate*.
