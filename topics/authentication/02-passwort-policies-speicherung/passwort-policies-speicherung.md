# Übung 02 – Passwort-Policies & sichere Speicherung

**Schwierigkeit: 2/10 · Dauer: ca. 55 Min.**

## Lernziele

- Moderne Passwort-Policies (NIST SP 800-63B) umsetzen und alte Mythen verwerfen
- Linux-Passwort-Policy über PAM/pwquality konfigurieren
- Verstehen, wie `/etc/shadow` Passwörter speichert (Hash-Format)

## Theorie

Gute Passwort-Politik heute (NIST 800-63B): **Länge > Komplexität**, Prüfung gegen **Breach-/Wörterbuchlisten**, **keine** erzwungenen periodischen Wechsel ohne Anlass, **kein** erzwungener Zeichen-Mix, Unterstützung von Passwort-Managern/Passphrasen. Alte „Zwangsregeln" (alle 30 Tage wechseln, 1 Sonderzeichen) führen zu vorhersagbaren Mustern (`Sommer2024!`).

Auf Linux steuert **PAM** (`pam_pwquality`/`pam_unix`) Qualität und Hashing. Passwörter liegen in `/etc/shadow` als **gesalzener, iterierter Hash** im crypt-Format `$id$salt$hash` (`$6$` = SHA-512-crypt, `$y$` = yescrypt). Das knüpft direkt an `cryptography-basics` 08 (Salt/KDF) an.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `pam_pwquality` (`/etc/security/pwquality.conf`) | Passwort-Qualität erzwingen |
| `chage` | Account-/Passwort-Aging |
| `/etc/shadow`, `mkpasswd` | Hash-Format ansehen/erzeugen |

## Lab-Setup

- Linux-Host (Kali/Debian) mit `libpam-pwquality`, `whois` (für `mkpasswd`).

## Aufgabe (selbst lösen)

1. Schau dir in `/etc/shadow` (als root) das Hash-Format eines Accounts an und benenne id/salt/hash; bestimme den KDF-Typ.
2. Konfiguriere `pwquality` auf **minlen=14** + Dictionary-Check und teste, dass ein schwaches Passwort abgelehnt wird.
3. Setze mit `chage` eine sinnvolle Aging-Policy (oder deaktiviere Zwangswechsel) und begründe deine Wahl mit NIST 800-63B.
4. Formuliere eine **moderne** Passwort-Policy in 5 Punkten (was tun / was lassen).

**Ziel:** eine moderne, durchgesetzte Passwort-Policy auf Linux + Verständnis der Hash-Speicherung.

## SY0-701 Prüfungsbezug

- **1.0** Password concepts: length, complexity, reuse, age, managers; password best practices (NIST).
- Verknüpfung Hashing/Salt/KDF (`cryptography-basics`), Angriff (`password-attacks`).
- Begriffe: *password policy*, *length vs. complexity*, *password manager*, *shadow/crypt*, *pwquality/PAM*.
