# Lösung – Übung 08: Log- & Timeline-Analyse

## 1. Dateisystem-Timeline

```bash
fls -r -m / disk.img > bodyfile
mactime -b bodyfile -d -y > fs_timeline.csv       # -y = ISO-Zeit
# auf das Vorfallsfenster filtern:
grep "2026-10-1[67]" fs_timeline.csv | less
```
Finde die Erstellzeit (Birth/Created) der Webshell/Tools/`authorized_keys` → wann der Angreifer schrieb.

## 2. Super-Timeline (plaso)

```bash
log2timeline.py --storage-file plaso.db disk.img
psort.py -o l2tcsv -w supertimeline.csv plaso.db
# Zeitfenster/Keywords filtern:
psort.py plaso.db "date > '2026-10-16 00:00:00' AND date < '2026-10-17 23:59:59'"
```
Verschmilzt FS + Logs + Artefakte zu einer Zeitleiste.

## 3. Korrelation mit Netz/SIEM

Netz-/SIEM-Events ergänzen (gleiche Zeitbasis!):
- Firewall/IDS: Scan + Exploit-Alert (Zeit, Quelle).
- SIEM: Login/Prozess-Events (`logging-siem` 08).
- `tshark`: C2-Callback-Zeitpunkt.

## 4. Angriffskette (Timeline)

```
t0  10:02  Scan von <KALI>                         (Recon)   – Firewall/IDS
t1  10:05  Exploit/Upload -> Webshell geschrieben  (Initial Access) – FS-Timeline + IDS
t2  10:06  Reverse-Shell, Prozess als www-data     (Execution) – Memory/SIEM
t3  10:07  cron/authorized_keys angelegt           (Persistence) – FS-Timeline
t4  10:08  C2-Callback zu <KALI>:4444              (C2) – tshark/Firewall
t5  10:15  Zugriff 2. Host                          (Lateral) – SIEM
```

## 5. Initial Access & Dwell Time

- **Initial Access:** t1 (10:05) – erste Angreifer-Datei/erfolgreicher Exploit.
- **Dwell Time:** Zeitspanne Initial Access → Entdeckung (z. B. Alert um 10:20) = ~15 Min. In der Realität oft Tage/Wochen → Ziel: Time-to-Detect senken.

## Häufige Fehler / Troubleshooting

- **Zeitzonen/NTP uneinheitlich:** Timeline falsch → alles auf UTC normalisieren, NTP prüfen.
- **Timestomping:** Angreifer manipuliert MACB → mehrere Quellen (Logs/SIEM) gegenprüfen; `$MFT`/Change-Time beachten.
- **plaso riesig/langsam:** auf relevante Parser/Zeitfenster eingrenzen.
- **Nur FS oder nur Logs:** erst die Kombination ergibt die Kette.
