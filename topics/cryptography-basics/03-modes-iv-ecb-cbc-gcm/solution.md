# Lösung – Übung 03: Modes & IV

## 1. ECB vs CBC

```bash
openssl enc -aes-256-ecb -nosalt -K $(openssl rand -hex 32) -in gross.bin -out ecb.bin
openssl enc -aes-256-cbc -nosalt -K $(openssl rand -hex 32) -iv $(openssl rand -hex 16) -in gross.bin -out cbc.bin
```
Bei ECB erzeugen identische 16-Byte-Klartextblöcke identische Cipherblöcke → wiederkehrende Muster/Strukturen bleiben erkennbar. CBC verkettet Blöcke → keine sichtbaren Muster.

## 2. ECB-Pinguin

```bash
convert pinguin.png -depth 8 pinguin.ppm        # Pixel-Format
head -c 60 pinguin.ppm > header; tail -c +61 pinguin.ppm > body
openssl enc -aes-128-ecb -nosalt -K 00112233445566778899aabbccddeeff -in body -out body.ecb
cat header body.ecb > ecb.ppm                   # Header behalten, Bilddaten ersetzt
# body mit CBC analog -> cbc.ppm
```
`ecb.ppm`: Umriss des Pinguins bleibt klar sichtbar. `cbc.ppm`: Rauschen. → ECB verrät Struktur.

## 3. GCM + Manipulation

```bash
openssl enc -aes-256-gcm -K $(openssl rand -hex 32) -iv $(openssl rand -hex 24) -in klartext.txt -out gcm.bin 2>/dev/null
# (Hinweis: openssl-CLI-GCM ist umständlich; alternativ Python cryptography AESGCM)
```
Python-Variante zeigt es sauber: ein geflipptes Byte im Ciphertext → `InvalidTag`, Entschlüsselung schlägt fehl. Das ist der **Integritäts-/Authentizitätsschutz** von AEAD.

## 4. IV-Wiederverwendung

- Bei **CBC**: gleicher IV + gleicher Klartextanfang verrät, dass Nachrichten gleich beginnen.
- Bei **CTR/GCM**: Nonce-Reuse ist fatal – der Keystream wiederholt sich, zwei Ciphertexts lassen sich XOR-en (Klartext-Leak), bei GCM wird zusätzlich die Authentisierung brechbar.

## Hinweise / Troubleshooting

- `-nosalt` + explizites `-K` nur zum Demonstrieren – nicht als Praxis-Pattern.
- GCM mit der openssl-CLI ist fummelig; für echte AEAD-Demos Python `cryptography`/`AESGCM` nutzen.
- ECB nie produktiv – in Prüfungsfragen ist ECB fast immer die „falsche/unsichere" Antwort.
