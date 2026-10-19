# Lösung – Übung 07: SAN, Key Usage & Extensions

## 1. Mehrere SAN / Wildcard

Extension-Datei (multi-SAN, TLS-Server):
```ini
# san_multi.cnf
subjectAltName=DNS:server.lab,DNS:www.server.lab,IP:10.0.0.10
basicConstraints=CA:FALSE
keyUsage=critical,digitalSignature,keyEncipherment
extendedKeyUsage=serverAuth
```
```bash
openssl x509 -req -in app.csr.pem -CA certs/intermediate.cert.pem -CAkey private/intermediate.key.pem \
  -CAcreateserial -days 397 -sha256 -extfile san_multi.cnf -out multi.cert.pem
openssl x509 -in multi.cert.pem -noout -ext subjectAltName,keyUsage,extendedKeyUsage
```
Wildcard: `subjectAltName=DNS:*.server.lab`. Deckt **genau eine** Ebene ab → `www.server.lab` ✅, `a.b.server.lab` ❌, `server.lab` (bare) ❌.

## 2. Server- vs. Client-EKU

- Server: `extendedKeyUsage=serverAuth` + KU `digitalSignature,keyEncipherment`.
- Client (mTLS): `extendedKeyUsage=clientAuth` + KU `digitalSignature`.

## 3. Zweckbindung

Ein Zert mit nur `serverAuth` wird von einer Software, die **clientAuth** (mTLS) oder **codeSigning** verlangt, **abgelehnt** – die EKU passt nicht. Das ist gewollt (least privilege): ein TLS-Server-Zert soll keinen Code signieren können.

## 4. Name Constraints (Intermediate)

```ini
# auf der Intermediate:
basicConstraints=critical,CA:TRUE,pathlen:0
nameConstraints=critical,permitted;DNS:.server.lab
```
Nutzen: Selbst wenn der Intermediate-Key kompromittiert wird, kann er **nur** Zerts unter `*.server.lab` ausstellen – kein gültiges Zert für `google.com`. Begrenzt den Schaden erheblich.

## Hinweise / Troubleshooting

- CN ohne SAN → moderne Clients verweigern (ERR_CERT_COMMON_NAME_INVALID).
- Wildcard deckt **nicht** die bare Domain ab → beide als SAN aufnehmen, wenn nötig.
- `critical` bei KU/BasicConstraints/NameConstraints bewusst setzen – Clients müssen kritische Extensions verstehen oder ablehnen.
