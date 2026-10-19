# Lösung – Übung 04: Encryption in Transit (TLS)

## 1. HTTP-Klartext

```bash
sudo tcpdump -ni any -A tcp port 80 &
curl -d "user=alex&pass=geheim" http://testserver/login
# -> Credentials erscheinen im Klartext im Capture
```

## 2. HTTPS/TLS

```bash
sudo tcpdump -ni any tcp port 443 &
curl --cacert ca.pem -d "user=alex&pass=geheim" https://testserver/login
# -> nur TLS-Records/Handshake sichtbar; kein lesbarer Payload
```
Sichtbar bleiben: Ziel-IP/Port, TLS-Handshake, (ohne ECH) SNI – der **Inhalt** nicht.

## 3. TLS-Qualität

```bash
testssl.sh https://testserver
openssl s_client -connect testserver:443 -CAfile ca.pem </dev/null | grep -E "Protocol|Cipher|Verify"
```
Soll: **TLS 1.2/1.3**, AEAD-Cipher (AES-GCM/ChaCha20), **ECDHE (PFS)**, gültiges Zertifikat (Verify 0). Kein SSLv3/TLS1.0/RC4.

## 4. mTLS & HSTS

- **mTLS:** beide Seiten weisen ein Zertifikat vor → gegenseitige Authentifizierung; ideal für **Service-zu-Service**/Zero-Trust (nur berechtigte Clients).
- **HSTS:** Header, der Browser zwingt, die Seite **nur** über HTTPS aufzurufen → verhindert Downgrade/SSL-Strip. Einsatz: öffentliche Web-Dienste.

## Hinweise / Troubleshooting

- „Verschlüsselt" ≠ „sicher": alte Version/schwache Cipher bringen wenig → Qualität prüfen (Übung `cryptography-basics` 09).
- Metadaten bleiben sichtbar → Datenschutz-Grenze von TLS.
- Interne Dienste auch verschlüsseln (nicht nur Perimeter) → Zero Trust/Ost-West.
