# Lösung – Übung 04: First Response & Containment

> Snapshot vor Containment.

## 1. Netz-Isolation (ohne Shutdown)

**OPNsense:** eine Regel ganz oben, die den Host komplett isoliert (nur noch Analyse-/Management-Zugang):
```
Block  Source <host-ip> -> any    (+ umgekehrt)
# optional: in ein Quarantäne-VLAN verschieben
```
Oder per Switch-Port/Host-Firewall. Verifizieren vom Host: kein Internet, keine internen Ziele mehr erreichbar; C2/Exfil gestoppt.

## 2. Warum kein shutdown

`shutdown`/Strom aus löscht **RAM** (laufende Malware, Krypto-Keys, C2-Sessions, entschlüsselte Daten) und aktive Verbindungen → Beweise weg. Memory-Forensik (Übung 06) braucht den **laufenden** (aber isolierten) Host.

## 3. Account-Containment

```bash
# Linux:
sudo passwd -l <konto>          # sperren
sudo pkill -KILL -u <konto>     # Sessions beenden
# AD/Windows: Konto deaktivieren, Passwort reset, Kerberos-Tickets invalidieren
```
Zusätzlich ggf. betroffene Service-/Admin-Credentials **rotieren** (bei Verdacht auf Diebstahl).

## 4. Weitere Zugänge prüfen

```bash
ss -tnp                         # weitere aktive Sessions/Verbindungen
crontab -l; ls -la ~/.ssh/authorized_keys; systemctl list-timers   # Persistence (vgl. post-exploitation 03)
```
Ohne das Schließen **aller** Zugänge (zweite Shell, Persistence, weitere Konten) kommt der Angreifer zurück → Containment unvollständig.

## 5. Doku

Jede Maßnahme mit **Zeitstempel** protokollieren (was, wann, durch wen) → Grundlage für Timeline (Übung 08) und Chain of Custody (Übung 05).

## Häufige Fehler / Troubleshooting

- **Host ausgeschaltet:** Memory-Beweise verloren → isolieren, nicht ausschalten.
- **Nur Host isoliert, Konto offen:** Angreifer nutzt dasselbe Konto woanders.
- **Persistence übersehen:** Containment hält nicht → auf Hintertüren prüfen.
- **Isolation sperrt auch die Analyse aus:** Analyse-/Management-Pfad bewusst offen lassen.
