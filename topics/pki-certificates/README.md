# Thema: PKI & Certificates

Praxis-Übungen zur **Public Key Infrastructure (PKI)** und **X.509-Zertifikaten**: eine eigene Root- und Intermediate-CA aufbauen, CSRs erstellen/signieren, TLS-Server betreiben, Certificate Chains, SAN/Extensions, Revocation (CRL/OCSP) und TLS-Fehlerdiagnose. Aufbauend auf `cryptography-basics` (asymmetrisch, Signaturen) und Grundlage für `vpn-tunneling`, `authentication` und TLS in `web-exploitation`.

> ⚠️ **Lab-/Lern-CA.** Die hier gebaute CA ist **nur** fürs eigene Lab. Niemals produktiv/öffentlich einsetzen. Private Keys (v. a. CA-Keys) schützen und **nie** committen (`.gitignore`). Keine Zertifikate für fremde Domains ausstellen.

## Lernziele

- X.509-Zertifikate lesen und ihre Felder/Extensions verstehen
- Eine eigene **Root-CA** und **Intermediate-CA** aufbauen
- CSRs erzeugen und signieren; Certificate Chains korrekt bilden
- TLS-Server mit eigenem Zertifikat betreiben und Trust prüfen
- SAN, Key Usage/EKU, Constraints richtig setzen
- Revocation (CRL/OCSP) umsetzen und TLS-Probleme diagnostizieren

## Abgedeckte SY0-701-Domänen

- **1.0 General Security Concepts** – PKI, public/private key, certificates, CA, digital signatures, key escrow
- **3.0 Security Architecture** – TLS/Transport-Sicherheit, Trust Models, Certificate Lifecycle

## Übungen (Schwierigkeit 1 → 10)

| #  | Übung | Schwierigkeit |
|----|-------|---------------|
| 01 | X.509 & Zertifikate verstehen | 1/10 |
| 02 | Self-signed Zertifikat erstellen | 2/10 |
| 03 | Eigene Root-CA aufbauen | 3/10 |
| 04 | CSR erstellen & von der CA signieren | 4/10 |
| 05 | TLS-Server betreiben & mit s_client prüfen | 5/10 |
| 06 | Certificate Chains & Intermediate CA | 6/10 |
| 07 | SAN, Key Usage & Extensions | 7/10 |
| 08 | Revocation: CRL & OCSP | 8/10 |
| 09 | TLS-Analyse & Fehlerdiagnose | 9/10 |
| 10 | Capstone: vollständige interne PKI | 10/10 |

## Lab-Voraussetzungen

- Kali/Linux mit `openssl` (zentral), optional `nginx`/`openssl s_server`, `curl`, `testssl.sh`, `nmap`
- Optional: eine zweite VM/der Browser als „Client", um Trust-Stores zu testen
- Kein spezielles Netz nötig; Übungen 05/09/10 profitieren von einem kleinen Test-Webserver

Reihenfolge: starte bei `01-x509-zertifikate-verstehen/`. Pro Übung erst die `.md` lösen, dann `solution.md`.
