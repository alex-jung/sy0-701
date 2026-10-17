# Übung 02 – Automatisierte Enumeration (linPEAS & LSE)

**Schwierigkeit: 2/10 · Dauer: ca. 45 Min.**

## Lernziele

- Automatisierte PrivEsc-Enumeration mit linPEAS und LSE durchführen
- Die farbcodierte Ausgabe (Wahrscheinlichkeit) interpretieren
- `pspy` nutzen, um Cron/Prozesse ohne root live zu beobachten
- Automatisierte Funde kritisch gegenprüfen (keine Blackbox)

## Theorie

Manuelle Enumeration (Übung 01) ist gründlich, aber langsam. **linPEAS** (Teil von PEASS-ng) automatisiert hunderte Checks und **hebt wahrscheinliche Vektoren farblich hervor** (rot/gelb = heiße Kandidaten). **LSE** (linux-smart-enumeration) ist eine schlankere Alternative mit Level-Steuerung.

**pspy** beobachtet **Prozesse und Cron Jobs in Echtzeit ohne root** – ideal, um versteckte root-Cron-Jobs zu entdecken, die `crontab` nicht zeigt.

Wichtig: Automatisierte Tools liefern **Kandidaten**, keine fertigen Exploits – Funde müssen verifiziert werden.

## Verwendete Tools

| Tool | Zweck | Hinweise |
|------|-------|----------|
| `linpeas.sh` | umfassende Auto-Enum | Farbcodierung (rot/gelb = Treffer) |
| `lse.sh` (LSE) | schlanke Auto-Enum | `-l 1`/`-l 2` Detailgrad |
| `pspy` | Prozesse/Cron live (ohne root) | `pspy64` |

## Lab-Setup

- Unprivilegierte Shell auf dem Linux-Ziel. Tools von Kali übertragen (HTTP-Server + `wget`/`curl`), nach `/tmp`, ausführbar machen.

## Aufgabe (selbst lösen)

1. Übertrage linPEAS aufs Ziel und führe es aus. Leite die Ausgabe auch in eine Datei.
2. Identifiziere die **rot/gelb** markierten „95% PE vector"-Funde. Decken sie sich mit deiner manuellen Liste aus Übung 01?
3. Führe LSE aus und vergleiche – findet es dieselben/andere Vektoren?
4. Starte `pspy` und warte auf einen **root-Cron-Job**, den `crontab` nicht zeigte. Was läuft da wann?
5. Wähle die drei vielversprechendsten Vektoren aus und begründe die Priorisierung.

**Ziel:** mit linPEAS/LSE/pspy eine automatisierte Vektor-Liste erstellt, mit der manuellen abgeglichen und priorisiert.

## SY0-701 Prüfungsbezug

- **Automatisierte Schwachstellen-/Misconfig-Erkennung** auf Host-Ebene.
- **Verifikation** automatischer Funde (false positives); Tools ≠ Garantie.
- **Monitoring-Perspektive:** dieselben Checks nutzt das Blue Team zur Härtung.
- Begriffe: *enumeration*, *misconfiguration*, *privilege escalation vector*, *verification*.
