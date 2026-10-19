# Übung 04 – Asymmetrische Kryptografie (RSA)

**Schwierigkeit: 4/10 · Dauer: ca. 60 Min.**

## Lernziele

- Asymmetrische Schlüsselpaare (RSA) erzeugen und verstehen
- Mit Public Key verschlüsseln, mit Private Key entschlüsseln
- Public vs. Private Key, Schlüssellängen und ECC einordnen

## Theorie

**Asymmetrische** Kryptografie nutzt ein **Schlüsselpaar**: einen **Public Key** (frei verteilbar) und einen **Private Key** (geheim). Was mit dem einen verschlüsselt wird, lässt sich nur mit dem anderen entschlüsseln. Das löst das Key-Distribution-Problem:

- **Vertraulichkeit:** Sender verschlüsselt mit dem **Public Key** des Empfängers → nur dessen **Private Key** entschlüsselt.
- **Signatur/Authentizität:** Sender signiert mit **eigenem Private Key** → jeder prüft mit dessen **Public Key** (Übung 05).

**RSA** basiert auf der Schwierigkeit der Faktorisierung großer Zahlen; übliche Längen **2048/3072/4096 Bit**. **ECC** (Elliptic Curve) bietet gleiche Sicherheit bei viel **kürzeren** Schlüsseln (z. B. 256-bit ECC ≈ 3072-bit RSA) → effizient für mobile/TLS. Asymmetrisch ist **langsam** → in der Praxis **hybrid** (Übung 07): asymmetrisch nur zum Austausch eines symmetrischen Session-Keys.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `openssl genpkey`/`genrsa` | RSA-Schlüsselpaar erzeugen |
| `openssl rsa`/`pkey` | Public Key extrahieren, Keys anschauen |
| `openssl pkeyutl` | mit Public/Private Key ver-/entschlüsseln |

## Lab-Setup

- Linux-Host mit `openssl`.

## Aufgabe (selbst lösen)

1. Erzeuge ein **RSA-3072**-Schlüsselpaar; extrahiere den Public Key in eine eigene Datei.
2. Schau dir den Private Key an (`openssl rsa -text`) und benenne Komponenten (Modulus n, public exponent e).
3. Verschlüssele eine kurze Nachricht mit dem **Public Key** und entschlüssele sie mit dem **Private Key**.
4. Erkläre, warum man **nur kurze** Daten direkt mit RSA verschlüsselt (→ Überleitung zu hybrid) und was ECC gegenüber RSA bringt.

**Ziel:** RSA-Keypair erzeugen, Public-Key-Verschlüsselung/Private-Key-Entschlüsselung durchführen und die Rolle in hybrider Krypto verstehen.

## SY0-701 Prüfungsbezug

- **1.0** Asymmetric encryption, public/private key, RSA, ECC, key length; use cases (confidentiality vs. signing).
- Warum hybrid: Performance; Grundlage für PKI/TLS (`pki-certificates`).
- Begriffe: *public/private key*, *RSA*, *ECC*, *key pair*, *key length*, *hybrid*.
