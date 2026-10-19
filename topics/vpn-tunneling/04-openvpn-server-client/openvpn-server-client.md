# Übung 04 – OpenVPN Server/Client

**Schwierigkeit: 4/10 · Dauer: ca. 80 Min.**

## Lernziele

- OpenVPN als TLS-/zertifikatsbasiertes VPN aufsetzen
- Die PKI-Anbindung (CA, Server-/Client-Zerts) verstehen
- Server- und Client-Config lesen und absichern

## Theorie

**OpenVPN** ist ein **SSL/TLS-VPN**: der Tunnel wird über TLS aufgebaut, Authentifizierung meist via **PKI** (eigene CA signiert Server- und Client-Zertifikate; optional zusätzlich Username/Passwort und **tls-auth/tls-crypt** gegen DoS/Scans). Läuft über **UDP** (performant) oder **TCP 443** (firewall-/proxy-freundlich, „sieht aus wie HTTPS"). TUN (Layer 3, Routing) vs. TAP (Layer 2, Bridging).

Das knüpft direkt an `pki-certificates` an: man braucht eine CA, ein Server-Zert (`serverAuth`) und je Client ein Zert (`clientAuth`). Widerruf über **CRL**. Moderne Config: AES-GCM, `tls-crypt`, `remote-cert-tls`, starke DH/ECDH.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `openvpn` | Server/Client |
| `easy-rsa`/`openssl` | PKI (CA, Zerts, CRL) |
| OPNsense (optional) | OpenVPN per GUI |

## Lab-Setup

- Ein Server-Host (oder OPNsense), ein Client; `openvpn`, `easy-rsa`. CA aus `pki-certificates` nutzbar.

## Aufgabe (selbst lösen)

1. Baue eine (Easy-RSA-)PKI: CA, Server-Zert (`serverAuth`), ein Client-Zert (`clientAuth`), DH/`tls-crypt`-Key.
2. Konfiguriere einen OpenVPN-**Server** (TUN, `10.8.0.0/24`, AES-GCM, `remote-cert-tls client`) und starte ihn.
3. Erzeuge eine **Client-Config** (inline certs/key) und verbinde dich; pinge die Server-Tunnel-IP.
4. **Widerrufe** das Client-Zert (CRL) und zeige, dass der Client danach **nicht** mehr verbinden darf.

**Ziel:** ein funktionierendes OpenVPN (zertifikatsbasiert) mit erfolgreichem Login **und** nachgewiesenem Revoke über CRL.

## SY0-701 Prüfungsbezug

- **3.0** SSL/TLS VPN, OpenVPN, certificate-based auth, PKI, CRL; TUN/TAP, UDP/TCP 443.
- Verknüpfung `pki-certificates` (CA/CRL) und `cryptography-basics` (TLS/AEAD).
- Begriffe: *OpenVPN*, *TLS-VPN*, *easy-rsa/PKI*, *tls-crypt*, *remote-cert-tls*, *CRL*, *TUN/TAP*.
