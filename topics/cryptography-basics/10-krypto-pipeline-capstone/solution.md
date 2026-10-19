# Lösung – Übung 10: Krypto-Pipeline (Capstone)

Muster-Lösungspfad; viele korrekte Varianten möglich. Entscheidend: alle vier Schutzziele + saubere Negativtests.

## Senden (Alice) – Skizze

```bash
# Voraussetzung: bob_rsa.pub (Empfänger), alice_sign.pem (Alice Signatur-Priv)
openssl rand -out sk.bin 32
# AES-256-GCM via Python (openssl-CLI-GCM ist umständlich):
python3 - <<'PY'
from cryptography.hazmat.primitives.ciphers.aead import AESGCM
import os
key=open("sk.bin","rb").read(); n=os.urandom(12)
ct=AESGCM(key).encrypt(n, open("datei.txt","rb").read(), None)
open("payload.bin","wb").write(n+ct)
PY
# Session-Key hybrid mit Bobs Public Key (OAEP):
openssl pkeyutl -encrypt -pubin -inkey bob_rsa.pub -pkeyopt rsa_padding_mode:oaep -in sk.bin -out sk.enc
# Signatur über das Paket (payload+sk.enc):
cat payload.bin sk.enc > bundle.bin
openssl dgst -sha256 -sign alice_sign.pem -out bundle.sig bundle.bin
```
Versendet werden: `payload.bin`, `sk.enc`, `bundle.sig` (+ Alices Public Key / aus PKI).

## Empfangen (Bob) – Skizze

```bash
# 1) Signatur zuerst prüfen:
cat payload.bin sk.enc > bundle.bin
openssl dgst -sha256 -verify alice_sign.pub -signature bundle.sig bundle.bin || { echo "SIG FAIL"; exit 1; }
# 2) Session-Key entschlüsseln:
openssl pkeyutl -decrypt -inkey bob_rsa.pem -pkeyopt rsa_padding_mode:oaep -in sk.enc -out sk.dec
# 3) GCM entschlüsseln (Tag-Prüfung):
python3 - <<'PY'
from cryptography.hazmat.primitives.ciphers.aead import AESGCM
d=open("payload.bin","rb").read(); n,ct=d[:12],d[12:]
open("out.txt","wb").write(AESGCM(open("sk.dec","rb").read()).decrypt(n,ct,None))
PY
sha256sum datei.txt out.txt    # identisch
```

## 3. Negativtests (müssen fehlschlagen)

- Ciphertext-Bit kippen → GCM `InvalidTag` / Decrypt-Fehler.
- Signatur-Byte ändern → „Verification Failure", Abbruch **vor** Entschlüsselung.
- Falscher Empfänger-Key → `sk.enc` lässt sich nicht entschlüsseln.

## 4. Bewertung (Kernpunkte)

| Schutzziel | erfüllt durch |
|-----------|---------------|
| Confidentiality | AES-256-GCM + hybrider Key-Transport |
| Integrity | GCM-Tag (+ Signatur über Bundle) |
| Authentication | Alices Signatur |
| Non-Repudiation | Alices Signatur (asymmetrisch) |

Restrisiken: **kein PFS** (RSA-Key-Transport – besser ephemeres ECDH), **Key-Management** (woher kommt Bobs echter Public Key? → PKI/`pki-certificates`), **RNG-Qualität**, Schutz des Private Keys (HSM/Passphrase). Verbesserungen: ECDHE statt RSA-Transport, Zertifikate statt roher Keys, feste Algorithmus-Policy, Versions-/Metadaten im authentifizierten Teil (AAD).

## Bewertungs-Checkliste

- [ ] Alle vier Schutzziele umgesetzt und benannt
- [ ] AEAD (GCM) statt reiner CBC/ECB
- [ ] Hybrid (asymmetrisch nur für Session-Key)
- [ ] Signatur **vor** Entschlüsselung geprüft
- [ ] Alle drei Negativtests schlagen fehl
- [ ] Assessment-Template mit Restrisiken ausgefüllt

## Häufige Fehler / Troubleshooting

- Erst entschlüsseln, dann Signatur prüfen → angreifbar; **immer** zuerst verifizieren.
- ECB/CBC ohne Integrität verwendet → kein Manipulationsschutz.
- Session-Key im Klartext mitgeschickt → ganzer Sinn von „hybrid" verfehlt.
- Private Keys im Repo → `.gitignore` + niemals committen.
