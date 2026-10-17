# Übung 01 – Hash-Grundlagen & Identifikation

**Schwierigkeit: 1/10 · Dauer: ca. 35 Min.**

## Lernziele

- Den Unterschied zwischen Hashing, Salting und Encryption verstehen
- Gängige Hash-Typen an Format/Länge erkennen
- Hashes mit Tools identifizieren (hashid, hash-identifier)
- Key-Stretching/langsame Hashes (bcrypt/PBKDF2) einordnen

## Theorie

- **Hashing** = Einweg-Funktion (nicht umkehrbar). Man „knackt" einen Hash, indem man Kandidaten hasht und vergleicht – nicht durch „Entschlüsseln".
- **Salt** = zufälliger, pro Passwort eindeutiger Wert, der mitgehasht wird → verhindert **Rainbow Tables** und macht gleiche Passwörter zu verschiedenen Hashes.
- **Encryption** ≠ Hashing: Verschlüsselung ist **umkehrbar** (mit Schlüssel). Passwörter werden **gehasht**, nicht verschlüsselt.
- **Key Stretching / langsame Hashes** (bcrypt, scrypt, PBKDF2, Argon2): absichtlich langsam → Brute-Force teuer. Schnelle Hashes (MD5, SHA1, NTLM) sind für Passwörter **schlecht**.

Erkennungsmerkmale (Beispiele):

| Format | Typ |
|--------|-----|
| 32 Hex | MD5 / NTLM |
| 40 Hex | SHA1 |
| 64 Hex | SHA-256 |
| `$1$...` | md5crypt |
| `$6$...` | sha512crypt (Linux shadow) |
| `$2y$...` | bcrypt |
| `user:$...` | shadow-/passwd-Format |

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `hashid` | Hash-Typ bestimmen (modern, Hashcat-Mode-Hinweis) |
| `hash-identifier` | Hash-Typ bestimmen (klassisch) |
| `echo -n ... \| md5sum/sha1sum` | eigene Test-Hashes erzeugen |

## Lab-Setup

- Kali. Hashes aus vorherigen Themen bereithalten (DVWA-`users`, `/etc/shadow`) oder selbst erzeugen.

## Aufgabe (selbst lösen)

1. Erzeuge je einen **MD5-** und **SHA1-**Hash eines Testworts und identifiziere sie mit `hashid`.
2. Nimm die DVWA-`users`-Hashes (aus web-exploitation) und bestimme den Typ. Haben sie ein **Salt**?
3. Sieh dir eine `/etc/shadow`-Zeile an: welchen Algorithmus verrät das `$6$`-Präfix, und wo ist der Salt?
4. Erkläre den Unterschied zwischen MD5 und bcrypt für Passwort-Speicherung – warum ist bcrypt besser?
5. Warum macht ein **Salt** Rainbow Tables wirkungslos?

**Ziel:** Hash-Typen sicher erkennen und den Sicherheitsunterschied zwischen schnellen/ungesalzenen und langsamen/gesalzenen Hashes erklären.

## SY0-701 Prüfungsbezug

- **Hashing vs. Encryption**, **Salting**, **Key Stretching** – Kern von Domäne 1.0.
- **Rainbow Table Attack** und warum Salt dagegen schützt.
- **Schwache Hashes (MD5/SHA1/NTLM)** vs. **bcrypt/Argon2/PBKDF2**.
- Begriffe: *hashing*, *salt*, *key stretching*, *rainbow table*, *bcrypt/PBKDF2/Argon2*, *MD5/SHA/NTLM*.
