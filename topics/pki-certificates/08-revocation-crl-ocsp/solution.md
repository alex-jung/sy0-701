# Lösung – Übung 08: Revocation (CRL & OCSP)

## 1. Widerruf + CRL

(Setzt `openssl.cnf` mit `[ CA_default ]`, `database=index.txt`, `crlnumber` voraus.)
```bash
cd ~/lab-ca
openssl ca -config openssl.cnf -revoke app.cert.pem -crl_reason keyCompromise
openssl ca -config openssl.cnf -gencrl -out crl/lab.crl.pem
openssl crl -in crl/lab.crl.pem -noout -text   # zeigt Serial + Revocation Date + Reason
```

## 2. Gegen CRL prüfen

```bash
cat certs/ca.cert.pem crl/lab.crl.pem > ca_and_crl.pem
openssl verify -crl_check -CAfile ca_and_crl.pem app.cert.pem
# vor Widerruf: OK ; nach Widerruf: "certificate revoked"
```

## 3. OCSP

Responder (Lab):
```bash
openssl ocsp -port 8888 -index index.txt -CA certs/ca.cert.pem \
  -rkey private/ca.key.pem -rsigner certs/ca.cert.pem -text
```
Abfrage (zweites Terminal):
```bash
openssl ocsp -CAfile certs/ca.cert.pem -issuer certs/ca.cert.pem \
  -cert app.cert.pem -url http://127.0.0.1:8888 -resp_text | grep -E "Cert Status"
# "Cert Status: revoked" (bzw. "good" für ein gültiges Zert)
```

## 4. CRL vs OCSP vs Stapling

| Mechanismus | Prinzip | Vorteil | Nachteil |
|-------------|---------|---------|----------|
| CRL | signierte Liste aller Widerrufe | einfach, offline cachebar | groß, verzögert aktuell |
| OCSP | Live-Abfrage pro Zert | aktuell, klein | Latenz, Privacy (Responder sieht Abrufe), Verfügbarkeit |
| OCSP Stapling | Server liefert OCSP-Antwort im Handshake mit | keine Client→Responder-Abfrage, Privacy/Perf | Server-Konfig nötig |

## Hinweise / Troubleshooting

- **Fail-open:** viele Clients akzeptieren ein Zert, wenn CRL/OCSP **nicht erreichbar** ist → Revocation ist nicht garantiert wirksam (daher kurze Laufzeiten + Stapling).
- `openssl ca`-Befehle brauchen passende `openssl.cnf` (Pfade/`database`/`crlnumber`).
- CRL muss regelmäßig **neu** erzeugt werden (nextUpdate), sonst „expired CRL".
