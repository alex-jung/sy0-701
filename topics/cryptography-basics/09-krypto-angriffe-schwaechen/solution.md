# Lösung – Übung 09: Krypto-Angriffe & Schwächen

## 1. ECB-Leak

```bash
python3 -c 'open("rep.bin","wb").write(b"A"*16*8)'   # 8 identische Blöcke
openssl enc -aes-128-ecb -nosalt -K 00112233445566778899aabbccddeeff -in rep.bin -out rep.ecb
xxd rep.ecb        # 8x derselbe 16-Byte-Cipherblock
openssl enc -aes-128-cbc -nosalt -K 00112233445566778899aabbccddeeff -iv $(openssl rand -hex 16) -in rep.bin -out rep.cbc
xxd rep.cbc        # alle Blöcke verschieden
```
ECB ist nicht semantisch sicher → Struktur leakt.

## 2. Schwacher Hash cracken

```bash
echo -n "Sommer2024" | md5sum                 # ungesalzen
echo "<md5hash>" > h.txt
hashcat -m 0 -a 0 h.txt /usr/share/wordlists/rockyou.txt   # schnell geknackt
```
Mit **Salt** wäre jeder Hash einzigartig (Rainbow Tables nutzlos), mit **KDF** (bcrypt/argon2) wäre jeder Versuch tausendfach teurer → Crack unwirtschaftlich.

## 3. Weak TLS

```bash
testssl.sh https://<dein-testserver>:443
# oder:
nmap --script ssl-enum-ciphers -p 443 <host>
```
Typische Findings: **SSLv3/TLS1.0/1.1** aktiv, **RC4/3DES/Export**-Ciphers, kein **PFS** (nur RSA-Key-Exchange), schwache DH-Parameter. Fix: nur TLS 1.2/1.3, AEAD-Suiten, ECDHE (PFS), starke Keys.

## 4. Konzepte

- **Padding Oracle (CBC):** Der Server verrät (per Fehlermeldung/Timing), ob das PKCS#7-Padding nach Entschlüsselung gültig war. Durch systematisches Verändern des vorherigen Cipherblocks und Beobachten der „padding valid"-Antwort entschlüsselt der Angreifer Byte für Byte – **ohne** den Key. Gegenmaßnahme: **AEAD (GCM)** oder encrypt-then-MAC, einheitliche Fehler/Timing.
- **Downgrade:** Der Angreifer manipuliert die Protokoll-/Cipher-Verhandlung, sodass Client/Server auf eine **schwache** Suite (z. B. SSLv3, Export-Cipher) „zurückfallen", die er dann bricht (POODLE/FREAK/Logjam-Muster). Gegenmaßnahme: alte Protokolle **deaktivieren**, `TLS_FALLBACK_SCSV`, strikte Suite-Policy, TLS 1.3.

## Hinweise / Troubleshooting

- Alle Angriffe nur gegen **eigene** Test-Ziele/Hashes.
- „Selbst gebaute" Krypto ist fast immer angreifbar → etablierte Bibliotheken nutzen.
- Birthday-Paradoxon erklärt, warum Kollisionen bei n-bit-Hash schon nach ~2^(n/2) Versuchen drohen → 128-bit-Hash gegen Kollisionen „nur" 64-bit stark.
