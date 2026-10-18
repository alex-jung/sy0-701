# Lösung – Übung 07: Eradication & Recovery

## 1. Root Cause schließen

Aus der Forensik (Übung 06): Erstzugang z. B. über **unsicheren File-Upload** (Webshell) oder **vsftpd-Backdoor**. Root Cause schließen:
- Lücke **patchen**/Dienst entfernen, Upload absichern (Allowlist/no-exec), Fehlkonfig beheben,
- **Credentials rotieren** (alle, die kompromittiert sein könnten – lokal + ggf. Domäne),
- erst dann weiter.

## 2. Eradication

```bash
# Persistence entfernen (aus Forensik bekannt):
crontab -r                                   # bzw. gezielte Zeile
sed -i '/<angreifer-key>/d' ~/.ssh/authorized_keys
systemctl disable --now <böser-dienst>; rm <unit>
rm /var/www/.../uploads/shell.php            # Webshell
sudo passwd -l <kompromittiertes-konto>      # bzw. entfernen
```
Prüfen, dass **nichts** übrig ist (erneute Enumeration wie post-exploitation 03).

## 3. Recovery (rebuild vs. clean)

Bei tiefer Kompromittierung (root/SYSTEM): **neu aufsetzen aus Known-Good** (goldenes Image/sauberes Backup) statt „bereinigen" – versteckte Rootkits/Persistence lassen sich nie sicher ausschließen. Daten nur aus **verifiziert sauberem** Backup zurückspielen.
Im Lab: Snapshot/Backup des Known-Good-Stands wiederherstellen; Root Cause **vor** der Rückkehr ins Netz geschlossen.

## 4. Verschärfte Überwachung

IoCs (Angreifer-IP, Hashes, JA3) als **Watchlist** ins SIEM, zusätzliche Alerts für den betroffenen Host/Dienst, engeres Monitoring für eine definierte Zeit → Rückkehr des Angreifers früh erkennen.

## 5. Wiederaufnahme-Kriterien & Rückfall

Kriterien: Root Cause nachweislich geschlossen, System aus Known-Good, gepatcht, überwacht, Beweise gesichert. **Rückfall-Risiko:** bleibt **eine** Persistence/ein Zugang übrig oder ist die Root Cause offen, ist der Angreifer in Minuten zurück → Eradication muss **vollständig** sein.

## Häufige Fehler / Troubleshooting

- **Nur Symptome entfernt (Webshell), Lücke offen:** Reinfektion → Root Cause schließen.
- **„Bereinigen" statt neu aufsetzen** bei tiefer Kompromittierung: unsicher.
- **Backup war schon kompromittiert:** Backup-Stand/Zeitpunkt prüfen (vor dem Einbruch).
- **Credentials nicht rotiert:** gestohlene Creds gelten weiter → rotieren.
