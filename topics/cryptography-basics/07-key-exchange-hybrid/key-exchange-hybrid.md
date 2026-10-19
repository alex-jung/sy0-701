# Übung 07 – Key Exchange (DH/ECDH) & Hybrid-Verschlüsselung

**Schwierigkeit: 7/10 · Dauer: ca. 75 Min.**

## Lernziele

- Diffie-Hellman/ECDH-Schlüsselaustausch praktisch nachvollziehen
- Verstehen, wie zwei Parteien ohne Vorab-Geheimnis einen gemeinsamen Key erzeugen
- Eine hybride Verschlüsselung (asymmetrisch + symmetrisch) selbst bauen; Perfect Forward Secrecy einordnen

## Theorie

**Key Exchange** löst das Verteilungsproblem symmetrischer Schlüssel. **Diffie-Hellman (DH)** erlaubt es zwei Parteien, über einen **öffentlichen** Kanal ein **gemeinsames Geheimnis** zu berechnen, ohne es zu übertragen: beide tauschen öffentliche Werte, kombinieren sie mit ihrem privaten Wert → dasselbe Shared Secret. **ECDH** ist die effiziente Variante auf elliptischen Kurven.

**Hybride Verschlüsselung** (so arbeiten TLS, PGP, age): asymmetrisch (RSA/ECDH) wird nur genutzt, um einen **symmetrischen Session-Key** auszutauschen; die eigentlichen Daten verschlüsselt man **symmetrisch** (AES-GCM) – schnell und für große Datenmengen. 

**Perfect Forward Secrecy (PFS):** mit **ephemeren** DH-Keys (DHE/ECDHE) pro Sitzung bleibt alter Verkehr sicher, selbst wenn später der Langzeit-Private-Key kompromittiert wird – es gibt keinen „Generalschlüssel" für aufgezeichnete Sessions.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `openssl genpkey`/`pkeyutl -derive` | (EC)DH Shared Secret ableiten |
| `openssl enc` | symmetrischer Teil (AES-GCM/CBC) |
| `age`/`gpg` (optional) | fertige hybride Verschlüsselung |

## Lab-Setup

- Linux-Host mit `openssl`. Simuliere zwei Parteien („Alice"/„Bob") durch zwei Keypaare.

## Aufgabe (selbst lösen)

1. Erzeuge für „Alice" und „Bob" je ein **ECDH**-Keypair (z. B. X25519) und leite auf **beiden** Seiten das **gleiche** Shared Secret ab (`pkeyutl -derive`). Zeige, dass beide identisch sind.
2. Leite aus dem Shared Secret per Hash/KDF einen AES-Key ab und verschlüssele damit eine Nachricht (symmetrisch) → das ist das Hybrid-Prinzip.
3. Baue die komplette **hybride** Kette für RSA: Alice erzeugt einen zufälligen AES-Key, verschlüsselt die Datei mit AES und den AES-Key mit Bobs **RSA-Public-Key**; Bob entschlüsselt beides.
4. Erkläre **PFS** und warum ephemere Keys (ECDHE) es ermöglichen.

**Ziel:** (EC)DH-Shared-Secret auf beiden Seiten identisch ableiten und eine vollständige hybride Verschlüsselung durchführen; PFS erklären können.

## SY0-701 Prüfungsbezug

- **1.0** Key exchange (DH/ECDH), hybrid encryption, ephemeral keys, Perfect Forward Secrecy.
- **3.0** Grundlage von TLS/VPN (`pki-certificates`, `vpn-tunneling`).
- Begriffe: *Diffie-Hellman*, *ECDHE*, *shared secret*, *hybrid encryption*, *session key*, *PFS*.
