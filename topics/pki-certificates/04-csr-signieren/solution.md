# Lösung – Übung 04: CSR signieren

## 1. Key + CSR

```bash
openssl genpkey -algorithm RSA -pkeyopt rsa_keygen_bits:2048 -out www.key.pem
openssl req -new -key www.key.pem -out www.csr.pem \
  -subj "/C=DE/O=Lab/CN=www.server.lab" \
  -addext "subjectAltName=DNS:www.server.lab"
```

## 2. CSR prüfen

```bash
openssl req -in www.csr.pem -noout -text -verify
```
Enthält: Subject, Public Key, angeforderte Extensions (SAN), eigene Signatur (`-verify` → „verify OK"). **Nicht** enthalten: Issuer, Serial, Validity – die vergibt erst die CA.

## 3. Signieren

Variante A – `openssl x509 -req` (einfach):
```bash
# SAN in Extension-Datei, da -req die CSR-Extensions nicht automatisch übernimmt:
printf "subjectAltName=DNS:www.server.lab\nbasicConstraints=CA:FALSE\nextendedKeyUsage=serverAuth\n" > ext.cnf
openssl x509 -req -in www.csr.pem \
  -CA ~/lab-ca/certs/ca.cert.pem -CAkey ~/lab-ca/private/ca.key.pem -CAcreateserial \
  -days 397 -sha256 -extfile ext.cnf -out www.cert.pem
```
Variante B – `openssl ca` (mit index/serial/Policy aus `openssl.cnf`).

## 4. Verify

```bash
openssl verify -CAfile ~/lab-ca/certs/ca.cert.pem www.cert.pem   # "OK"
openssl x509 -in www.cert.pem -noout -issuer -subject -ext subjectAltName
```
Issuer = `Lab Root CA`, Subject = `www.server.lab`, SAN gesetzt.

## Hinweise / Troubleshooting

- **SAN „verschwunden":** `x509 -req` übernimmt CSR-Extensions nicht automatisch → `-extfile` nutzen (oder `copy_extensions = copy` bei `openssl ca`, vorsichtig).
- Private Key `www.key.pem` bleibt lokal; nur CSR geht zur CA.
- `-CAcreateserial` legt `*.srl` an; bei `openssl ca` kommt die Serial aus `serial`.
