# Übung 01 – Honeypot-Grundlagen & Klassifizierung

**Schwierigkeit: 1/10 · Dauer: ca. 45 Min.**

## Lernziele

- Verstehen, was ein Honeypot ist und warum er so hochpräzise Alarme liefert
- Honeypot-Typen nach **Interaktionsgrad** und **Zweck** unterscheiden
- Die Begriffe Honeypot, Honeynet, Honeyfile, Honeytoken sauber einordnen
- Nutzen und Risiken grob einschätzen

## Theorie

Ein **Honeypot** ist ein absichtlich platziertes Köder-System ohne produktiven Zweck. Weil es **niemand legitim** nutzen sollte, ist **jeder** Zugriff per Definition verdächtig → sehr wenige False Positives, sehr hoher Signalwert.

Einordnung nach **Interaktionsgrad**:

- **Low-Interaction:** emuliert nur Dienste/Antworten (z. B. ein vorgetäuschter SSH-Login). Geringes Risiko, aber begrenzte Tiefe. Beispiel: ältere Honeyd-Konzepte, Dionaea.
- **Medium-Interaction:** emuliert einen Dienst recht realistisch inkl. Shell-Interaktion, ohne echtes OS freizugeben. Beispiel: **Cowrie** (SSH/Telnet).
- **High-Interaction:** ein echtes, verwundbares System. Maximaler Erkenntnisgewinn, aber **hohes Risiko** (kann als Pivot/Sprungbrett missbraucht werden) → strenge Einhegung nötig.

Einordnung nach **Zweck**: *Research* (TTPs/Trends sammeln) vs. *Production* (Frühwarnung im eigenen Netz).

Verwandte Deception-Begriffe (SY0-701):

- **Honeynet** – ein ganzes Netz aus Honeypots.
- **Honeyfile** – eine Köder-Datei (z. B. `passwords.xlsx`), deren Öffnen alarmiert.
- **Honeytoken** – ein Köder-Datensatz/Credential (Fake-API-Key, Fake-Account), dessen Verwendung alarmiert.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| (konzeptionell) | keine; reine Einordnung/Recherche |

## Lab-Setup

- Keines nötig. Vorbereitung: plane bereits ein **isoliertes VLAN** in OPNsense für die späteren Übungen ein.

## Aufgabe (selbst lösen)

1. Erstelle eine **Tabelle**, die Low-/Medium-/High-Interaction vergleicht: Realismus, Erkenntnisgewinn, Risiko, Beispiel-Tool.
2. Ordne zu: Cowrie, Dionaea, ein echtes verwundbares Windows, eine Fake-`salaries.xlsx`, ein Fake-AWS-Key in einer Config → welcher Begriff (Honeypot/Honeynet/Honeyfile/Honeytoken) und welcher Interaktionsgrad?
3. Begründe in 3–4 Sätzen, warum ein Honeypot **weniger False Positives** erzeugt als ein IDS.
4. Nenne **zwei** konkrete Risiken, die ein High-Interaction-Honeypot in deinem Lab mitbringt.

**Ziel:** eine saubere Klassifizierung + Begründung des Signalwerts + Risikobewusstsein (Grundlage für alle folgenden Übungen).

## SY0-701 Prüfungsbezug

- **1.0** *Deception and disruption technology*: honeypot, honeynet, honeyfile, honeytoken.
- **4.0** Detection/Monitoring; Threat Intelligence aus Angreiferverhalten.
- Typische Fragen: „Welche Technologie erzeugt hochpräzise Alarme, weil jeder Zugriff verdächtig ist?" → Honeypot. „Fake-Datensatz, der bei Nutzung alarmiert?" → Honeytoken.
- Begriffe: *deception*, *low/high interaction*, *honeypot/honeynet/honeyfile/honeytoken*, *false positive*.
