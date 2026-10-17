# Lösung – Übung 05: Windows NTLM/LM cracken

## 1. NT-Hash erzeugen/beschaffen

Test-NT-Hash erzeugen (MD4 des UTF-16LE-Passworts):
```bash
python3 -c 'import hashlib;print(hashlib.new("md4","Password1".encode("utf-16le")).hexdigest())'
# -> 64f12cddaa88057e06a81b54e73b949b
```
Aus echter Kompromittierung: Meterpreter `hashdump` oder `secretsdump.py` liefert `user:RID:LM:NT:::`. Das **3.** Hash-Feld ist der NT-Hash.

## 2. Cracken

```bash
echo '64f12cddaa88057e06a81b54e73b949b' > nt.hash
hashcat -m 1000 -a 0 nt.hash /usr/share/wordlists/rockyou.txt
hashcat -m 1000 nt.hash --show
# John:
john --format=NT --wordlist=rockyou.txt nt.hash
```
→ `Password1`.

## 3. Warum NTLM problematisch

NTLM ist **MD4(passwort)** ohne Salt:
- gleiche Passwörter → **identische Hashes** (erkennbar, anfällig für Rainbow Tables),
- schnell crackbar (kein key stretching),
- **Pass-the-Hash**: der NT-Hash reicht zur Authentifizierung – man muss ihn nicht mal cracken (Übung 09).

## 4. NTLM vs. NetNTLMv2

- **NTLM (NT-Hash, `-m 1000`):** der gespeicherte Hash aus der SAM. **Direkt PtH-fähig**.
- **NetNTLMv2 (`-m 5600`):** ein **Challenge-Response** aus einer Netzwerk-Authentifizierung (z. B. von `Responder` abgefangen). **Nicht** direkt PtH-fähig (enthält eine Server-Challenge), aber **crackbar** → danach Klartext.

## 5. Gegenmaßnahmen

- **LM/NTLM deaktivieren**, **Kerberos** erzwingen (`LmCompatibilityLevel`), SMB-Signing.
- Lange, einzigartige Passwörter (NT-Hash wird dann praktisch nicht gecrackt).
- **Credential Guard**, LAPS (eindeutige lokale Admin-Passwörter), Tiering, MFA → entwertet PtH.

## Häufige Fehler / Troubleshooting

- **UTF-16LE vergessen:** NT-Hash = MD4 des Passworts in **UTF-16LE**, nicht ASCII.
- **Falsches Feld:** aus `user:RID:LM:NT:::` den **NT**-Teil (4. Feld, 3. Hash) nehmen, nicht LM.
- **`-m 1000` vs `-m 5600`:** SAM-NT-Hash ≠ abgefangener NetNTLMv2 – Modes nicht verwechseln.
- **LM leer (`aad3b435...`):** LM ist deaktiviert (gut) → nur NT-Hash angreifen.
