# Lösung – Übung 06: Chains & Intermediate CA

## 1. Intermediate-CA erstellen & von Root signieren

```bash
cd ~/lab-ca
openssl genpkey -algorithm RSA -pkeyopt rsa_keygen_bits:4096 -aes-256-cbc -out private/intermediate.key.pem
openssl req -new -key private/intermediate.key.pem -subj "/C=DE/O=Lab/CN=Lab Intermediate CA" -out intermediate.csr.pem

printf "basicConstraints=critical,CA:TRUE,pathlen:0\nkeyUsage=critical,keyCertSign,cRLSign\n" > int_ext.cnf
openssl x509 -req -in intermediate.csr.pem \
  -CA certs/ca.cert.pem -CAkey private/ca.key.pem -CAcreateserial \
  -days 1825 -sha256 -extfile int_ext.cnf -out certs/intermediate.cert.pem

openssl verify -CAfile certs/ca.cert.pem certs/intermediate.cert.pem   # OK
```

## 2. Server-Zertifikat über die Intermediate

```bash
openssl genpkey -algorithm RSA -pkeyopt rsa_keygen_bits:2048 -out app.key.pem
openssl req -new -key app.key.pem -subj "/CN=app.server.lab" -addext "subjectAltName=DNS:app.server.lab" -out app.csr.pem
printf "subjectAltName=DNS:app.server.lab\nbasicConstraints=CA:FALSE\nextendedKeyUsage=serverAuth\n" > app_ext.cnf
openssl x509 -req -in app.csr.pem \
  -CA certs/intermediate.cert.pem -CAkey private/intermediate.key.pem -CAcreateserial \
  -days 397 -sha256 -extfile app_ext.cnf -out app.cert.pem
```

## 3./4. Fullchain + Verify

```bash
cat app.cert.pem certs/intermediate.cert.pem > app-fullchain.pem

# ohne Intermediate -> Fehler:
openssl verify -CAfile certs/ca.cert.pem app.cert.pem
#  error 20 at 0 ... unable to get local issuer certificate

# mit Intermediate (untrusted) -> OK:
openssl verify -CAfile certs/ca.cert.pem -untrusted certs/intermediate.cert.pem app.cert.pem   # OK
```
Der Server liefert `app-fullchain.pem` aus (Leaf+Intermediate); die Root liegt im Client-Trust-Store.

## Hinweise / Troubleshooting

- **Reihenfolge der fullchain:** Leaf zuerst, dann Intermediate(s) – nicht die Root anhängen.
- `pathlen:0` verhindert, dass die Intermediate weitere Sub-CAs ausstellt.
- „unable to get local issuer" ist fast immer eine **fehlende Intermediate** am Server.
