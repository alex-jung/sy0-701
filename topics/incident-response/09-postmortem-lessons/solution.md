# Lösung – Übung 09: Postmortem & Lessons Learned

## 1. Blameless Postmortem (Struktur)

```
Summary:   Am 2026-10-16 wurde Host X über einen unsicheren File-Upload
           kompromittiert (Webshell -> Reverse-Shell -> Persistence).
           Keine (bzw. welche) Daten betroffen. Erkannt nach ~15 Min.
Timeline:  (aus Übung 08)
Root Cause: unsicherer Upload (keine Allowlist) + fehlendes Patch/Monitoring
Impact:    1 Host, Konto www-data, Containment vor Lateral Movement
```
Formuliert **ohne Schuldzuweisung** – Fokus auf System/Prozess.

## 2. Gut / schlecht

- **Gut:** SIEM-Alert feuerte, Containment ohne Shutdown (Beweise erhalten).
- **Schlecht:** Upload-Lücke bestand lange, keine Egress-Filterung (C2 ging raus), Playbook fehlte teils.

## 3. Action Items

| Kategorie | Maßnahme | Owner | Frist |
|-----------|----------|-------|-------|
| Prevention | Upload härten (Allowlist/no-exec), patchen | <> | 1 Woche |
| Prevention | Egress-Filtering (OPNsense) | <> | 2 Wochen |
| Detection | Suricata/SIEM-Regel für Webshell/Reverse-Shell | <> | 1 Woche |
| Process | Playbook „kompromittierter Webserver" finalisieren | <> | 2 Wochen |

## 4. MTTD / MTTR

- **MTTD** (Detect): Initial Access t1 10:05 → Alert 10:20 = **~15 Min**.
- **MTTR** (Respond/Recover): Alert → Containment/Recovery abgeschlossen.
Senken durch: bessere Detection (Regeln/Coverage), Automatisierung, geübte Playbooks, Egress-Filter (frühere Signale).

## 5. Meldepflichten

Wären **personenbezogene Daten** (PII) abgeflossen, greift z. B. **DSGVO**: Meldung an die Aufsichtsbehörde i. d. R. **binnen 72 h**, ggf. Benachrichtigung Betroffener. Im Lab fiktiv – aber die Bewertung (Datenart → Meldepflicht/Frist) gehört ins Postmortem.

## Häufige Fehler / Troubleshooting

- **Schuldkultur:** Leute verschweigen Fehler → blameless bleiben.
- **Action Items ohne Owner/Frist:** werden nicht umgesetzt → messbar machen.
- **Kein Follow-up:** Umsetzung der Items nachhalten (sonst wiederholt sich der Vorfall).
- **Meldepflicht übersehen:** bei echten Daten rechtliche/fristgebundene Pflichten prüfen.
