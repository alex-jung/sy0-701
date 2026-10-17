# Übung 04 – Linux /etc/shadow cracken

**Schwierigkeit: 4/10 · Dauer: ca. 50 Min.**

## Lernziele

- Aufbau von `/etc/passwd` und `/etc/shadow` verstehen
- `passwd` + `shadow` mit `unshadow` zusammenführen (John) bzw. für Hashcat vorbereiten
- sha512crypt-Hashes (`$6$`) knacken
- Den Schutz durch gesalzene, langsame Crypt-Hashes einordnen

## Theorie

Linux speichert Passwort-Hashes in **`/etc/shadow`** (nur für root lesbar), Benutzerdaten in **`/etc/passwd`**. Eine shadow-Zeile:
```
user:$6$salt$hash:lastchg:min:max:warn:...
```
Das `$id$`-Präfix nennt den Algorithmus: `$1$` md5crypt, `$5$` sha256crypt, **`$6$` sha512crypt**, `$2y$` bcrypt, `$y$` yescrypt. Diese Crypt-Hashes sind **gesalzen** und **langsam** (viele Runden) → deutlich widerstandsfähiger als bloßes MD5.

Für **John** kombiniert `unshadow passwd shadow` beide Dateien ins erwartete Format. **Hashcat** braucht nur die `$6$...`-Zeilen mit Mode `1800`.

Die shadow-Datei bekommt man im Lab z. B. aus einer root-Shell (Exploitation), via NFS-Mount oder LFI (vorige Themen).

## Verwendete Tools

| Tool | Zweck | Wichtige Optionen |
|------|-------|-------------------|
| `unshadow` | passwd+shadow mergen (für John) | `unshadow passwd shadow > hashes` |
| `john` | cracken | `--wordlist=`, `--format=sha512crypt` |
| `hashcat` | cracken | `-m 1800` (sha512crypt) |

## Lab-Setup

- `passwd`/`shadow` eines Lab-Ziels (Metasploitable, aus root-Shell/NFS). `rockyou.txt`.

## Aufgabe (selbst lösen)

1. Beschaffe `/etc/passwd` und `/etc/shadow` deines Lab-Ziels (aus einer root-Shell oder per NFS) und erkläre den Aufbau einer shadow-Zeile.
2. Führe beide mit **`unshadow`** zusammen und cracke mit **John** + rockyou.
3. Cracke dieselben `$6$`-Hashes alternativ mit **Hashcat** (`-m 1800`).
4. Vergleiche die Crack-Zeit mit den MD5-Hashes aus Übung 02/03 – warum dauert `$6$` viel länger?
5. Welche Rolle spielen der **Salt** (pro User) und die **Rundenzahl** für die Sicherheit?

**Ziel:** mindestens ein Linux-Benutzerpasswort aus `/etc/shadow` geknackt – mit John *und* Hashcat – und den Unterschied zu schnellen Hashes verstanden.

## SY0-701 Prüfungsbezug

- **Password storage** unter Linux (`/etc/shadow`, crypt-Formate); **Salting + Key Stretching**.
- **Credential access** nach Systemkompromittierung (Hashes als Beute).
- **Mitigation:** starke Passwörter + moderne Crypt-Algorithmen; shadow nur root-lesbar.
- Begriffe: *sha512crypt*, *salt*, *key stretching*, *credential dumping*, *password storage*.
