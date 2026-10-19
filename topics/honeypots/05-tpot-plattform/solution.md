# Lösung – Übung 05: T-Pot

## 1. Installation

```bash
sudo apt update && sudo apt install -y git
git clone https://github.com/telekom-security/tpotce
cd tpotce
./install.sh          # interaktiv: Edition wählen (STANDARD/HIVE), Web-User/Passwort setzen
sudo reboot
```
Nach dem Reboot starten die Container automatisch (`sudo systemctl status tpot`).

## 2. Port-Logik

- **SSH-Management:** Port **64295** (nicht 22 – 22 gehört Cowrie!).
- **Web-UI/Kibana:** `https://<ip>:64297` (mit gesetztem Web-User).
- Fast alle übrigen Ports werden auf die jeweiligen Honeypot-Container umgeleitet.

```bash
ssh -p 64295 <user>@<tpot-ip>       # Admin
sudo dps.sh                         # Status aller Honeypot-Container
```

## 3. Testangriffe

```bash
# von Kali:
nmap -sV <tpot-ip>
hydra -l root -P /usr/share/wordlists/rockyou.txt ssh://<tpot-ip>   # landet in Cowrie
curl http://<tpot-ip>/
```

## 4. Kibana-Dashboards

`https://<tpot-ip>:64297` → Kibana. Beispiel-Kennzahlen:
- **Cowrie-Dashboard:** Top-Usernames/Passwörter, Top-Quell-IPs.
- **Suricata-Dashboard:** CVE-/Signatur-Treffer, Alert-Kategorien.
- **Attack Map:** Live-Geolokation der Quell-IPs; Gesamtzahl Angriffe/Stunde.

## Härtung/Betrieb

- Nur Ports 64295/64297 aus dem Management-Netz erreichbar; Egress des Honeypot-Netzes sperren.
- Disk-Monitoring (ELK wächst schnell), T-Pot aktualisieren, VM-Snapshots.

## Häufige Fehler / Troubleshooting

- **SSH 22 scheinbar „komisch":** das ist Cowrie – echter Zugang über 64295.
- **Out-of-memory/Container crashen:** VM zu klein → RAM/Disk erhöhen.
- **Kibana leer:** ein paar Minuten warten / Angriffe erzeugen; Zeitfilter in Kibana prüfen.
- **Installation nur auf dedizierter, frischer VM** (T-Pot übernimmt Netz-/Docker-Setup).
