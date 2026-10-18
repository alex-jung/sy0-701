# Lösung – Übung 04: SSH-Hardening

> Snapshot + Konsolen-Zugang bereithalten (Aussperr-Gefahr).

## 1. Key-Auth zuerst

```bash
# Client:
ssh-keygen -t ed25519 -f ~/.ssh/lab
ssh-copy-id -i ~/.ssh/lab.pub user@<server>
ssh -i ~/.ssh/lab user@<server>       # MUSS klappen, bevor Passwort aus!
```

## 2. sshd_config härten

`/etc/ssh/sshd_config`:
```
PermitRootLogin no
PasswordAuthentication no
PubkeyAuthentication yes
MaxAuthTries 3
LoginGraceTime 20
AllowUsers user
ClientAliveInterval 300
ClientAliveCountMax 1
```
```bash
sudo sshd -t && sudo systemctl restart ssh      # -t prüft Syntax zuerst!
```

## 3. Firewall-Beschränkung

SSH nur aus dem Management-Netz (OPNsense/Host-FW):
```bash
sudo ufw allow from 192.168.1.0/24 to any port 22
sudo ufw deny 22
```

## 4. fail2ban

```bash
sudo apt install fail2ban
# /etc/fail2ban/jail.local:
# [sshd]
# enabled = true
# maxretry = 3
# bantime = 1h
sudo systemctl restart fail2ban
sudo fail2ban-client status sshd      # nach Fehlversuchen: gebannte IPs
```

## 5. ssh-audit + Brute-Force-Vergleich

```bash
ssh-audit <server>                    # Crypto/Konfig bewerten
# vorher (ungehärtet): hydra fand evtl. ein Passwort
hydra -l user -P rockyou.txt <server> ssh    # jetzt: chancenlos (key-only) + fail2ban-Ban
```

## Härtung/Betrieb

Key-Management (Passphrase, Rotation), zentrale Verteilung (Ansible), 2FA (`AuthenticationMethods publickey,keyboard-interactive`), Monitoring der Logins im SIEM.

## Häufige Fehler / Troubleshooting

- **Ausgesperrt:** Passwort-Auth abgeschaltet, bevor Key getestet → über Konsole/Snapshot zurück.
- **`sshd -t` übersprungen:** kaputte Config → Dienst startet nicht. Immer erst testen.
- **fail2ban bannt dich selbst:** eigene IP in `ignoreip`.
- **Key abgelehnt:** Rechte `~/.ssh` 700, `authorized_keys` 600, richtiger User.
