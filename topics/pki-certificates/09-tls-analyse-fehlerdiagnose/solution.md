# Lösung – Übung 09: TLS-Fehlerdiagnose

Für jeden Fehler: **Symptom → Diagnose → Ursache → Fix**.

## 1. Incomplete chain
- Symptom: Browser ok (cached), aber `curl`/andere Clients: „unable to get local issuer certificate".
- Diagnose: `openssl s_client -connect host:443 -showcerts` → nur **ein** Zert in der Ausgabe.
- Ursache: Server liefert Intermediate nicht.
- Fix: **fullchain** (Leaf+Intermediate) ausliefern (`ssl_certificate` = fullchain).

## 2. Hostname mismatch
- Symptom: `curl`: „subjectAltName does not match host".
- Diagnose: `openssl s_client -servername falsch.lab ...`; `openssl x509 -ext subjectAltName`.
- Ursache: angefragter Name nicht im SAN.
- Fix: Zert mit korrektem SAN neu ausstellen (Übung 07).

## 3. Expired / not yet valid
- Symptom: „certificate has expired" (Verify 10) bzw. „not yet valid" (9).
- Diagnose: `openssl x509 -noout -dates`; Systemzeit prüfen (`date`, NTP!).
- Ursache: `notAfter` überschritten **oder** falsche Client-Uhr.
- Fix: Zert erneuern **oder** Zeit/NTP korrigieren.

## 4. Revoked
- Symptom: „certificate revoked".
- Diagnose: `openssl verify -crl_check -CAfile ca_and_crl.pem cert.pem` bzw. OCSP-Abfrage (Übung 08).
- Ursache: Serial steht auf CRL/OCSP = revoked.
- Fix: neues Zert ausstellen; altes bleibt (korrekt) widerrufen.

## 5. Weak protocol/cipher
- Diagnose: `testssl.sh https://host` oder `nmap --script ssl-enum-ciphers -p 443 host`.
- Findings: TLS 1.0/1.1 aktiv, RC4/3DES, kein ECDHE (kein PFS).
- Fix: nur TLS 1.2/1.3, AEAD-Suiten, ECDHE; alte Protokolle/Ciphers deaktivieren.

## Verify-Return-Codes (Spickzettel)
- 0 ok · 9 not yet valid · 10 expired · 18 self-signed (leaf) · 19 self-signed in chain · 20 unable to get local issuer · 21 unable to verify leaf · 23 revoked.

## Hinweise / Troubleshooting

- Browser cachen Intermediates → „geht im Browser, nicht per curl" ist klassisch (Fehler 1).
- Immer zuerst `-servername` (SNI) korrekt setzen, sonst falsches Vhost-Zert.
- Zeit/NTP ist überraschend oft die Ursache bei „expired/not yet valid".
