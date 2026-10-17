# Lösung – Übung 07: Rule-based & Mask Attacks

## 0. Test-Hash

```bash
echo -n 'P@ssw0rd!' | md5sum | awk '{print $1}' > hard.hash
```

## 1. Pure Wortliste scheitert

```bash
hashcat -m 0 -a 0 hard.hash /usr/share/wordlists/rockyou.txt
```
→ kein Treffer: `P@ssw0rd!` steht so nicht in rockyou (wohl aber `password`).

## 2. Rules

```bash
hashcat -m 0 -a 0 hard.hash /usr/share/wordlists/rockyou.txt -r /usr/share/hashcat/rules/best64.rule
hashcat -m 0 hard.hash --show
```
Eine Regel wandelt `password` → `P@ssw0rd!` (Capitalize + leet `a→@`,`o→0` + `!` anhängen). `best64.rule` deckt sehr viele solcher Mutationen ab. (John-Äquivalent: `john --rules --wordlist=rockyou.txt`.)

## 3. Mask-Attack

Muster „Großbuchstabe + 5 klein + 2 Ziffern" (z. B. `Abcdef12`):
```bash
hashcat -m 0 -a 3 one.hash '?u?l?l?l?l?l?d?d'
```
Maskenzeichen: `?u` A-Z, `?l` a-z, `?d` 0-9. `--increment` testet variable Längen.

## 4. Hybrid

```bash
# Wort + 4 Ziffern (z.B. "sommer2024"):
hashcat -m 0 -a 6 one.hash /usr/share/wordlists/rockyou.txt '?d?d?d?d'
# 4 Ziffern + Wort:
hashcat -m 0 -a 7 one.hash '?d?d?d?d' /usr/share/wordlists/rockyou.txt
```

## 5. Komplexität vs. Länge

Klassische Komplexitätsregeln erzeugen **vorhersehbare** Muster: Nutzer bauen `Wort` + `Großbuchstabe vorn` + `Ziffer/!` hinten + leetspeak. Genau diese Transformationen sind in Rules abgebildet → „komplexe" 8-Zeichen-Passwörter fallen schnell.
**Was wirklich hilft:**
- **Länge** (lange Passphrasen) – der Maskenraum wächst exponentiell mit der Länge, Rules greifen bei echten Zufalls-Passphrasen nicht.
- **Zufälligkeit** (Passwort-Manager), **Sperrlisten** geleakter Passwörter, **langsame Hashes** + **MFA**.
Moderne Empfehlung (NIST): **Länge statt erzwungener Komplexität**, Abgleich gegen Leak-Listen.

## Häufige Fehler / Troubleshooting

- **Rules ohne Effekt:** Pfad prüfen (`/usr/share/hashcat/rules/`), `-r` nur mit `-a 0`.
- **Maske zu groß:** `?a?a?a?a?a?a?a?a` dauert ewig – Zeichenraum/Länge einschränken, Muster nutzen.
- **John-Rules:** in `/etc/john/john.conf`; eigene Regelsätze möglich (`[List.Rules:...]`).
- **Kombination:** erst Wortliste+Rules (günstig), dann Maske/Hybrid (teurer) – Reihenfolge nach Kosten.
