# Lösung – Übung 04: RSA

## 1. Keypair + Public Key

```bash
openssl genpkey -algorithm RSA -pkeyopt rsa_keygen_bits:3072 -out priv.pem
openssl rsa -in priv.pem -pubout -out pub.pem
```

## 2. Private Key anschauen

```bash
openssl rsa -in priv.pem -text -noout | head -40
```
Komponenten: **modulus (n)** = p·q (das „öffentliche" große Produkt), **publicExponent (e)** meist 65537, **privateExponent (d)**, Primfaktoren **prime1/prime2 (p,q)**. Public Key = (n, e); Sicherheit beruht darauf, dass aus n nicht praktikabel p,q gewonnen werden können.

## 3. Ver-/Entschlüsseln

```bash
echo "Treffpunkt 14:00" > msg.txt
openssl pkeyutl -encrypt -pubin -inkey pub.pem -in msg.txt -out msg.enc
openssl pkeyutl -decrypt -inkey priv.pem -in msg.enc -out msg.dec
cat msg.dec
```
(Empfohlen mit OAEP-Padding: `-pkeyopt rsa_padding_mode:oaep`.)

## 4. Warum nur kurze Daten / ECC

- RSA kann höchstens ~ (Schlüssellänge − Padding) Bytes direkt verschlüsseln (3072-bit ≈ 384 Byte, minus Padding) und ist **langsam** → man verschlüsselt damit nur einen **symmetrischen Session-Key** (hybrid, Übung 07).
- **ECC**: gleiche Sicherheit bei viel kürzeren Keys (256-bit ECC ≈ 3072-bit RSA), schneller/weniger Rechenlast → ideal für TLS/mobile.

## Hinweise / Troubleshooting

- „data too large for key size" → Nachricht zu lang für direktes RSA → hybrid nutzen.
- Private Key niemals weitergeben/committen; nur `pub.pem` teilen.
- Ohne OAEP (altes PKCS#1 v1.5) drohen Padding-Oracle-Probleme → OAEP verwenden.
