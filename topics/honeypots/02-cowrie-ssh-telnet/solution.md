# Lösung – Übung 02: Cowrie aufsetzen

## 1. Installation

```bash
sudo apt install -y git python3-venv libssl-dev libffi-dev build-essential python3-dev
sudo adduser --disabled-password cowrie
sudo su - cowrie
git clone https://github.com/cowrie/cowrie
cd cowrie
python3 -m venv cowrie-env
source cowrie-env/bin/activate
pip install --upgrade pip && pip install -r requirements.txt
cp etc/cowrie.cfg.dist etc/cowrie.cfg
bin/cowrie start          # lauscht per Default auf 2222 (SSH) / 2223 (Telnet)
```

## 2. Echten SSH trennen + Port-Umleitung

```bash
# echter Admin-SSH auf 2022:
sudo sed -i 's/^#\?Port .*/Port 2022/' /etc/ssh/sshd_config
sudo systemctl restart ssh
# extern 22 -> Cowrie 2222:
sudo iptables -t nat -A PREROUTING -p tcp --dport 22 -j REDIRECT --to-port 2222
```
(Alternativ Telnet 23 → 2223.) Regel persistent machen (`iptables-persistent`).

## 3. Testangriff von Kali

```bash
ssh root@<honeypot-ip>         # Port 22 -> landet bei Cowrie
# Passwort: Cowrie akzeptiert z.B. die in etc/userdb.txt definierten / zufällige
whoami ; uname -a ; wget http://example.com/x ; exit
```

## 4. Session im Log

```bash
tail -f ~/cowrie/var/log/cowrie/cowrie.json | jq .
# Felder: eventid (cowrie.login.success / cowrie.command.input), src_ip, username, password, input
jq 'select(.eventid=="cowrie.command.input") | .input' var/log/cowrie/cowrie.json
```
Jeder Befehl ist mit Session-ID, Quell-IP und Zeit protokolliert. Downloads landen in `var/lib/cowrie/downloads/`.

## Härtung/Betrieb

- Cowrie läuft unprivilegiert; kein echtes OS freigegeben.
- Egress des Honeypots in OPNsense hart begrenzen (kein echter `wget`-Erfolg nach draußen).
- Admin-SSH-Port per Firewall nur von Management-Netz erreichbar.

## Häufige Fehler / Troubleshooting

- **Aussperren:** erst echten SSH auf neuen Port + Zugang testen, **dann** Umleitung setzen.
- **Cowrie startet nicht:** venv aktiv? `requirements.txt` installiert? Logs in `var/log/cowrie/cowrie.log`.
- **Port 22 „permission denied":** Cowrie nicht direkt auf 22 binden – NAT/REDIRECT nutzen.
