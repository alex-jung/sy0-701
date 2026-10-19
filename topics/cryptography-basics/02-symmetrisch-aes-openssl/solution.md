# Lösung – Übung 02: Symmetrisch (AES)

## 1. AES-256-CBC mit Passphrase

```bash
echo "geheime Daten" > klartext.txt
openssl enc -aes-256-cbc -pbkdf2 -iter 100000 -salt \
  -in klartext.txt -out cipher.bin
# Entschlüsseln:
openssl enc -d -aes-256-cbc -pbkdf2 -iter 100000 \
  -in cipher.bin -out entschluesselt.txt
sha256sum klartext.txt entschluesselt.txt   # identische Hashes
```

## 2. Mit explizitem Key + IV

```bash
KEY=$(openssl rand -hex 32)   # 256 bit
IV=$(openssl rand -hex 16)    # 128 bit
openssl enc -aes-256-cbc -K $KEY -iv $IV -in klartext.txt -out c2.bin
openssl enc -d -aes-256-cbc -K $KEY -iv $IV -in c2.bin
```

## 3. Falsche Passphrase / Salt

- Falsche Passphrase → `bad decrypt` bzw. Datenmüll (bei CBC meist Padding-Fehler).
- **`-salt`** sorgt dafür, dass gleiche Passphrase+Klartext **verschiedene** Ciphertexts ergeben und verhindert Rainbow-Table-/Vorberechnungs-Angriffe auf die KDF.

## 4. Key-Distribution-Problem

Beide Seiten brauchen **denselben** geheimen Schlüssel. Ihn über einen unsicheren Kanal zu übertragen ist riskant (Abhören). Symmetrische Krypto löst das nicht selbst → man braucht asymmetrischen Key Exchange (DH/RSA, Übung 07) oder einen sicheren Out-of-Band-Austausch.

## Hinweise / Troubleshooting

- Immer `-pbkdf2` nutzen – das alte Default-KDF von `openssl enc` ist schwach.
- Key/IV bei `-K/-iv` als **hex** angeben; IV nicht wiederverwenden (s. Übung 03).
- `openssl enc` liefert **keine** Authentifizierung (CBC) → Manipulation unbemerkt; dafür GCM/HMAC (Übungen 03/06).
