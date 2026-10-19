# Übung 09 – Krypto-Angriffe & Schwächen

**Schwierigkeit: 9/10 · Dauer: ca. 90 Min.**

## Lernziele

- Typische kryptografische Fehler erkennen und ausnutzen/demonstrieren
- ECB-Muster, schwache Hashes/Kollisionen, fehlender Salt, Nonce-Reuse, Downgrade verstehen
- Padding-Oracle- und MITM-Konzepte einordnen

## Theorie

Krypto scheitert selten am Algorithmus, sondern an **Fehlanwendung**. Wichtige Klassen (prüfungsrelevant):

- **ECB-Muster / fehlende Semantik-Sicherheit:** deterministische Verschlüsselung verrät Struktur (Übung 03).
- **Schwache/gebrochene Primitive:** MD5/SHA-1 (Kollisionen), DES/3DES, RC4, RSA-512/1024, selbstgebaute Chiffren.
- **Fehlender Salt / schnelle Passwort-Hashes:** Rainbow Tables (Übung 08).
- **Nonce/IV-Reuse:** Keystream-Wiederverwendung (CTR/GCM) → Klartext-Leak.
- **Padding Oracle (CBC):** verrät ein Server, ob das Padding korrekt war, kann der Angreifer den Klartext blockweise entschlüsseln (POODLE/klassisch).
- **Downgrade/Weak Cipher Negotiation:** Angreifer zwingt schwache Suite (SSLv3/Export-Ciphers).
- **MITM ohne Authentisierung:** reines DH ohne Zertifikat → aktiver Angreifer sitzt dazwischen.
- **Schlechte Zufallszahlen (RNG):** vorhersagbare Keys/Nonces.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `openssl` | Muster/Kollisionen/Modi demonstrieren |
| `hashid`/`hashcat` | schwache Hashes erkennen/cracken |
| `testssl.sh`/`nmap --script ssl-enum-ciphers` | schwache TLS-Suiten/Downgrade finden |

## Lab-Setup

- Linux-Host mit `openssl`, optional `testssl.sh`. Für TLS-Checks ein eigener Test-Server (z. B. aus `pki-certificates`).

## Aufgabe (selbst lösen)

1. **ECB-Leak:** verschlüssele strukturierte Daten (z. B. wiederholte Blöcke) mit ECB und zeige, dass identische Blöcke identische Ciphertext-Blöcke erzeugen (hexdump-Vergleich).
2. **Schwacher Hash:** nimm einen ungesalzenen MD5/SHA-1-Hash eines schwachen Passworts und cracke ihn mit `hashcat`/Wortliste – begründe, warum Salt + KDF das verhindert hätten.
3. **Weak TLS:** scanne einen (eigenen) TLS-Dienst auf schwache Cipher Suites/Protokolle (`testssl.sh` oder nmap) und benenne die Findings (z. B. TLS 1.0, RC4, kein PFS).
4. **Konzept-Erklärung:** beschreibe in je 3–4 Sätzen, wie ein **Padding-Oracle** und ein **Downgrade-Angriff** funktionieren und welche Gegenmaßnahme greift.

**Ziel:** mehrere reale Krypto-Schwächen praktisch zeigen (ECB-Leak, Hash-Crack, Weak-TLS-Scan) + Padding-Oracle/Downgrade erklären.

## SY0-701 Prüfungsbezug

- **1.0/2.0** Cryptographic attacks: collision, birthday, downgrade, padding oracle, nonce reuse; weak/deprecated algorithms; RNG.
- Gegenmaßnahmen: moderne Primitive, AEAD, PFS, Salt+KDF, authentifizierter Key Exchange.
- Begriffe: *collision/birthday attack*, *downgrade*, *padding oracle*, *nonce reuse*, *deprecated cipher*, *MITM*.
