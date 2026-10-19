# Übung 08 – Password Hashing & KDFs (Salt, bcrypt/argon2/PBKDF2)

**Schwierigkeit: 8/10 · Dauer: ca. 75 Min.**

## Lernziele

- Passwörter korrekt speichern: Salt + langsamer, parametrisierbarer KDF
- bcrypt, scrypt, argon2 und PBKDF2 vergleichen
- Zeigen, warum schnelles Hashing (SHA-256) und fehlender Salt gefährlich sind

## Theorie

Passwörter werden **nie** im Klartext und **nicht** mit schnellen Hashes (MD5/SHA-256) gespeichert. Angreifer rechnen Milliarden SHA-256/s → ungesalzene schnelle Hashes fallen per **Rainbow Table**/Brute-Force. Richtig:

- **Salt:** pro Passwort ein zufälliger Wert, mitgespeichert → gleiche Passwörter ergeben unterschiedliche Hashes, Rainbow Tables nutzlos.
- **Pepper:** zusätzlicher geheimer, **nicht** in der DB gespeicherter Wert (Secret/HSM).
- **Langsamer KDF / „work factor":** absichtlich teuer, anpassbar an Hardware:
  - **PBKDF2** – iterationsbasiert (Standard, FIPS), aber GPU-freundlich.
  - **bcrypt** – cost factor, bewährt.
  - **scrypt** – zusätzlich speicherhart.
  - **argon2id** – aktueller Empfehlungsstandard (memory-hard, GPU-/ASIC-resistent).

Das knüpft an `password-attacks` an: dort wurden solche Hashes angegriffen – hier lernst du die Verteidigung.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `openssl passwd` | bcrypt/… Hash erzeugen |
| `mkpasswd` (whois-Paket) | yescrypt/sha512crypt (Linux shadow) |
| Python `argon2-cffi`/`bcrypt`/`hashlib.pbkdf2_hmac` | KDFs vergleichen |
| `hashcat` (aus `password-attacks`) | Demonstration der Angriffsgeschwindigkeit |

## Lab-Setup

- Linux-Host; Python3 mit `argon2-cffi`, `bcrypt`. Optional `hashcat` für den Geschwindigkeitsvergleich.

## Aufgabe (selbst lösen)

1. Erzeuge für dasselbe Passwort einen **bcrypt**- und einen **argon2id**-Hash (mit Salt) und zerlege das Ausgabeformat (Algorithmus, Parameter, Salt, Hash).
2. Erzeuge zweimal denselben Passwort-Hash **mit** Salt → zeige, dass die Ergebnisse unterschiedlich sind, aber beide verifizieren.
3. Variiere den **Work Factor** (bcrypt cost / argon2 time+memory) und miss die Zeit → beschreibe den Trade-off (Sicherheit vs. Login-Latenz).
4. Vergleiche konzeptionell (ggf. mit `hashcat`-Benchmark `-b`) die Angriffs-Geschwindigkeit gegen **SHA-256** vs. **bcrypt/argon2** und begründe die Wahl.

**Ziel:** Passwörter korrekt (Salt + argon2id/bcrypt, passender Work Factor) hashen und den Unterschied zu schnellen Hashes belegen.

## SY0-701 Prüfungsbezug

- **1.0** Salting, key stretching, KDFs (PBKDF2/bcrypt/scrypt/argon2); secure password storage.
- Verknüpfung zu `password-attacks` (Angreiferseite) und `authentication`.
- Begriffe: *salt*, *pepper*, *key stretching*, *work factor/cost*, *PBKDF2/bcrypt/scrypt/argon2*, *rainbow table*.
