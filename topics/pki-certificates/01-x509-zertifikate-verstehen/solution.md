# Lösung – Übung 01: X.509 verstehen

## 1. Zertifikat abrufen

```bash
echo | openssl s_client -connect example.com:443 -servername example.com 2>/dev/null \
  | openssl x509 -out site.pem
```

## 2. Felder anzeigen

```bash
openssl x509 -in site.pem -text -noout
openssl x509 -in site.pem -noout -subject -issuer -dates -serial
```
Zuordnung:
- **Subject:** CN/Org des Inhabers (oft nur CN=Hostname, Rest via SAN).
- **Issuer:** die signierende (Intermediate-)CA.
- **Validity:** `notBefore`/`notAfter`.
- **Public Key:** z. B. „RSA Public-Key: (2048 bit)" oder „id-ecPublicKey".
- **Serial Number / Signature Algorithm:** z. B. `sha256WithRSAEncryption` bzw. `ecdsa-with-SHA256`.

## 3. Extensions

```bash
openssl x509 -in site.pem -noout -ext subjectAltName,keyUsage,extendedKeyUsage,basicConstraints,crlDistributionPoints,authorityInfoAccess
```
- **SAN:** `DNS:example.com, DNS:www.example.com` – die tatsächlich abgedeckten Namen (CN allein zählt heute nicht mehr).
- **Key Usage:** z. B. `Digital Signature, Key Encipherment`.
- **EKU:** `TLS Web Server Authentication`.
- **Basic Constraints:** `CA:FALSE` (Leaf) vs. `CA:TRUE` (CA).
- **CRL/AIA:** URLs für CRL bzw. OCSP (Übung 08).

## 4. Trust Chain

Der Browser/OS vertraut einer Menge **Root-CAs** (Trust Store). Das **Leaf**-Zertifikat der Seite ist von einer **Intermediate-CA** signiert, diese wiederum von der **Root-CA**. Beim Verbindungsaufbau prüft der Client die Kette Leaf → Intermediate → Root und vertraut, wenn die Root im Trust Store liegt und alle Signaturen/Gültigkeiten/Namen stimmen.

## Hinweise / Troubleshooting

- `s_client` zeigt mit `-showcerts` die ganze gesendete Kette.
- PEM↔DER: `openssl x509 -in c.pem -outform der -out c.der`.
- CN ohne SAN wird von modernen Browsern **ignoriert** → immer SAN (Übung 07).
