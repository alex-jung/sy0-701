# Thema: Cryptography Basics

Praxis-Übungen zu den **kryptografischen Grundlagen** der SY0-701: Hashing/Integrität, symmetrische & asymmetrische Verschlüsselung, Signaturen, HMAC, Key Exchange, Password-Hashing/KDFs und typische Krypto-Schwächen. Fokus auf **Hands-on mit `openssl`/`gpg`**, damit die Prüfungsbegriffe (confidentiality/integrity/authenticity/non-repudiation, AES, RSA, ECC, SHA-2, HMAC, salt, KDF) praktisch greifbar werden.

> ⚠️ **Lern-/Lab-Kontext.** Selbst-gebaute Krypto ist für Produktion ungeeignet – hier geht es ums **Verstehen**. Schlüssel/Zertifikate nur im Lab verwenden; private Keys niemals teilen/committen (`.gitignore`).

## Lernziele

- Die vier Kernziele unterscheiden: Confidentiality, Integrity, Authentication, Non-Repudiation
- Hashing, symmetrische (AES) und asymmetrische (RSA/ECC) Verfahren praktisch anwenden
- Signaturen und HMAC erstellen/prüfen und ihren Unterschied verstehen
- Key Exchange (DH/ECDH) und hybride Verschlüsselung nachvollziehen
- Passwörter korrekt speichern (Salt + bcrypt/argon2/PBKDF2)
- Typische Krypto-Fehler erkennen (ECB-Muster, schwache Hashes, fehlender Salt, Downgrade)

## Abgedeckte SY0-701-Domänen

- **1.0 General Security Concepts** – Cryptographic solutions: symmetric/asymmetric, hashing, salting, key exchange, digital signatures, KDFs, HMAC
- **3.0 Security Architecture** – Verschlüsselung at-rest/in-transit, Key Management (Grundlagen)

## Übungen (Schwierigkeit 1 → 10)

| #  | Übung | Schwierigkeit |
|----|-------|---------------|
| 01 | Hashing & Integrität | 1/10 |
| 02 | Symmetrische Verschlüsselung mit openssl (AES) | 2/10 |
| 03 | Modes of Operation & IV (ECB vs. CBC/GCM) | 3/10 |
| 04 | Asymmetrische Kryptografie (RSA) | 4/10 |
| 05 | Digitale Signaturen & Integrität | 5/10 |
| 06 | HMAC & Message Authentication | 6/10 |
| 07 | Key Exchange (DH/ECDH) & Hybrid-Verschlüsselung | 7/10 |
| 08 | Password Hashing & KDFs (Salt, bcrypt/argon2/PBKDF2) | 8/10 |
| 09 | Krypto-Angriffe & Schwächen | 9/10 |
| 10 | Capstone: sichere Krypto-Pipeline bauen & bewerten | 10/10 |

## Lab-Voraussetzungen

- Kali/Linux mit `openssl`, `gpg`, `sha256sum` (alles vorinstalliert)
- Optional: Python3 (`hashlib`, `cryptography`, `argon2`, `bcrypt`), CyberChef (offline)
- Kein spezielles Netz nötig – reine Krypto-Praxis auf einem Host

Reihenfolge: starte bei `01-hashing-integritaet/`. Pro Übung erst die `.md` lösen, dann `solution.md`.
