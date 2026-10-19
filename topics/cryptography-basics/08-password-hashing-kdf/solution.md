# Lösung – Übung 08: Password Hashing & KDFs

## 1. bcrypt + argon2id

```bash
openssl passwd -5 "P@ssw0rt!"         # sha512crypt ($5/$6 je nach Version)
# bcrypt via python:
python3 -c 'import bcrypt;print(bcrypt.hashpw(b"P@ssw0rt!",bcrypt.gensalt(12)).decode())'
# argon2id:
python3 -c 'from argon2 import PasswordHasher as P;print(P().hash("P@ssw0rt!"))'
```
Format bcrypt: `$2b$12$<22-Zeichen-Salt><31-Zeichen-Hash>` → `2b`=Variante, `12`=cost. 
Argon2: `$argon2id$v=19$m=65536,t=3,p=4$<salt>$<hash>` → m=memory, t=iterations, p=parallelism.

## 2. Salt → unterschiedliche Hashes

```bash
python3 -c 'import bcrypt;[print(bcrypt.hashpw(b"gleich",bcrypt.gensalt()).decode()) for _ in range(2)]'
```
Zwei verschiedene Ausgaben (verschiedene Salts). `bcrypt.checkpw(pw, hash)` verifiziert beide, weil der Salt im Hash-String steckt.

## 3. Work Factor / Zeit

```bash
for c in 10 12 14; do /usr/bin/time -f "cost=$c %es" \
 python3 -c "import bcrypt;bcrypt.hashpw(b'x',bcrypt.gensalt($c))"; done
```
Jede +1 beim bcrypt-cost **verdoppelt** die Zeit. Ziel: so hoch wie möglich, solange ein Login spürbar < ~0,5–1 s bleibt. Argon2: m/t/p nach OWASP-Empfehlung (z. B. m=19–64 MiB). Trade-off: höhere Kosten = teurer für Angreifer **und** Server.

## 4. Angriffsgeschwindigkeit

```bash
hashcat -b -m 1400     # SHA-256: Milliarden H/s auf GPU
hashcat -b -m 3200     # bcrypt: nur ~ Tausende H/s
hashcat -b -m 34000    # argon2 (sehr langsam/teuer)
```
SHA-256 ist um **Größenordnungen** schneller angreifbar → als Passwort-Speicher ungeeignet. bcrypt/argon2 sind absichtlich langsam/speicherhart → Brute-Force wird unwirtschaftlich. Empfehlung heute: **argon2id** (sonst bcrypt), immer mit Salt, ggf. Pepper.

## Hinweise / Troubleshooting

- Salt **nicht** geheim (steht im Hash); Pepper schon (separat/HSM).
- PBKDF2 ist FIPS-konform, aber GPU-freundlicher als argon2/scrypt → wenn möglich argon2id.
- `argon2-cffi`/`bcrypt` via `pip install argon2-cffi bcrypt`.
- Work Factor regelmäßig an neue Hardware anpassen (Hashes sind re-hashbar beim nächsten Login).
