# Lösung – Übung 05: Digitale Signaturen

## 1. openssl signieren/verifizieren

```bash
echo "Vertrag v1" > doc.txt
openssl dgst -sha256 -sign priv.pem -out doc.sig doc.txt
openssl dgst -sha256 -verify pub.pem -signature doc.sig doc.txt   # "Verified OK"
echo "manipuliert" >> doc.txt
openssl dgst -sha256 -verify pub.pem -signature doc.sig doc.txt   # "Verification Failure"
```

## 2. GPG detached signature

```bash
gpg --quick-generate-key "Alex Lab <lab@example.test>" rsa3072 sign 0
gpg --detach-sign --armor doc.txt         # erzeugt doc.txt.asc
gpg --verify doc.txt.asc doc.txt          # Good signature
```

## 3. Clearsign vs detached

```bash
gpg --clearsign doc.txt                   # doc.txt.asc enthält Text + Signatur in einer Datei
```
- **Detached:** Signatur in **separater** Datei (Original bleibt unverändert, z. B. für Binaries/Releases).
- **Clearsign:** Text + Signatur in **einem** lesbaren Dokument (z. B. signierte E-Mail/Ankündigung).

## 4. Welche Keys / Non-Repudiation

- **Signieren:** mit dem **Private Key des Senders**. **Prüfen:** mit dessen **Public Key**.
- Non-Repudiation: nur der Sender besitzt den Private Key → eine gültige Signatur kann **nur** von ihm stammen; er kann die Urheberschaft nicht glaubhaft bestreiten (sofern der Key nicht kompromittiert ist).

## Hinweise / Troubleshooting

- „Verification Failure" = Datei geändert **oder** falscher Public Key/Hash-Algorithmus.
- Signatur schützt **nicht** die Vertraulichkeit – der Inhalt bleibt lesbar (dafür zusätzlich verschlüsseln).
- Vertrauen in den Public Key ist das eigentliche Problem → gelöst durch PKI/Zertifikate (`pki-certificates`) bzw. Web of Trust (gpg).
