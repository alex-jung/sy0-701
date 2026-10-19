# Lösung – Übung 09: FIDO2/WebAuthn

## 1./2. WebAuthn ausprobieren

- **Virtueller Authenticator (ohne Hardware):** Chrome DevTools → More tools → **WebAuthn** → „Enable" + „Add authenticator" (ctap2, internal/usb).
- Auf **webauthn.io**: Username eingeben → **Register** (Authenticator erzeugt Keypair, Public Key zum Server) → **Authenticate** (Server-Challenge wird signiert).
- Im DevTools/Netzwerk sieht man: `publicKey.challenge`, `rp.id`/Origin, `response.signature` – **kein Passwort**. Registration erzeugt das Credential; Authentication beweist Besitz per signierter Challenge.

## 3. Warum Phishing scheitert

- **TOTP:** Nutzer tippt den Code auf der **Fake-Seite**; der AiTM-Proxy (Evilginx) reicht ihn in Echtzeit an die echte Seite → Login/Session-Cookie geklaut.
- **FIDO2:** Der Authenticator signiert die Challenge **gebunden an die Origin/RP-ID** der Seite, auf der er gerade ist. Auf `evil-bank.com` erzeugt er eine Signatur für `evil-bank.com` → die echte `bank.com` **weist sie ab** (Audience/Origin passt nicht). Es gibt nichts „Weiterreichbares" → **phishing-resistent**.

## 4. pam_u2f (optional)

```bash
sudo apt install -y libpam-u2f
pamu2fcfg > ~/.config/Yubico/u2f_keys     # Key antippen -> Registrierung
# /etc/pam.d/sudo (oder login/sshd):
#   auth required pam_u2f.so    (2FA)  oder  auth sufficient pam_u2f.so (passwordless)
sudo -k; sudo echo test     # verlangt Key-Touch
```

## Hinweise / Troubleshooting

- **RP-ID/Origin-Mismatch** (z. B. hinter Reverse Proxy/anderer Domain) → Login scheitert; RP-ID korrekt setzen.
- Mind. **zwei** Authenticatoren registrieren (Backup), sonst Lockout bei Verlust.
- Passkeys: synchronisiert (bequem, Cloud-Trust) vs. device-bound (höchste Sicherheit).
- `pam_u2f` am echten SSH/sudo nur mit offener Zweitsitzung testen.
