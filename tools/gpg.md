# GnuPG (gpg)

**Kategorie:** Kryptografie (OpenPGP: Verschlüsselung & Signaturen)

Implementierung von OpenPGP: asymmetrische Verschlüsselung, digitale Signaturen und ein **Web of Trust** (dezentrale Schlüssel-Vertrauensstellung, Alternative zu zentraler PKI). Für Dateien, E-Mail, Release-/Paket-Signaturen.

## Wichtige Befehle

| Befehl | Zweck |
|--------|-------|
| `gpg --quick-generate-key "Name <mail>" rsa3072` | Schlüsselpaar erzeugen |
| `gpg --list-keys` / `--list-secret-keys` | Schlüssel anzeigen |
| `gpg --export -a ID` / `--import` | Public Key export/import |
| `gpg -e -r EMPFÄNGER datei` | verschlüsseln (für Empfänger) |
| `gpg -d datei.gpg` | entschlüsseln |
| `gpg --detach-sign -a datei` | abgetrennte Signatur (.asc) |
| `gpg --clearsign datei` | Text + Signatur in einer Datei |
| `gpg --verify datei.asc datei` | Signatur prüfen |
| `gpg --sign-key ID` | fremden Key beglaubigen (WoT) |

## Hinweise

Non-Repudiation nur bei Signatur (Private Key des Senders). Vertrauen basiert auf Web of Trust/Key-Fingerprints – Fingerprint über sicheren Kanal verifizieren. Keyserver nur mit Vorsicht. Private Key + Passphrase/Revocation-Cert sicher aufbewahren.

## Verwendet in

cryptography-basics 05 (Signaturen), 10 (Vergleich/Capstone); malware-analysis (Signatur-Checks); social-engineering (signierte vs. gefälschte Mails).
