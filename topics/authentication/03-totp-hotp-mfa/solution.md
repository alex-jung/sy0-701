# Lösung – Übung 03: TOTP/HOTP MFA

## 1. oathtool

```bash
SECRET=JBSWY3DPEHPK3PXP        # Base32
oathtool --hotp -c 1 -b $SECRET     # HOTP, Zähler=1
oathtool --totp -b $SECRET          # TOTP, aktuelles 30s-Fenster
oathtool --totp -b -v $SECRET       # zeigt Zeitfenster/Details
```
HOTP: zählergetrieben (gilt bis genutzt). TOTP: zeitgetrieben (wechselt alle 30 s); beide = HMAC(secret, counter) → 6 Ziffern.

## 2. TOTP-MFA via PAM

```bash
sudo apt install -y libpam-google-authenticator
google-authenticator        # QR scannen (App), -> Secret + Scratch-Codes
# /etc/pam.d/sshd (oder common-auth):  auth required pam_google_authenticator.so
# /etc/ssh/sshd_config:
#   KbdInteractiveAuthentication yes
#   AuthenticationMethods publickey,keyboard-interactive  (oder password,keyboard-interactive)
sudo systemctl restart ssh
```

## 3. Test

```bash
ssh alex@localhost     # fragt Passwort/Key + "Verification code:"
# falscher/alter Code -> Abweisung; auth.log:
sudo tail /var/log/auth.log | grep -i authenticator
```

## 4. Real-time Phishing vs FIDO2

Beim TOTP gibt der Nutzer den Code auf einer **Fake-Seite** ein; der Angreifer leitet ihn sofort an die echte Seite weiter (AiTM-Proxy, z. B. Evilginx) → Login gelingt, da der Code gerade gültig ist. **FIDO2/WebAuthn** bindet die Signatur an die **Origin** (Domain) und nutzt Challenge-Response mit privatem Schlüssel → eine Fake-Domain bekommt keine gültige Assertion ⇒ **phishing-resistent** (Übung 09).

## Hinweise / Troubleshooting

- **Zeit-Drift:** TOTP scheitert, wenn Server-/Geräteuhr auseinanderlaufen → NTP.
- Scratch-/Recovery-Codes sicher aufbewahren (sonst Lockout).
- SSH-MFA sorgfältig testen (zweite Session offen halten), sonst Aussperren.
