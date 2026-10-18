# Lynis

**Kategorie:** Hardening-Audit (Blue Team)

Agentenloses Linux-/Unix-Audit-Skript, das ein System gegen Best-Practices/Benchmarks prüft und einen **Hardening-Index** (Score) plus **Warnings/Suggestions** liefert. Ideal für Baseline- und Vorher/Nachher-Messung.

```bash
sudo lynis audit system
```

## Wichtige Optionen / Ausgaben

| Element | Bedeutung |
|---------|-----------|
| `audit system` | vollständiges System-Audit |
| `--quick` | ohne Pausen |
| `show groups`/`--tests-from-group` | gezielte Testgruppen |
| Hardening index | Score 0–100 (Fortschrittsmaß) |
| `/var/log/lynis.log` | Details |
| `/var/log/lynis-report.dat` | maschinenlesbar |

## Beispiele

```bash
sudo lynis audit system
grep -E 'Warning|Suggestion' /var/log/lynis.log
```

## Hinweise

Als root ausführen (sonst unvollständig). Liefert **Vorschläge**, kein formaler Compliance-Nachweis → für Compliance zusätzlich **SCAP/CIS-CAT**. Funde priorisieren + umsetzen (`hardening` 02–09), dann re-auditieren. Installation: `sudo apt install lynis`.

## Verwendet in

hardening 02 (Audit), 03/10 (Vorher/Nachher-Messung).
