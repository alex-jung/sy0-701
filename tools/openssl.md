# openssl

**Kategorie:** Kryptografie / TLS / PKI (Schweizer Taschenmesser)

Umfassendes CLI-Toolkit für Hashing, symmetrische/asymmetrische Verschlüsselung, Signaturen, Schlüssel-/Zertifikatsverwaltung (X.509), CSR, CA und TLS-Debugging. Kern-Tool der Themen `cryptography-basics` und `pki-certificates`.

## Wichtige Subkommandos

| Befehl | Zweck |
|--------|-------|
| `openssl dgst -sha256 [-sign/-verify/-hmac]` | Hash / Signatur / HMAC |
| `openssl enc -aes-256-cbc -pbkdf2` | symmetrisch ver-/entschlüsseln |
| `openssl rand -hex 32` | Zufallsbytes (Key/IV/Salt) |
| `openssl genpkey -algorithm RSA/EC/X25519` | privaten Schlüssel erzeugen |
| `openssl pkey/rsa -pubout` | Public Key extrahieren / anschauen |
| `openssl pkeyutl -encrypt/-decrypt/-derive` | RSA-Krypto / (EC)DH-Shared-Secret |
| `openssl req -new -x509` | CSR bzw. self-signed Zertifikat |
| `openssl x509 -in c.pem -text -noout` | Zertifikat anzeigen |
| `openssl ca` / `openssl x509 -req` | CSR signieren (CA) |
| `openssl verify -CAfile ca.pem c.pem` | Chain/Trust prüfen |
| `openssl s_server`/`s_client` | TLS-Test-Server/-Client |
| `openssl passwd -6/-5` | Passwort-Hash (crypt) |

## Beispiele

```bash
openssl genpkey -algorithm RSA -pkeyopt rsa_keygen_bits:3072 -out key.pem
openssl req -new -x509 -key key.pem -days 365 -subj "/CN=test.lab" -out cert.pem
openssl s_client -connect host:443 -servername host   # TLS-Debug
openssl x509 -in cert.pem -noout -dates -subject -issuer
```

## Hinweise

Immer `-pbkdf2` bei `enc`; OAEP-Padding bei RSA; AEAD (GCM) für Integrität. Private Keys schützen/niemals committen. GCM über die CLI ist umständlich → ggf. Python `cryptography`.

## Verwendet in

cryptography-basics 01–10; pki-certificates 01–10; vpn-tunneling; web-exploitation (TLS). 
