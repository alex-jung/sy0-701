# Übung 03 – Modes of Operation & IV (ECB vs. CBC/GCM)

**Schwierigkeit: 3/10 · Dauer: ca. 60 Min.**

## Lernziele

- Block-Cipher Modes verstehen: ECB, CBC, CTR, GCM
- Den berühmten „ECB-Pinguin" selbst reproduzieren
- Authenticated Encryption (GCM) von reiner Verschlüsselung (CBC) unterscheiden

## Theorie

AES verschlüsselt **Blöcke** (16 Byte). Ein **Mode of Operation** legt fest, wie mehrere Blöcke verkettet werden:

- **ECB (Electronic Codebook):** jeder Block unabhängig → **gleiche Klartextblöcke ⇒ gleiche Cipherblöcke**. Muster bleiben sichtbar (ECB-Pinguin). **Nie verwenden.**
- **CBC (Cipher Block Chaining):** jeder Block wird vor der Verschlüsselung mit dem vorherigen Cipherblock XOR-verknüpft; braucht einen **IV** (Initialization Vector). Gleiche Klartexte ⇒ unterschiedliche Ciphertexts (bei zufälligem IV). Keine Integrität.
- **CTR:** macht aus der Blockchiffre eine Stromchiffre (Counter + Nonce).
- **GCM (Galois/Counter Mode):** CTR + **Authentication Tag** → **Authenticated Encryption (AEAD)**: liefert Vertraulichkeit **und** Integrität/Authentizität. Heutiger Standard (TLS 1.3).

Der **IV/Nonce** muss unvorhersehbar/einmalig sein – IV-Wiederverwendung (v. a. bei GCM/CTR) ist katastrophal.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `openssl enc` | AES in verschiedenen Modes |
| `convert`/Bildtool | ECB-Muster sichtbar machen |

## Lab-Setup

- Linux-Host mit `openssl`; optional ImageMagick (`convert`) für den ECB-Pinguin.

## Aufgabe (selbst lösen)

1. Verschlüssele dieselbe Datei mit **AES-256-ECB** und **AES-256-CBC** und vergleiche: Warum zeigt ECB Muster?
2. Reproduziere den **ECB-Pinguin**: nimm ein einfaches Bitmap/PPM, verschlüssele den Bilddaten-Teil mit ECB und mit CBC, betrachte beide → beschreibe den Unterschied.
3. Verschlüssele mit **AES-256-GCM** und zeige, dass bei Manipulation des Ciphertexts die Entschlüsselung **fehlschlägt** (Tag-Prüfung).
4. Erkläre, warum IV-Wiederverwendung problematisch ist.

**Ziel:** den Sicherheitsunterschied der Modes praktisch belegen (ECB-Muster) und AEAD/GCM als integritätsschützend verstehen.

## SY0-701 Prüfungsbezug

- **1.0** Modes of operation; ECB-Schwäche; IV/Nonce; Authenticated Encryption (GCM).
- Warum AEAD (GCM) heute Standard ist (TLS 1.3); CBC + separates HMAC als Alternative.
- Begriffe: *ECB/CBC/CTR/GCM*, *IV/nonce*, *AEAD*, *authentication tag*, *nonce reuse*.
