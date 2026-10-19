# Übung 10 – Capstone: sichere Krypto-Pipeline bauen & bewerten

**Schwierigkeit: 10/10 · Dauer: ca. 2–3 Std.**

## Lernziele

- Alle Bausteine kombinieren: hybride Verschlüsselung + Signatur + Integrität
- Eine vollständige „secure file transfer"-Pipeline bauen (Vertraulichkeit, Integrität, Authentizität, Non-Repudiation)
- Eine Krypto-Lösung systematisch bewerten/auditieren

## Theorie

Reale sichere Kommunikation kombiniert mehrere Primitive: **hybride Verschlüsselung** (asymmetrischer Key-Transport + AES-GCM), **digitale Signatur** (Authentizität/Non-Repudiation) und bewusste **Algorithmus-/Parameter-Wahl**. In diesem Capstone baust du ein kleines, aber vollständiges Protokoll „Alice sendet Bob eine vertrauliche, signierte Datei" – und bewertest es anschließend wie in einem Krypto-Audit (welche Schutzziele, welche Restrisiken). Nutze die Vorlage `crypto-assessment-template.md`.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `openssl` (genpkey, pkeyutl, enc, dgst) | Keys, hybrid, Signatur |
| `gpg`/`age` (optional) | Referenz-Implementierung zum Vergleich |
| `testssl.sh`/`nmap` | Bewertung eines TLS-Dienstes |

## Lab-Setup

- Linux-Host mit `openssl`/`gpg`. Zwei simulierte Parteien (Alice/Bob) mit je einem Keypair.

## Aufgabe (selbst lösen)

Baue ein **Skript** (`secure-send.sh` / `secure-recv.sh`), das Folgendes leistet:

1. **Senden (Alice → Bob):**
   - erzeuge einen zufälligen AES-256-Key;
   - verschlüssele die Datei mit **AES-256-GCM** (AEAD);
   - verschlüssele den AES-Key mit **Bobs RSA/ECDH-Public-Key** (hybrid);
   - **signiere** das Paket mit **Alices Private Key** (Authentizität/Non-Repudiation);
   - verpacke Ciphertext + verschlüsselten Key + Signatur + benötigte Metadaten.
2. **Empfangen (Bob):**
   - prüfe zuerst **Alices Signatur** (Public Key);
   - entschlüssele den AES-Key mit **Bobs Private Key**;
   - entschlüssele die Datei (GCM-Tag muss stimmen) und verifiziere per Hash gegen das Original.
3. **Negativtests:** manipuliere (a) den Ciphertext, (b) die Signatur, (c) tausche Bobs Key → zeige, dass die Pipeline jeweils **sauber fehlschlägt**.
4. **Bewertung:** fülle `crypto-assessment-template.md` aus – welche Schutzziele erfüllt die Pipeline, welche Algorithmen/Parameter, welche Restrisiken (Key-Management, PFS, RNG), welche Verbesserungen.

**Ziel:** eine lauffähige, hybride, signierte Secure-Transfer-Pipeline inkl. bestandener Negativtests + eine strukturierte Krypto-Bewertung.

## SY0-701 Prüfungsbezug

- **1.0** gesamte Crypto-Domäne kombiniert: symmetric/asymmetric, hashing, signatures, key exchange, AEAD, KDF.
- **3.0** Verschlüsselung in-transit, Key-Management, Protokoll-Design.
- Prüfungsnah: richtige Primitive je Schutzziel wählen, Schwächen erkennen, Lösung begründen.
- Begriffe: *hybrid encryption*, *AEAD/GCM*, *digital signature*, *key management*, *PFS*, *confidentiality/integrity/authenticity/non-repudiation*.
