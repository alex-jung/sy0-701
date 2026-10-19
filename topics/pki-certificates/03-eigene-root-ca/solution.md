# Lösung – Übung 03: Root-CA

## 1. Verzeichnisstruktur

```bash
mkdir -p ~/lab-ca/{private,certs,newcerts,crl}
cd ~/lab-ca
chmod 700 private
touch index.txt
echo 1000 > serial
echo 1000 > crlnumber
```

## 2. CA-Key + self-signed CA-Zertifikat

```bash
# CA-Key mit Passphrase:
openssl genpkey -algorithm RSA -pkeyopt rsa_keygen_bits:4096 \
  -aes-256-cbc -out private/ca.key.pem
chmod 400 private/ca.key.pem

# self-signed Root-CA-Zertifikat:
openssl req -x509 -new -key private/ca.key.pem -sha256 -days 3650 \
  -subj "/C=DE/O=Lab/CN=Lab Root CA" \
  -addext "basicConstraints=critical,CA:TRUE" \
  -addext "keyUsage=critical,keyCertSign,cRLSign" \
  -out certs/ca.cert.pem
```

## 3. Prüfen

```bash
openssl x509 -in certs/ca.cert.pem -noout -subject -issuer -ext basicConstraints,keyUsage
```
`CA:TRUE`, `keyCertSign, cRLSign`, Subject==Issuer (`CN=Lab Root CA`) → gültige Root.

## 4. Key-Absicherung

- Datei `private/ca.key.pem`: `chmod 400`, Besitzer only; Verzeichnis `700`.
- **Passphrase** (AES-256) auf dem Key – ohne sie kann niemand signieren.
- Root möglichst **offline** (separate VM/Medium), nur zum Signieren der Intermediate (Übung 06) hochfahren.
- Grund: Mit dem CA-Key kann man **jedes** Zertifikat fälschen → ein kompromittierter CA-Key bricht das gesamte Trust-Modell (alle ausgestellten Zerts müssten als unsicher gelten).

## Hinweise / Troubleshooting

- `basicConstraints=CA:TRUE` fehlt → die „CA" kann keine gültige Chain bilden.
- Für `openssl ca` braucht es `index.txt`/`serial` + ein `[ CA_default ]`-Abschnitt in `openssl.cnf`.
- Root-Laufzeit lang (Jahre), aber bewusst – Rotation ist aufwendig (neuer Trust-Anker überall verteilen).
