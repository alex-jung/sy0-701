# Lösung – Übung 02: CIS-Benchmark-Audit

## 1. Lynis-Audit

```bash
sudo apt install lynis
sudo lynis audit system
```
Am Ende: **Hardening index : XX/100** + Warnings/Suggestions. Report: `/var/log/lynis.log`, Daten `/var/log/lynis-report.dat`. Index notieren (Baseline für Übung 10).

## 2. Funde durchgehen

```bash
grep -E 'Warning|Suggestion' /var/log/lynis.log | head -40
```
Typische Kategorien: **SSH** (Config schwach), **Auth** (Passwort-Policy/PAM), **Dienste** (unnötige laufen), **Kernel** (sysctl-Härtung fehlt), **Logging/Auditd** fehlt, **Dateirechte**.

## 3. OpenSCAP (CIS/SSG-Profil)

```bash
sudo apt install openscap-scanner ssg-debderived   # bzw. scap-security-guide
oscap xccdf eval --profile <cis-profil> \
  --results scan.xml --report scan.html \
  /usr/share/xml/scap/ssg/content/ssg-<os>-ds.xml
```
`scan.html` zeigt Pass/Fail je Regel gegen das CIS-Profil → standardisierte Compliance-Sicht.

## 4. Remediation-Liste (priorisiert)

| Prio | Finding (Quelle) | Maßnahme | Übung |
|------|------------------|----------|-------|
| P1 | root-SSH-Login erlaubt | SSH härten | 04 |
| P1 | unnötige Dienste offen | Dienste reduzieren | 05 |
| P2 | schwache Passwort-Policy | Account-Härtung | 06 |
| P2 | Kernel/sysctl ungehärtet | Linux-Hardening | 03 |
| P3 | kein auditd/Logging | Logging aktivieren | (logging-siem) |

## 5. Lynis vs. SCAP/CIS-CAT

- **Lynis:** schnell, ad-hoc, gut für Überblick/Ideen – kein formaler Compliance-Nachweis.
- **SCAP/CIS-CAT:** **standardisiert/maschinenlesbar**, mappt exakt auf ein Benchmark/Profil → für **Compliance-Reporting/Audits** und Automatisierung (teils Auto-Remediation).

## Häufige Fehler / Troubleshooting

- **Lynis als non-root:** unvollständig → `sudo`.
- **SCAP-Profil/Content fehlt:** passendes `ssg-*`-Datastream für die Distro installieren.
- **Alle Funde sofort umsetzen:** erst priorisieren + testen (Snapshot) – manche Härtung bricht Dienste.
- **Index ohne Kontext:** niedriger Index ist Startpunkt; Vorher/Nachher ist der Mehrwert (Übung 10).
