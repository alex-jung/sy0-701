# Übung 07 – Key Management & HSM

**Schwierigkeit: 7/10 · Dauer: ca. 75 Min.**

## Lernziele

- Den Schlüssel-Lebenszyklus (Key Lifecycle) verstehen
- HSM, KMS, TPM und Secure Enclave unterscheiden
- Key-Management-Prinzipien (Rotation, Escrow, Trennung) anwenden

## Theorie

Verschlüsselung ist nur so sicher wie das **Key Management**. **Key Lifecycle:** generate → distribute → store → use → rotate → revoke → destroy/archive. Prinzipien: Schlüssel **getrennt** von den Daten halten, **Zugriff minimal**, **Rotation** (regelmäßig/anlassbezogen), **Backup/Escrow** (Wiederherstellbarkeit vs. Risiko), klare Owner.

Schlüssel-Speicher/-Technologien (SY0-701):
- **HSM (Hardware Security Module):** dedizierte, manipulationssichere Hardware; Keys verlassen das HSM nie; FIPS-zertifiziert.
- **KMS (Key Management Service):** zentraler (oft Cloud-)Dienst zur Schlüsselverwaltung (AWS KMS, Vault); Envelope Encryption.
- **TPM (Trusted Platform Module):** Chip im Gerät (Keys/Measured Boot/BitLocker-Key).
- **Secure Enclave / Key Vault**, **Smartcard**.

**Key Escrow:** hinterlegte Kopie des Schlüssels (z. B. für Recovery/rechtliche Anforderung) – nützlich, aber zusätzliches Risiko/Governance nötig. Bezug: `cryptography-basics`, `pki-certificates` (CA-Key-Schutz).

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| openssl/gpg | Key-Handling (Demo) |
| (Konzept) HSM/KMS/TPM | Schlüssel-Speicher |

## Lab-Setup

- Lab-Keys aus `pki-certificates`/`cryptography-basics` als Beispiel; TPM falls vorhanden.

## Aufgabe (selbst lösen)

1. Skizziere den **Key Lifecycle** für einen deiner Lab-Schlüssel (z. B. CA-Key) mit konkreten Maßnahmen pro Phase.
2. Unterscheide HSM, KMS, TPM, Secure Enclave (Zweck/Einsatz) in einer Tabelle.
3. Definiere eine **Rotations-** und **Revocation-Policy** (wann/wie) und beschreibe sicheres **Key Storage** (getrennt, Zugriff, Backup).
4. Erkläre **Key Escrow** mit Vor-/Nachteil und wann es angebracht ist.

**Ziel:** ein sauberes Key-Management-Konzept (Lifecycle, Speicher, Rotation, Escrow) für deine Lab-Schlüssel.

## SY0-701 Prüfungsbezug

- **1.0/3.0** key management, HSM, KMS, TPM, secure enclave, key lifecycle, rotation, escrow, key storage.
- Begriffe: *key lifecycle*, *HSM/KMS/TPM/secure enclave*, *key rotation/revocation*, *key escrow*, *envelope encryption*.
