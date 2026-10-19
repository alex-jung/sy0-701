# Übung 10 – Capstone: sicheres Remote-Access-VPN + Review

**Schwierigkeit: 10/10 · Dauer: ca. 3–4 Std.**

## Lernziele

- Ein vollständiges, gehärtetes Remote-Access-VPN produktionsnah aufbauen
- Zugriff nach Least Privilege segmentieren und überwachen
- Das VPN prüfen (Leaks/Härtung) und einen Review-Report schreiben

## Theorie

Dieses Capstone kombiniert alles: ein **Remote-Access-VPN** (WireGuard oder OpenVPN) über OPNsense, mit **starker Auth** (Zertifikate + MFA, Anbindung `authentication`/`pki-certificates`), **gehärteter Krypto** (AEAD/PFS), **Least-Privilege-Firewall** (nur definierte interne Ziele), korrektem **DNS/Split-Tunnel-Design**, **Kill Switch** und **Monitoring/Logging** (Anbindung `logging-siem`). Abschließend ein **Review** (Leaks, Härtung, Zugriff) mit `vpn-review-template.md`.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| OPNsense + WireGuard/OpenVPN | VPN-Gateway |
| openssl/PKI + RADIUS/TOTP | Auth (Zert + MFA) |
| tcpdump/wireshark, testssl, ike-scan | Review/Leaks |
| OPNsense-Logs/SIEM | Monitoring |

## Lab-Setup

- OPNsense als Gateway, ein externer Client, mehrere interne Ziele mit **unterschiedlicher** Sensitivität; SIEM aus `logging-siem` (optional).

## Aufgabe (selbst lösen)

Baue und dokumentiere ein sicheres Remote-Access-VPN:

1. **Aufbau:** Remote-Access-Tunnel über OPNsense, Tunnel-Netz + Client-Peer(s); gehärtete Krypto (AEAD/PFS/moderne Protokollversion).
2. **Auth:** Zertifikats- bzw. Public-Key-Auth **und** MFA fürs Login (konzeptionell über RADIUS/TOTP); CRL/Revocation vorgesehen.
3. **Zugriff (Least Privilege):** Firewall-Regeln so, dass der VPN-Client **nur** definierte interne Ziele erreicht (nicht das ganze LAN); begründe Split vs. Full + DNS.
4. **Resilienz:** Kill Switch/Fail-Closed; sinnvolles DNS; kein IPv6-/DNS-Leak (nachgewiesen).
5. **Monitoring:** Handshakes/Verbindungen werden geloggt (OPNsense/SIEM); definiere eine Alarmidee (z. B. Login aus unerwartetem Land/Zeit).
6. **Review:** fülle `vpn-review-template.md` aus (Architektur, Krypto/Proposals, Auth, Zugriffsmatrix, Leak-Tests, Findings, Empfehlungen).

**Ziel:** ein produktionsnahes, gehärtetes Remote-Access-VPN (starke Auth, Least Privilege, kein Leak, Monitoring) + ein vollständiger Review-Report.

## SY0-701 Prüfungsbezug

- **3.0/4.0/1.0** kombiniert: secure remote access, VPN-Härtung, PKI/MFA, Segmentierung/Least Privilege, Monitoring, PFS.
- Prüfungsnah: Architektur begründen, Schwächen/Leaks erkennen, Zugriff nach Least Privilege gestalten.
- Begriffe: *remote access VPN*, *certificate+MFA auth*, *least privilege*, *split/full tunnel*, *kill switch*, *PFS*, *monitoring*.
