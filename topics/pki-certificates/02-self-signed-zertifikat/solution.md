# Lösung – Übung 02: Self-signed Zertifikat

## 1. Key + self-signed Zertifikat

```bash
openssl req -x509 -newkey rsa:2048 -nodes -keyout server.key \
  -out server.crt -days 365 \
  -subj "/CN=server.lab" \
  -addext "subjectAltName=DNS:server.lab"
```
(`-nodes` = Key ohne Passphrase; für EC: `-newkey ec -pkeyopt ec_paramgen_curve:prime256v1`.)

## 2. Prüfen

```bash
openssl x509 -in server.crt -noout -subject -issuer -ext subjectAltName,basicConstraints
```
**Issuer == Subject** (beides `CN=server.lab`) → self-signed. SAN vorhanden; Basic Constraints meist `CA:FALSE`.

## 3. Verify

```bash
openssl verify -CAfile server.crt server.crt     # "server.crt: OK" (gegen sich selbst)
openssl verify server.crt                         # Fehler: self signed certificate (nicht im Trust Store)
```

## 4. Warum Warnung / Fix

Die Krypto ist gültig, aber **kein Trust Store** kennt dieses „CA"-Zertifikat → der Client kann die Identität nicht bestätigen und warnt. Im Lab behebbar, indem man `server.crt` als vertrauenswürdige CA in den OS-/Browser-Trust-Store importiert – sauberer ist jedoch eine **eigene CA** (Übung 03ff.), die man **einmal** vertraut und die dann alle Server-Zertifikate signiert.

## Hinweise / Troubleshooting

- Ohne `-addext subjectAltName` → moderne Browser lehnen trotz Trust ab („CN nur" reicht nicht).
- Key-Datei (`server.key`) schützen, nie committen.
- `-days` nicht zu lang wählen (Lifecycle/Hygiene).
