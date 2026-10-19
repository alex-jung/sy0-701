# Lösung – Übung 04: OpenVPN

## 1. PKI (Easy-RSA)

```bash
sudo apt install -y openvpn easy-rsa
make-cadir ~/ovpn-ca && cd ~/ovpn-ca
./easyrsa init-pki
./easyrsa build-ca                       # CA (Passphrase)
./easyrsa build-server-full server nopass
./easyrsa build-client-full client1 nopass
./easyrsa gen-dh
openvpn --genkey secret ta.key           # tls-crypt key
```

## 2. Server-Config

`/etc/openvpn/server.conf`:
```
dev tun
proto udp
port 1194
server 10.8.0.0 255.255.255.0
ca   pki/ca.crt
cert pki/issued/server.crt
key  pki/private/server.key
dh   pki/dh.pem
tls-crypt ta.key
data-ciphers AES-256-GCM
auth SHA256
remote-cert-tls client
crl-verify pki/crl.pem
keepalive 10 120
user nobody
group nogroup
```
```bash
sudo systemctl start openvpn-server@server
```

## 3. Client-Config + Test

`client1.ovpn` (inline):
```
client
dev tun
proto udp
remote <server-ip> 1194
remote-cert-tls server
data-ciphers AES-256-GCM
<ca>...</ca> <cert>...</cert> <key>...</key> <tls-crypt>...</tls-crypt>
```
```bash
sudo openvpn --config client1.ovpn
ping 10.8.0.1
```

## 4. Revoke (CRL)

```bash
cd ~/ovpn-ca
./easyrsa revoke client1
./easyrsa gen-crl
sudo cp pki/crl.pem /etc/openvpn/server/pki/crl.pem
sudo systemctl restart openvpn-server@server
# client1 verbindet nicht mehr: "CRL CHECK FAILED" / TLS error
```

## Hinweise / Troubleshooting

- `crl-verify` muss gesetzt sein, sonst wirkt der Revoke nicht.
- `data-ciphers`/`remote-cert-tls` verhindern Downgrade/falschen Zert-Zweck (Übung 08/09).
- Firewall: UDP 1194 (oder TCP 443) offen; IP-Forwarding + NAT für Zugriff aufs LAN.
- Zeit/Zertifikatsgültigkeit prüfen (wie TLS, `pki-certificates` 09).
