# Übung 08 – VPN-Härtung: PFS, Cipher, Kill Switch

**Schwierigkeit: 8/10 · Dauer: ca. 80 Min.**

## Lernziele

- VPN-Konfigurationen auf moderne, sichere Parameter härten
- Perfect Forward Secrecy und starke Cipher/DH-Gruppen durchsetzen
- Einen Kill Switch und Fail-Closed-Verhalten umsetzen

## Theorie

Ein VPN ist nur so sicher wie seine Konfiguration. Härtungsbausteine:

- **Starke Krypto / AEAD:** AES-256-GCM oder ChaCha20-Poly1305; **SHA-2**; keine schwachen Cipher/Hashes.
- **PFS:** ephemere DH/ECDH (starke DH-Gruppen 19/20/21 bzw. WireGuards eingebaute Curve25519) → kompromittierter Langzeitschlüssel entschlüsselt alten Verkehr nicht (`cryptography-basics` 07).
- **Moderne Protokolle:** IKEv2 statt IKEv1, TLS 1.2/1.3, kein Aggressive Mode; `tls-crypt` (OpenVPN) gegen Scans/DoS.
- **Auth:** Zertifikate statt reiner PSK; Zert-Zweck prüfen (`remote-cert-tls`); CRL/Revocation.
- **Kill Switch / Fail-Closed:** fällt der Tunnel aus, darf **kein** Verkehr ungeschützt rausgehen (Firewall-Regel/Routing), v. a. bei Full-Tunnel.
- **Least Privilege:** Firewall-Regeln am VPN-Interface, nur nötige Ziele; MFA beim Remote-Access-Login.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| WireGuard/OpenVPN/IPsec-Config | Proposals/Cipher/PFS |
| `testssl.sh`/`nmap` | OpenVPN-TLS prüfen (indirekt) |
| nftables/OPNsense-Regeln | Kill Switch |

## Lab-Setup

- Ein funktionierendes VPN (Übung 03/04/05). Firewall-Zugriff für Kill-Switch-Regeln.

## Aufgabe (selbst lösen)

1. Härte deine VPN-Config: setze **AEAD-Cipher**, **SHA-2**, **PFS/starke DH-Gruppe**, moderne Protokollversion; entferne schwache Fallbacks. Dokumentiere vorher/nachher.
2. Belege PFS (z. B. ephemere DH in IKE Phase 2 bzw. WireGuards Handshake alle 2 min) und erkläre den Nutzen.
3. Implementiere einen **Kill Switch**: bei Tunnel-Ausfall darf der Client (Full-Tunnel) **nicht** am VPN vorbei ins Internet.
4. Prüfe die Auth-Härtung: Zertifikate statt PSK, `remote-cert-tls`, CRL aktiv, MFA fürs VPN-Login (konzeptionell/Anbindung `authentication`).

**Ziel:** eine gehärtete VPN-Konfiguration (AEAD/PFS/moderne Protokolle) + funktionierender Kill Switch + Auth-Härtung dokumentiert.

## SY0-701 Prüfungsbezug

- **3.0/1.0** secure VPN configuration, PFS, strong ciphers, IKEv2/TLS1.3, fail-closed/kill switch, certificate auth.
- Begriffe: *PFS*, *AEAD (GCM/ChaCha20)*, *DH group*, *IKEv2*, *tls-crypt*, *kill switch/fail-closed*, *remote-cert-tls*.
