# Lösung – Übung 04: Linux /etc/shadow cracken

## 1. Dateien beschaffen + Aufbau

Aus einer root-Shell (Exploitation-Thema) oder NFS-Mount:
```bash
cat /etc/passwd > passwd
cat /etc/shadow > shadow
```
shadow-Zeile:
```
msfadmin:$6$abc123$Xy...:19000:0:99999:7:::
   │        │   │    │
 user    algo salt  hash
```
`$6$` = sha512crypt, danach Salt, dann Hash; die Zahlen = Passwort-Aging.

## 2. unshadow + John

```bash
unshadow passwd shadow > unshadowed.txt
john --wordlist=/usr/share/wordlists/rockyou.txt unshadowed.txt
john --show unshadowed.txt
```
John erkennt sha512crypt automatisch; `--show` zeigt `user:passwort`.

## 3. Hashcat (-m 1800)

Nur die `$6$...`-Hashes (eine pro Zeile) in `shadow_hashes.txt`:
```bash
grep '\$6\$' shadow | cut -d: -f2 > shadow_hashes.txt
hashcat -m 1800 -a 0 shadow_hashes.txt /usr/share/wordlists/rockyou.txt
hashcat -m 1800 shadow_hashes.txt --show
```

## 4. Warum langsamer als MD5

`$6$` ist **key-stretched** (viele SHA-512-Runden) und **gesalzen** → pro Kandidat ist viel Rechenaufwand nötig und keine Rainbow-Table-Nutzung möglich. MD5 ist ein einzelner, schneller, ungesalzener Durchlauf → Milliarden/Sek. vs. (zehn)tausende/Sek. bei `$6$`.

## 5. Salt + Runden

- **Salt (pro User):** gleiche Passwörter → verschiedene Hashes; Precomputation/Rainbow Tables wertlos; man muss jeden Hash einzeln angreifen.
- **Runden (Key Stretching):** erhöhen die Kosten pro Rateversuch linear → Brute-Force wird um Größenordnungen teurer. Beides zusammen macht starke Passwörter praktisch sicher.

## Gegenmaßnahmen

- Moderne Crypt-Algorithmen (`$6$`/yescrypt `$y$`/Argon2), starke Passwörter.
- `/etc/shadow` strikt root-only; Zugriff auf root/NFS absichern (verhindert, dass Hashes überhaupt abfließen).

## Häufige Fehler / Troubleshooting

- **John findet „No hashes loaded":** `unshadow` vergessen oder falsche Dateien; Reihenfolge `unshadow passwd shadow`.
- **Hashcat `-m 1800` lädt nicht:** nur das `$6$...`-Feld übergeben (nicht die ganze Zeile), oder `--username` bei `user:hash`.
- **Sehr langsam:** erwartet (key stretching) – kleinere/gezieltere Wortliste, Geduld; `$6$` ist bewusst teuer.
- **shadow nicht lesbar:** du bist nicht root → erst PrivEsc/richtige Quelle.
