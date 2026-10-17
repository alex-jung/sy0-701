# Lösung – Übung 01: Hash-Grundlagen & Identifikation

## 1. Test-Hashes + hashid

```bash
echo -n "password" | md5sum     # 5f4dcc3b5aa765d61d8327deb882cf99
echo -n "password" | sha1sum    # 5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8
hashid '5f4dcc3b5aa765d61d8327deb882cf99'
hashid '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8'
```
`hashid` schlägt Typen vor (MD5 bzw. SHA1) und mit `-m` den Hashcat-Mode.

## 2. DVWA-Hashes

```bash
hashid '5f4dcc3b5aa765d61d8327deb882cf99'
```
→ **MD5**, **ungesalzen**. Erkennbar: 32 Hex, kein `$...$`-Präfix, und gleiches Passwort ergibt bei allen Usern denselben Hash (z. B. mehrere `5f4dcc...` = alle „password"). Kein Salt → sehr leicht per Rainbow Table/Wortliste.

## 3. /etc/shadow-Zeile

```
root:$6$saltsalt$hashhashhash...:19000:0:99999:7:::
```
- `$6$` = **sha512crypt** (SHA-512-basiert, mit Runden = key stretching).
- Aufbau: `$id$salt$hash` → zwischen dem 2. und 3. `$` steht der **Salt**. Jeder User hat einen eigenen Salt.

## 4. MD5 vs. bcrypt

- **MD5:** extrem **schnell** → eine GPU rechnet Milliarden/Sek. → Wortlisten/Brute-Force trivial; zudem oft ungesalzen.
- **bcrypt:** absichtlich **langsam** + eingebauter Salt + einstellbarer Cost-Faktor (key stretching) → selbst mit GPU nur wenige tausend Versuche/Sek. → Brute-Force unwirtschaftlich.
→ Für Passwort-Speicherung gehört ein **langsamer, gesalzener** Algorithmus (bcrypt/Argon2/scrypt/PBKDF2), **nie** MD5/SHA1.

## 5. Salt vs. Rainbow Tables

Eine **Rainbow Table** ist eine vorberechnete Hash→Klartext-Tabelle für **ungesalzene** Hashes. Ein eindeutiger **Salt** pro Passwort macht jeden Hash einzigartig → die Tabelle müsste für **jeden Salt neu** berechnet werden → unpraktikabel. Salt macht Precomputation wertlos (man muss pro Hash wieder einzeln raten).

## Häufige Fehler / Troubleshooting

- **`echo` ohne `-n`:** hängt ein Newline an → anderer Hash. Immer `-n`.
- **hashid mehrdeutig:** 32 Hex = MD5 **oder** NTLM – Kontext entscheidet (Windows → NTLM).
- **Salt übersehen:** nur `$id$salt$hash` hat Salt; blanke Hex-Hashes meist ungesalzen.
- **„Hash entschlüsseln" wollen:** geht nicht – Hashing ist einweg; man rät/vergleicht.
