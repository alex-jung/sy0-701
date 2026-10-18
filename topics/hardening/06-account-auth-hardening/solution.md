# Lösung – Übung 06: Account- & Auth-Härtung

> Snapshot (PAM-Fehler können aussperren); zweite root-Shell offen halten.

## 1. Konten aufräumen

```bash
awk -F: '($3>=1000)||($3==0){print $1, $3, $7}' /etc/passwd   # echte User + root
awk -F: '$7!~"nologin|false"{print $1,$7}' /etc/passwd          # mit Login-Shell
sudo usermod -s /usr/sbin/nologin <service-konto>               # Login verbieten
sudo passwd -l <ungenutzt>                                       # sperren
```

## 2. Passwort-Policy + Lockout (PAM)

```bash
sudo apt install libpam-pwquality
# /etc/security/pwquality.conf: minlen=14, ... (bzw. Länge/Passphrasen)
# Lockout (faillock) in /etc/security/faillock.conf: deny=5, unlock_time=900
# in /etc/pam.d/common-auth entsprechend pam_faillock einbinden
```
Testen: 5 Fehllogins → Konto gesperrt (`faillock --user <u>` zeigt Status).

## 3. sudo minimieren

```bash
sudo visudo
# schlecht:  user ALL=(ALL) NOPASSWD: ALL
# besser:    user ALL=(root) /usr/bin/systemctl restart myapp
sudo -l       # Ergebnis prüfen
```
Keine shell-/escapefähigen Binaries pauschal (vgl. GTFOBins, `privilege-escalation` 03), `Defaults env_reset`.

## 4. TOTP-MFA

```bash
sudo apt install libpam-google-authenticator
google-authenticator          # pro User: QR/Seed in Authenticator-App
# /etc/pam.d/sshd:  auth required pam_google_authenticator.so
# sshd_config:      KbdInteractiveAuthentication yes ; AuthenticationMethods publickey,keyboard-interactive
sudo systemctl restart ssh
```
Login verlangt jetzt Key + TOTP-Code.

## 5. Brute-Force scheitert

```bash
hydra -l user -P rockyou.txt <server> ssh
```
→ nach wenigen Versuchen Lockout; selbst ein erratenes Passwort reicht ohne **MFA** nicht.

## Häufige Fehler / Troubleshooting

- **PAM falsch → kein Login mehr:** Snapshot/zweite root-Shell; Reihenfolge der PAM-Zeilen beachten.
- **faillock sperrt dich aus:** `faillock --user <u> --reset`; eigene IP/Konto bedenken.
- **sudo zu restriktiv:** nötige Admin-Befehle explizit erlauben.
- **MFA bricht Automatisierung:** Service-/Key-Accounts ausnehmen, nur interaktive Logins MFA.
