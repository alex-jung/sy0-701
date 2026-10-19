# Lösung – Übung 10: Remote-Access-VPN (Capstone)

Muster-Lösungspfad; viele Varianten korrekt. Entscheidend: starke Auth + Least Privilege + keine Leaks + Monitoring + Review.

## 1. Aufbau
- WireGuard/OpenVPN über OPNsense (Übung 03/04), gehärtete Krypto (Übung 08): AEAD, PFS, IKEv2/TLS1.3 bzw. WireGuard-Default.

## 2. Auth
- OpenVPN: Zertifikats-Auth (eigene CA, `remote-cert-tls`, CRL) + **MFA** (OpenVPN+RADIUS/TOTP) — oder WireGuard-Key + vorgelagertes MFA-Portal.
- Revocation vorgesehen (CRL/kurzlebige Zerts).

## 3. Least Privilege
- Firewall am VPN-Interface: `pass` nur `VPN-Clients → {App-Server:443, DNS:53}`; alles andere `block/log`.
- Zugriffsmatrix dokumentiert (welcher Client/Rolle → welche Ziele).
- Split-Tunnel für interne Ziele + internes DNS (Übung 06); Full-Tunnel nur wenn zentrale Filterung gewünscht.

## 4. Resilienz
- Kill Switch (nftables/OPNsense PBR, Übung 08); DNS gepusht; IPv6-/DNS-Leak getestet und **negativ** (kein Leak).

## 5. Monitoring
- OPNsense-Logs (Handshakes/Verbindungen) → SIEM (`logging-siem`).
- Alarmidee: VPN-Login außerhalb Geschäftszeiten / aus untypischem Land / viele Fehlversuche (Spraying).

## 6. Review
`vpn-review-template.md`: Architektur-Diagramm, Proposals/Krypto, Auth (Zert+MFA/CRL), Zugriffsmatrix, Leak-Tests (DNS/IPv6), Findings + Empfehlungen (z. B. Full-Tunnel für Admins, FIDO2 fürs MFA, Monitoring-Regeln schärfen).

## Bewertungs-Checkliste
- [ ] Gehärtete Krypto (AEAD + PFS + moderne Protokollversion)
- [ ] Zert-/Key-Auth **und** MFA; Revocation vorgesehen
- [ ] Least-Privilege-Firewall (nur definierte Ziele), Zugriffsmatrix
- [ ] Kill Switch + kein DNS-/IPv6-Leak (nachgewiesen)
- [ ] Verbindungen geloggt/monitort, Alarmidee definiert
- [ ] Review-Template vollständig

## Häufige Fehler / Troubleshooting
- VPN gibt Zugriff aufs **ganze** LAN (kein Least Privilege) → häufigste reale Schwäche.
- MFA „geplant", aber nicht erzwungen; PSK statt Zertifikaten.
- DNS-/IPv6-Leak nicht getestet; Kill Switch fehlt (Leak bei Tunnelabbruch).
- Kein Monitoring → kompromittierter VPN-Zugang bleibt unbemerkt.
