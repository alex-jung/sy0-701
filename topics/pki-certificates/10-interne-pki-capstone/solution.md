# Lösung – Übung 10: Interne PKI (Capstone)

Muster-Lösungspfad; Hauptsache die Nachweise (Verify 0, Revocation revoked, Diagnose) stimmen.

## 1. Hierarchie
- Root aus Übung 03 (Key mit Passphrase, `chmod 400`, idealerweise auf separater/Offline-VM).
- Intermediate aus Übung 06 (`CA:TRUE,pathlen:0`, `keyCertSign,cRLSign`, optional `nameConstraints permitted;DNS:.server.lab`).

## 2. Ausstellung
```bash
# Server-Zert (serverAuth, SAN) und Client-Zert (clientAuth) über die Intermediate signieren
# (siehe Übung 06/07; EKU serverAuth bzw. clientAuth setzen)
```

## 3. Deployment
```bash
cat server.cert.pem intermediate.cert.pem > server-fullchain.pem   # nginx ssl_certificate
openssl s_client -connect host:443 -servername app.server.lab -CAfile ca.cert.pem </dev/null | grep "Verify return code"
# -> 0 (ok)
```
Optional mTLS (nginx): `ssl_verify_client on; ssl_client_certificate ca-chain.pem;` → Client muss gültiges Client-Zert vorlegen.

## 4. Revocation
```bash
openssl ca -config openssl.cnf -revoke client.cert.pem -crl_reason keyCompromise
openssl ca -config openssl.cnf -gencrl -out crl/lab.crl.pem
# OCSP-Responder starten + Status abfragen -> "revoked" (Übung 08)
```

## 5. Validierung/Diagnose
- Incomplete chain + hostname mismatch demonstriert/behoben (Übung 09).
- `testssl.sh https://app.server.lab` → nur TLS 1.2/1.3, ECDHE (PFS), AEAD.

## 6. Dokumentation
`pki-design-template.md`: Diagramm Root→Intermediate→Leaf, Rollen (wer stellt aus/widerruft), Key-Schutz (Passphrase/offline/HSM), Laufzeiten (Root 10 J, Intermediate 5 J, Leaf ≤ 397 T), Revocation-Prozess (CRL-Intervall, OCSP), Trust-Verteilung (Root in alle Trust-Stores), Risiken (CA-Key-Compromise, fail-open OCSP).

## Bewertungs-Checkliste
- [ ] Root offline/geschützt, Intermediate mit pathlen:0
- [ ] Server- (serverAuth/SAN) + Client-Zert (clientAuth) ausgestellt
- [ ] fullchain deployed, Verify return code 0; optional mTLS
- [ ] Widerruf via CRL **und** OCSP = revoked nachgewiesen
- [ ] ≥2 Fehlklassen diagnostiziert + behoben; TLS 1.2/1.3 + PFS
- [ ] PKI-Design-Dokument vollständig

## Häufige Fehler / Troubleshooting
- Root online/ungeschützt gelassen → größtes Risiko.
- fullchain vergessen → „unable to get local issuer".
- CRL nicht erneuert (expired) oder OCSP-Responder nicht erreichbar (fail-open).
- Leaf-Laufzeiten zu lang → schlechtere Lifecycle-Hygiene.
