# Lösung – Übung 07: Key Exchange & Hybrid

## 1. ECDH Shared Secret (X25519)

```bash
openssl genpkey -algorithm X25519 -out alice.pem
openssl genpkey -algorithm X25519 -out bob.pem
openssl pkey -in alice.pem -pubout -out alice.pub
openssl pkey -in bob.pem   -pubout -out bob.pub

# Alice berechnet mit ihrem Priv + Bobs Pub:
openssl pkeyutl -derive -inkey alice.pem -peerkey bob.pub -out s_alice.bin
# Bob berechnet mit seinem Priv + Alices Pub:
openssl pkeyutl -derive -inkey bob.pem -peerkey alice.pub -out s_bob.bin
sha256sum s_alice.bin s_bob.bin     # identisch!
```

## 2. KDF + symmetrisch

```bash
KEY=$(sha256sum s_alice.bin | cut -d' ' -f1)       # simple KDF (Demo; real: HKDF)
openssl enc -aes-256-cbc -pbkdf2 -K $KEY -iv $(openssl rand -hex 16) -in geheim.txt -out msg.enc
```

## 3. Hybrid mit RSA

```bash
# Bob hat bob_rsa.pem / bob_rsa.pub (aus Übung 04)
openssl rand -out sessionkey.bin 32
openssl enc -aes-256-cbc -pbkdf2 -pass file:sessionkey.bin -in datei.txt -out datei.enc
openssl pkeyutl -encrypt -pubin -inkey bob_rsa.pub -pkeyopt rsa_padding_mode:oaep \
  -in sessionkey.bin -out sessionkey.enc
# Bob entschlüsselt:
openssl pkeyutl -decrypt -inkey bob_rsa.pem -pkeyopt rsa_padding_mode:oaep \
  -in sessionkey.enc -out sessionkey.dec
openssl enc -d -aes-256-cbc -pbkdf2 -pass file:sessionkey.dec -in datei.enc
```
→ große Daten symmetrisch (schnell), nur der 32-Byte-Key asymmetrisch (sicher verteilt).

## 4. PFS

PFS: jede Sitzung nutzt einen **ephemeren** (einmaligen) DH-Key (ECDHE). Das Shared Secret existiert nur für diese Session und wird danach verworfen. Zeichnet jemand den Verkehr auf und kompromittiert **später** den Langzeit-(Zertifikats-)Private-Key, kann er die alten Sessions **nicht** entschlüsseln, weil deren ephemere Keys nirgends gespeichert sind.

## Hinweise / Troubleshooting

- `-derive` liefert auf beiden Seiten nur dann Gleichheit, wenn Priv/Peer-Pub korrekt gekreuzt sind.
- Reales KDF ist **HKDF**, nicht „sha256 vom Secret" (hier zur Demo vereinfacht).
- DH ohne Authentisierung ist anfällig für **MITM** → in TLS wird der DH-Austausch durch Zertifikate/Signaturen authentisiert (`pki-certificates`).
