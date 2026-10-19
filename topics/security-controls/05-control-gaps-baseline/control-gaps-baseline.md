# Übung 05 – Control-Gaps gegen eine Baseline (CIS)

**Schwierigkeit: 5/10 · Dauer: ca. 80 Min.**

## Lernziele

- Eine Baseline (CIS Controls/Benchmark) als Soll-Maßstab nutzen
- Ist-Controls gegen das Soll vergleichen → **Gap-Analyse**
- Gaps nach Risiko priorisieren

## Theorie

Eine **Baseline** ist der definierte Mindest-Soll-Zustand. **CIS Controls v8** (18 Controls, in Implementation Groups IG1–IG3) und **CIS Benchmarks** (konkrete System-Härtung) sind praxisnahe Maßstäbe; alternativ NIST 800-53/CSF (Übung 09). Eine **Gap-Analyse** stellt Ist (dein Inventar aus Übung 04) gegen Soll (Baseline) und listet **fehlende/teilweise** Controls.

Vorgehen: Baseline wählen (realistisch: CIS IG1 fürs Lab) → pro Baseline-Anforderung prüfen „erfüllt / teilweise / fehlt" → Gaps mit **Risiko** (Wahrscheinlichkeit × Impact) priorisieren → Maßnahmen ableiten. Technische Gaps lassen sich mit `lynis` (CIS-nahe Hinweise), `greenbone`/`nmap` (offene Schwachstellen/Dienste) teilautomatisiert finden.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| CIS Controls v8 / Benchmarks | Soll-Baseline |
| `lynis` | Host-Härtung gegen Benchmark prüfen |
| `greenbone`/`nmap` | technische Gaps (Schwachstellen/Dienste) |

## Lab-Setup

- Control-Inventar (Übung 04); eine CIS-Baseline (IG1); Lynis auf einem Lab-Host.

## Aufgabe (selbst lösen)

1. Wähle eine Baseline (z. B. **CIS Controls v8 IG1**) und liste ihre Kern-Anforderungen für dein Lab.
2. Führe eine **Gap-Analyse** durch: markiere je Anforderung „erfüllt / teilweise / fehlt" gegen dein Inventar.
3. Belege mindestens **drei** technische Gaps mit einem Tool (z. B. Lynis-Finding, offener Dienst via nmap, Schwachstelle via Greenbone).
4. **Priorisiere** die Top-5-Gaps nach Risiko und leite je eine konkrete Maßnahme ab.

**Ziel:** eine priorisierte Gap-Liste deines Labs gegen eine anerkannte Baseline, mit Tool-Belegen.

## SY0-701 Prüfungsbezug

- **5.0/1.0** baselines, gap analysis, CIS Controls/Benchmarks, benchmark/secure configuration, prioritization.
- Begriffe: *baseline*, *gap analysis*, *CIS Controls/IG*, *benchmark*, *risk-based prioritization*.
