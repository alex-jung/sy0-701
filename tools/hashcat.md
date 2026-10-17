# hashcat

**Kategorie:** Offline-Passwort-Cracking (GPU)

Der schnellste Passwort-Cracker, v. a. GPU-beschleunigt. Unterstützt hunderte Hash-Typen und mehrere Angriffsmodi.

```bash
hashcat -m <hash-mode> -a <attack-mode> <hashdatei> [wortliste|maske] [Optionen]
```

## Hash-Modes (`-m`, Auswahl)

| Mode | Typ |
|------|-----|
| 0 | MD5 |
| 100 | SHA1 |
| 1400 | SHA-256 |
| 1800 | sha512crypt (`$6$`, Linux shadow) |
| 3200 | bcrypt (`$2*$`) |
| 1000 | NTLM |
| 5600 | NetNTLMv2 |

`hashcat --example-hashes` / `hashid -m` helfen beim Mode.

## Attack-Modes (`-a`)

| Mode | Angriff |
|------|---------|
| 0 | Straight (Wortliste, optional `-r` Rules) |
| 1 | Combination (zwei Listen) |
| 3 | Mask/Brute-Force (`?l?u?d?s?a`) |
| 6 / 7 | Hybrid (Wortliste+Maske / Maske+Wortliste) |

## Wichtige Optionen

`-r <rule>` Regeln · `--show` geknackte · `--username` `user:hash`-Dateien · `-o <datei>` Output · `--force` (VM ohne GPU) · `-b` Benchmark · `--increment` (Maskenlänge variabel).

## Beispiele

```bash
hashcat -m 0 -a 0 md5.hash rockyou.txt -r /usr/share/hashcat/rules/best64.rule
hashcat -m 1800 -a 0 shadow.hash rockyou.txt
hashcat -m 1000 -a 3 nt.hash '?u?l?l?l?l?d?d'
hashcat -m 0 md5.hash --show
```

## Hinweis

Nur eigene Hashes. GPU dramatisch schneller als CPU; in VMs `--force`. Vorinstalliert in Kali.

## Verwendet in

password-attacks 03, 04, 05, 07, 08, 10.
