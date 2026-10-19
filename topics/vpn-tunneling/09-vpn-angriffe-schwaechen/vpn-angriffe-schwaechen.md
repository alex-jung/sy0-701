# Übung 09 – VPN-Angriffe & Schwächen

**Schwierigkeit: 9/10 · Dauer: ca. 85 Min.**

## Lernziele

- Typische VPN-Schwächen und -Angriffe erkennen (nur im eigenen Lab)
- Deprecated Protokolle/Modi und Fehlkonfigurationen bewerten
- Leaks (DNS/IPv6), Downgrade und Credential-Angriffe einordnen

## Theorie

VPN-Risiken (prüfungs- und praxisrelevant):

- **Deprecated Protokolle:** **PPTP** (gebrochen, MS-CHAPv2), **L2TP ohne IPsec**, **SSLv3/TLS1.0**, 3DES/DES, DH-Gruppe 1/2 → angreifbar.
- **IKEv1 Aggressive Mode + PSK:** sendet einen Hash, der **offline** crackbar ist (ike-scan/`psk-crack`).
- **Fehlende Zert-Validierung / schwache Auth:** reine PSK, kein `remote-cert-tls`, kein CRL → MITM/Weiterverwendung widerrufener Zerts.
- **Leaks:** **DNS-Leak** (Übung 06), **IPv6-Leak** (Tunnel nur IPv4, IPv6 geht vorbei), WebRTC-Leak (Browser).
- **Credential-Angriffe:** Brute-Force gegen VPN-Login ohne MFA/Lockout (Spraying).
- **Kein PFS:** späterer Key-Leak entschlüsselt aufgezeichneten Verkehr.
- **Endpoint-Kompromittierung / Split-Tunnel-Pivot.**

Ziel der Übung: eigene (absichtlich schwache) Konfiguration analysieren, Schwäche belegen, Fix anwenden.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `ike-scan` | IKEv1/Aggressive-Mode + PSK-Hash |
| `tcpdump`/`wireshark` | Leaks/Protokoll prüfen |
| `hydra` (Lab) | VPN-Login-Spraying demonstrieren |
| `testssl.sh` | OpenVPN-TLS/Weak-Cipher |

## Lab-Setup

- Eigene VPN-Endpunkte, teils bewusst **schwach** konfiguriert zum Üben. Nur gegen **eigene** Tunnel.

## Aufgabe (selbst lösen)

Demonstriere und behebe mindestens **drei** Schwächen an deinem eigenen Lab-VPN:

1. **IKEv1 Aggressive Mode/PSK:** zeige mit `ike-scan`, dass ein PSK-Hash abgreifbar ist; Fix: IKEv2 + Zertifikate.
2. **DNS- und/oder IPv6-Leak:** weise nach, dass Anfragen am Tunnel vorbeigehen; Fix: internen DNS pushen, IPv6 im Tunnel/Killswitch behandeln.
3. **Weak Cipher/Protokoll:** finde eine schwache OpenVPN-/IPsec-Einstellung (z. B. 3DES/DH2/TLS1.0) und härte sie.
4. **Login ohne MFA/Lockout:** demonstriere Credential-Spraying gegen einen eigenen VPN-Login und zeige die Abwehr (MFA/Lockout/Zertifikate).

**Ziel:** mindestens drei VPN-Schwächen praktisch belegt und jeweils mit einem konkreten Fix gehärtet.

## SY0-701 Prüfungsbezug

- **2.0/3.0** deprecated protocols (PPTP/L2TP-only), IKEv1 aggressive mode, DNS/IPv6 leaks, weak ciphers, missing MFA.
- Gegenmaßnahmen: IKEv2, Zert-Auth, PFS, AEAD, internal DNS, MFA/Lockout, kill switch.
- Begriffe: *PPTP/MS-CHAPv2*, *aggressive mode PSK*, *DNS/IPv6 leak*, *downgrade*, *credential spraying*, *PFS*.
