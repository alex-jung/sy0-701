# Übung 04 – CSR erstellen & von der CA signieren

**Schwierigkeit: 4/10 · Dauer: ca. 60 Min.**

## Lernziele

- Einen Certificate Signing Request (CSR) erzeugen
- Den CSR mit der eigenen CA signieren → gültiges Server-Zertifikat
- Den Ablauf Key→CSR→Signatur→Cert und die Rolle der Felder verstehen

## Theorie

Ein **CSR (Certificate Signing Request)** ist ein Antrag an die CA: Der Antragsteller erzeugt ein **Schlüsselpaar**, packt den **Public Key** + gewünschte Identität (Subject, SAN) in den CSR und **signiert** ihn mit dem eigenen **Private Key** (Proof of Possession). Der Private Key **verlässt den Server nie**. Die CA prüft den Antrag und stellt – wenn ok – ein von ihr **signiertes** Zertifikat aus.

Ablauf: `Key` → `CSR` → CA signiert → `Zertifikat`. Die CA bestimmt dabei Laufzeit, Seriennummer und (teils) Extensions. Dieser Flow ist exakt der, den man auch bei öffentlichen CAs/ACME nutzt.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `openssl req -new` | CSR erzeugen |
| `openssl ca` / `openssl x509 -req` | CSR signieren |
| `openssl req -verify`/`-text` | CSR prüfen |

## Lab-Setup

- Root-CA aus Übung 03 (`~/lab-ca`). `openssl` vorhanden.

## Aufgabe (selbst lösen)

1. Erzeuge für `www.server.lab` einen **Server-Key** und einen **CSR** mit Subject + **SAN** `DNS:www.server.lab`.
2. Prüfe/zeige den CSR (`-text`, `-verify`) – welche Felder stehen drin, welche nicht (z. B. Issuer/Validity)?
3. **Signiere** den CSR mit deiner CA (Laufzeit z. B. 397 Tage), sodass ein gültiges, von der CA ausgestelltes Zertifikat entsteht – inkl. SAN im Ergebnis.
4. Verifiziere das Zertifikat gegen deine CA (`openssl verify -CAfile`).

**Ziel:** ein von der eigenen CA signiertes Server-Zertifikat, das gegen die CA erfolgreich verifiziert (mit korrektem SAN).

## SY0-701 Prüfungsbezug

- **1.0** CSR, certificate enrollment, CA signing, proof of possession; Private Key bleibt beim Antragsteller.
- **3.0** Certificate lifecycle (request → issue).
- Begriffe: *CSR*, *enrollment*, *subject/SAN*, *CA signing*, *certificate issuance*.
