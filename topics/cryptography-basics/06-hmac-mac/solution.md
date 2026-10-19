# Lösung – Übung 06: HMAC

## 1./2. HMAC berechnen

```bash
echo "API-Request-Body" > req.txt
openssl dgst -sha256 -hmac "supergeheimerKey" req.txt
# Datei ändern -> anderer HMAC
echo x >> req.txt
openssl dgst -sha256 -hmac "supergeheimerKey" req.txt
# falscher Key -> anderer HMAC (verifiziert nicht)
openssl dgst -sha256 -hmac "falscherKey" req.txt
```
Nur mit demselben geheimen Key ergibt sich derselbe Tag → ein Angreifer ohne Key kann keinen gültigen HMAC fälschen (anders als bei reinem Hash).

## 3. Timing-sicherer Vergleich (Python)

```python
import hmac, hashlib
def tag(msg, key): return hmac.new(key, msg, hashlib.sha256).digest()
def verify(msg, key, t): return hmac.compare_digest(tag(msg, key), t)
```
`compare_digest` vergleicht in **konstanter Zeit**, unabhängig davon, ab welchem Byte es abweicht. Ein normaler `==`-Vergleich bricht beim ersten ungleichen Byte ab → messbare Laufzeitunterschiede erlauben einen **Timing-Angriff**, mit dem der korrekte Tag byteweise erraten werden kann.

## 4. Vergleichstabelle

| Mechanismus | Integrity | Authentication | Non-Repudiation | Key |
|-------------|-----------|----------------|-----------------|-----|
| Hash | ✅ | ❌ | ❌ | keiner |
| HMAC | ✅ | ✅ | ❌ (Shared Key) | symmetrisch |
| Digitale Signatur | ✅ | ✅ | ✅ | asymmetrisch |

## Hinweise / Troubleshooting

- HMAC gibt **keine** Non-Repudiation: beide Parteien besitzen den Key → nicht gerichtsfest „wer war's".
- Encrypt-then-MAC: erst verschlüsseln, dann HMAC über den Ciphertext → ergänzt CBC um Integrität (GCM macht beides in einem).
- Key-Länge/Qualität zählt: HMAC-Key sollte zufällig und ausreichend lang sein.
