# Übung 05 – Digitale Signaturen & Integrität

**Schwierigkeit: 5/10 · Dauer: ca. 60 Min.**

## Lernziele

- Digitale Signaturen erstellen und verifizieren (openssl & gpg)
- Verstehen, wie Signatur = Hash + Private-Key-Operation Authentizität/Integrität/Non-Repudiation liefert
- Den Unterschied Signatur vs. Verschlüsselung klar benennen

## Theorie

Eine **digitale Signatur** beweist: (1) die Nachricht wurde **nicht verändert** (Integrity), (2) sie stammt vom Inhaber des Private Keys (Authentication) und (3) er kann es **nicht abstreiten** (Non-Repudiation). Ablauf:

1. Vom Dokument wird ein **Hash** gebildet.
2. Der Hash wird mit dem **Private Key** des Signierenden „verschlüsselt" → Signatur.
3. Prüfer berechnet den Hash selbst und verifiziert die Signatur mit dem **Public Key** des Signierenden.

Gegenstück zur Verschlüsselung: **verschlüsseln** nutzt den Public Key des **Empfängers** (Vertraulichkeit); **signieren** nutzt den Private Key des **Senders** (Authentizität). Beides lässt sich kombinieren (sign-then-encrypt). Signaturen sind die Basis für **Code Signing**, **Zertifikate/PKI** und **E-Mail (S/MIME, PGP)**.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `openssl dgst -sign/-verify` | signieren/verifizieren mit RSA/ECC |
| `gpg` | Signaturen (detached/clearsign), Web of Trust |

## Lab-Setup

- Linux-Host mit `openssl` und `gpg`. RSA-Keypair aus Übung 04 nutzbar.

## Aufgabe (selbst lösen)

1. Signiere eine Datei mit `openssl dgst -sha256 -sign priv.pem` und **verifiziere** sie mit dem Public Key. Manipuliere dann die Datei und zeige, dass die Verifikation fehlschlägt.
2. Erzeuge einen **GPG-Schlüssel**, signiere eine Datei als **detached signature** (`--detach-sign`) und verifiziere sie.
3. Erstelle zusätzlich eine **clearsign**-Signatur und erkläre den Unterschied zu detached.
4. Beantworte: Welchen Key nutzt man zum **Signieren**, welchen zum **Prüfen** – und warum liefert das Non-Repudiation?

**Ziel:** Signieren/Verifizieren mit openssl und gpg beherrschen und den Mechanismus (Hash + Private Key) sauber erklären.

## SY0-701 Prüfungsbezug

- **1.0** Digital signatures; non-repudiation; authentication/integrity; code signing.
- Zusammenspiel mit Hashing (Übung 01) und asymmetrisch (Übung 04); Basis für PKI.
- Begriffe: *digital signature*, *non-repudiation*, *sign/verify*, *detached signature*, *code signing*.
