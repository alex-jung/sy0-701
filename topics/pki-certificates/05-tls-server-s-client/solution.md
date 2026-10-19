# Lösung – Übung 05: TLS-Server & s_client

## 1. Server starten

Quick-Test:
```bash
openssl s_server -cert www.cert.pem -key www.key.pem -accept 4443 -www
```
Oder nginx (Vhost):
```nginx
server {
  listen 443 ssl;
  server_name www.server.lab;
  ssl_certificate     /path/www-fullchain.pem;   # Server + Intermediate!
  ssl_certificate_key /path/www.key.pem;
  ssl_protocols TLSv1.2 TLSv1.3;
}
```

## 2. Ohne CA

```bash
openssl s_client -connect 127.0.0.1:4443 -servername www.server.lab </dev/null
# ... Verify return code: 19 (self signed certificate in chain) / 20 (unable to get local issuer)
```
Der Client kennt die ausstellende CA nicht → Kette nicht verifizierbar.

## 3. Mit CA

```bash
openssl s_client -connect 127.0.0.1:4443 -servername www.server.lab \
  -CAfile ~/lab-ca/certs/ca.cert.pem </dev/null | grep -E "Verify return code|Protocol|Cipher"
# Verify return code: 0 (ok); Protocol: TLSv1.3; Cipher: TLS_AES_256_GCM_SHA384
```

## 4. curl

```bash
echo "127.0.0.1 www.server.lab" | sudo tee -a /etc/hosts
curl --cacert ~/lab-ca/certs/ca.cert.pem https://www.server.lab:4443/   # OK
curl https://www.server.lab:4443/                                       # Fehler: self-signed/unknown CA
# (Lab-Notnagel: curl -k ignoriert Prüfung – niemals produktiv!)
```

## Hinweise / Troubleshooting

- **„unable to get local issuer":** Server sendet Intermediate nicht mit → **fullchain** (Server+Intermediate) ausliefern (Übung 06).
- **Hostname-Mismatch:** `-servername`/URL muss zum SAN passen, sonst Name-Validation-Fehler.
- `-k`/`--insecure` nur zum Debuggen; es hebelt den gesamten Trust aus.
