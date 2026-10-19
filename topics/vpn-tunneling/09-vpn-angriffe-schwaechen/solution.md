# Lösung – Übung 09: VPN-Angriffe & Schwächen

Nur gegen **eigene** Lab-Tunnel. Für jede Schwäche: Nachweis → Fix.

## 1. IKEv1 Aggressive Mode / PSK

```bash
sudo ike-scan -A -M <gateway>        # Aggressive Mode -> Gateway sendet Hash
sudo ike-scan -A --pskcrack=psk.txt <gateway>
psk-crack -d /usr/share/wordlists/rockyou.txt psk.txt   # offline crack
```
- Schwäche: der PSK-Hash ist offline brute-forcebar. **Fix:** **IKEv2** + **Zertifikats-Auth**, kein Aggressive Mode, starke DH-Gruppe.

## 2. DNS-/IPv6-Leak

```bash
# DNS: ohne gepushten Resolver gehen Anfragen am Tunnel vorbei (Übung 06)
dig +short whoami.akamai.net
# IPv6: Tunnel nur IPv4 -> IPv6-Verkehr direkt:
curl -6 https://ifconfig.co        # zeigt echte IPv6 statt VPN
```
**Fix:** internen DNS pushen (`DNS=`/`dhcp-option DNS`); IPv6 in den Tunnel aufnehmen (`AllowedIPs ::/0`) **oder** IPv6 am Client/Killswitch blockieren.

## 3. Weak Cipher/Protokoll

- OpenVPN mit `cipher BF-CBC`/`tls-version-min 1.0` oder IPsec mit 3DES/DH2/MD5 → schwach.
```bash
testssl.sh --starttls ... / openssl s_client ...   # bzw. ipsec statusall zeigt Proposal
```
**Fix:** AES-256-GCM/ChaCha20, SHA-2, DH 19/20, TLS1.2/1.3, IKEv2 (Übung 08).

## 4. Login ohne MFA/Lockout

```bash
hydra -L users.txt -P rockyou.txt <vpn-login-endpoint>   # eigener Test-Login
```
- Ohne MFA/Lockout: Spraying erfolgreich. **Fix:** **MFA** (RADIUS/TOTP, `authentication`), Account-Lockout/Rate-Limit, besser **Zertifikats-Auth** (kein Passwort).

## Hinweise / Troubleshooting

- `ike-scan`/Angriffe nur gegen eigene Gateways; sonst illegal.
- PPTP/L2TP-only grundsätzlich abschalten – nicht „nachbessern".
- IPv6-Leaks werden oft übersehen (Dual-Stack-Clients) → explizit testen.
- Nach jedem Fix erneut testen (Regressionsnachweis).
