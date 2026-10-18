# Übung 09 – Postmortem & Lessons Learned

**Schwierigkeit: 9/10 · Dauer: ca. 60 Min.**

## Lernziele

- Ein blameless Postmortem erstellen
- Root Cause, Timeline, Impact und Maßnahmen strukturiert dokumentieren
- Lessons Learned in konkrete Verbesserungen (Detection/Prevention) überführen
- Metriken (MTTD/MTTR) und Meldepflichten verstehen

## Theorie

**Post-Incident Activity** verwandelt einen Vorfall in **Verbesserung**. Ein **blameless Postmortem** fragt „**was** lief schief und **warum**", nicht „**wer** war schuld" – sonst verheimlichen Leute Fehler.

Inhalte:
- **Zusammenfassung** (was, wann, Impact), **Timeline** (Übung 08), **Root Cause**.
- **Was lief gut / schlecht** (Detection, Response, Comms).
- **Lessons Learned → Action Items** (messbar, mit Owner/Frist): neue Detection-Regeln, Härtung, Playbook-Updates, Backups.
- **Metriken:** **MTTD** (Mean Time To Detect), **MTTR** (Mean Time To Respond/Recover), Dwell Time.
- **Meldepflichten:** je nach Datenart/Recht (DSGVO-Meldung an Behörde/Betroffene, Fristen) – im Scope der Governance.

Ein Vorfall, aus dem nichts gelernt wird, wiederholt sich.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Postmortem-Vorlage | strukturierte Doku |
| Ergebnisse aus Übung 03–08 | Input |

## Lab-Setup

- Die Ergebnisse des durchgespielten Vorfalls (Triage/Forensik/Timeline). Konzeptionell + Dokument.

## Aufgabe (selbst lösen)

1. Schreibe ein **blameless Postmortem** zum durchgespielten Vorfall: Summary, Timeline, Root Cause, Impact.
2. Liste **was gut/schlecht lief** (Detection-Zeit, Containment, Comms) auf.
3. Leite **Action Items** ab (je mit Kategorie: Detection/Prevention/Process), mit Owner + Frist.
4. Berechne/schätze **MTTD** und **MTTR** aus deiner Timeline und erkläre, wie man sie senkt.
5. Bewerte **Meldepflichten**: hätte dieser Vorfall (mit echten Daten) gemeldet werden müssen? An wen, in welcher Frist?

**Ziel:** ein vollständiges, blameless Postmortem mit priorisierten, messbaren Action Items und MTTD/MTTR-Betrachtung.

## SY0-701 Prüfungsbezug

- **Lessons Learned / Post-Incident**, **blameless postmortem**, Root Cause Analysis.
- **MTTD/MTTR**, kontinuierliche Verbesserung; **Meldepflichten/Compliance** (DSGVO, Fristen).
- Begriffe: *lessons learned*, *root cause analysis*, *MTTD/MTTR*, *blameless postmortem*, *breach notification*.
