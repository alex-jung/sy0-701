# Lösung – Übung 04: SSH Key-/Cert-Auth

## 1. Public-Key-Auth

```bash
ssh-keygen -t ed25519 -C "alex@lab"          # Passphrase setzen!
ssh-copy-id alex@server                      # Public Key -> authorized_keys
# /etc/ssh/sshd_config:
#   PasswordAuthentication no
#   PubkeyAuthentication yes
sudo systemctl restart ssh
ssh alex@server                              # Key + Passphrase (agent cached)
```

## 2. SSH-User-CA + Zertifikat

```bash
ssh-keygen -t ed25519 -f user_ca -C "Lab User CA"   # CA-Schlüssel
# User-Key signieren -> Zertifikat (gültig 8h, Principal "alex"):
ssh-keygen -s user_ca -I "alex@lab" -n alex -V +8h ~/.ssh/id_ed25519.pub
# erzeugt ~/.ssh/id_ed25519-cert.pub
# Server: CA-Public-Key hinterlegen und vertrauen:
sudo cp user_ca.pub /etc/ssh/user_ca.pub
# /etc/ssh/sshd_config:  TrustedUserCAKeys /etc/ssh/user_ca.pub
sudo systemctl restart ssh
```

## 3. Login per Zertifikat

```bash
# authorized_keys-Eintrag entfernen -> trotzdem Login, weil CA vertraut wird:
ssh -o CertificateFile=~/.ssh/id_ed25519-cert.pub alex@server
ssh-keygen -L -f ~/.ssh/id_ed25519-cert.pub      # Principal/Validity ansehen
```
Nach Ablauf (+8h) wird das Zertifikat ungültig → kein manueller Widerruf nötig.

## 4. Host-Zertifikat

```bash
ssh-keygen -s host_ca -I server -h -n server.lab -V +52w /etc/ssh/ssh_host_ed25519_key.pub
# sshd_config:  HostCertificate /etc/ssh/ssh_host_ed25519_key-cert.pub
# Client vertraut der Host-CA via known_hosts: @cert-authority *.lab <host_ca.pub>
```
Der Client vertraut der **Host-CA** → jeder korrekt signierte Host wird ohne „unknown host key"-Abfrage akzeptiert; TOFU-Problem gelöst.

## Hinweise / Troubleshooting

- Private Key immer mit Passphrase + `ssh-agent`; niemals committen.
- Principal muss zum Login-User/`AuthorizedPrincipals` passen, sonst Abweisung.
- Kurze Zertifikatslaufzeiten (Stunden/Tage) = eingebauter „Widerruf"; für echten Revoke `RevokedKeys`.
- Debug: `ssh -v`, `sudo journalctl -u ssh`.
