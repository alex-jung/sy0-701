# Übung 02 – Symmetrische Verschlüsselung mit openssl (AES)

**Schwierigkeit: 2/10 · Dauer: ca. 50 Min.**

## Lernziele

- Dateien mit AES symmetrisch ver- und entschlüsseln
- Schlüssel-/Passwort-Ableitung verstehen (Key vs. Passphrase, KDF)
- Vor- und Nachteile symmetrischer Kryptografie benennen

## Theorie

**Symmetrische** Verschlüsselung nutzt **einen** gemeinsamen Schlüssel zum Ver- und Entschlüsseln. Schnell und für große Datenmengen geeignet, aber: der Schlüssel muss **sicher ausgetauscht** werden (Key-Distribution-Problem). Standard ist **AES** (Advanced Encryption Standard) mit 128/192/256 Bit, als Blockchiffre (16-Byte-Blöcke).

Mit `openssl enc` kann man AES direkt nutzen. Aus einer **Passphrase** wird per **KDF** (PBKDF2) der eigentliche Schlüssel + IV abgeleitet (`-pbkdf2 -iter`). Wichtig: ein gutes Passwort und ein moderner KDF sind entscheidend – `openssl enc` ist zum Lernen gut, für echte Vertraulichkeit großer Systeme nutzt man authenticated encryption (GCM, s. Übung 03) und Key-Management.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `openssl enc` | symmetrisch ver-/entschlüsseln (AES) |
| `openssl rand` | Zufallsschlüssel/-IV erzeugen |

## Lab-Setup

- Linux-Host mit `openssl`.

## Aufgabe (selbst lösen)

1. Verschlüssele eine Datei mit **AES-256-CBC** und einer Passphrase (mit `-pbkdf2 -iter 100000 -salt`), entschlüssele sie wieder und prüfe per `sha256sum`, dass das Original identisch ist.
2. Erzeuge mit `openssl rand` einen **256-bit-Schlüssel** und einen **IV** (hex) und verschlüssele damit **ohne** Passphrase (`-K`/`-iv`).
3. Vergleiche: Was passiert bei falscher Passphrase? Was ist der Nutzen des `-salt`?
4. Formuliere das **Key-Distribution-Problem** in eigenen Worten.

**Ziel:** AES-Ver-/Entschlüsselung sicher anwenden (Passphrase + direkter Key/IV) und das Schlüsselaustausch-Problem benennen.

## SY0-701 Prüfungsbezug

- **1.0** Symmetric encryption, AES, block cipher, key length; KDF/PBKDF2; key distribution.
- Abgrenzung zu asymmetrisch (Übung 04) und hybrid (Übung 07).
- Begriffe: *symmetric*, *AES-128/256*, *block cipher*, *IV*, *salt*, *PBKDF2*, *key exchange problem*.
