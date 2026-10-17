# Privilege Escalation / Hardening Report – <Host>

**Autor:** <Name> · **Datum:** <YYYY-MM-DD> · **Version:** 1.0

---

## 1. Summary

<2–4 Sätze: Startzugang, höchstes erreichtes Privileg, Hauptursache, dringendster Fix.>

**Startzugang:** <user/www-data> → **Erreicht:** root / SYSTEM
**Genutzter Hauptvektor:** <z. B. sudo NOPASSWD find>

---

## 2. Enumeration (Zusammenfassung)

- **Methode/Tools:** manuell (`id`,`sudo -l`,SUID,cron) + linPEAS/winPEAS + pspy
- **OS/Kernel:** <…>
- **Auffällige Funde:** <Kurzliste>

---

## 3. Gefundene Vektoren (priorisiert)

| # | Vektor | Ursache (Misconfig) | Zuverlässigkeit | genutzt? |
|---|--------|---------------------|-----------------|----------|
| 1 | sudo NOPASSWD /usr/bin/find | zu weite sudo-Regel | hoch | ✅ |
| 2 | SUID /usr/bin/python | unnötiges SUID | hoch | – |
| 3 | root-Cron writable script | insecure permissions | mittel | – |
| 4 | alter Kernel (DirtyCow) | fehlende Patches | mittel (crash-Risiko) | – |

---

## 4. Ausnutzung (Nachweis)

### Vektor 1 – <Titel>
- **Befehl:** `sudo find . -exec /bin/sh \; -quit`
- **Nachweis:** `id` → `uid=0(root)`
- **Impact:** vollständige Systemkontrolle

*(pro genutztem Vektor wiederholen)*

---

## 5. Hardening (priorisiert)

| Prio | Vektor | Maßnahme |
|------|--------|----------|
| P1 | sudo-Regel | auf spezifische, nicht-shellfähige Befehle beschränken / entfernen |
| P1 | SUID python | `chmod u-s`, SUID-Set auditieren |
| P2 | Cron-Script | root-only Rechte, absolute Pfade |
| P2 | Kernel | patchen / System aktualisieren (EOL ablösen) |

**Übergreifend:** least privilege, regelmäßiges Self-Audit (linPEAS), Patch-Management, Monitoring.

---

## 6. Anhang

- Enumeration-Output (linPEAS/pspy), verwendete Befehle, Tool-Versionen, Snapshots
