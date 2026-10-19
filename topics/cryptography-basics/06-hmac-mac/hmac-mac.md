# Übung 06 – HMAC & Message Authentication

**Schwierigkeit: 6/10 · Dauer: ca. 55 Min.**

## Lernziele

- HMAC berechnen und verifizieren
- Den Unterschied Hash vs. HMAC vs. digitale Signatur verstehen
- Verstehen, warum „encrypt-then-MAC" Integrität zu CBC ergänzt

## Theorie

Ein reiner Hash schützt **nicht** gegen gezielte Manipulation, wenn der Angreifer den Hash einfach mitändern kann. Ein **MAC (Message Authentication Code)** bindet die Integrität an einen **geheimen Schlüssel**: nur wer den Key kennt, kann einen gültigen MAC erzeugen/prüfen. **HMAC** ist die Standard-Konstruktion (Hash + Key, z. B. HMAC-SHA256).

Abgrenzung:
- **Hash:** Integrität, kein Key → jeder kann ihn neu berechnen.
- **HMAC:** Integrität **+ Authentizität**, **symmetrischer** Shared Key → kein Non-Repudiation (beide Seiten haben den Key).
- **Digitale Signatur:** Integrität + Authentizität **+ Non-Repudiation**, **asymmetrisch**.

HMAC wird u. a. in TLS, JWT (HS256), API-Request-Signaturen und als „encrypt-then-MAC" zu CBC verwendet (CBC allein hat keine Integrität, s. Übung 03).

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `openssl dgst -hmac` / `-mac hmac` | HMAC berechnen |
| `openssl mac` (neuere Versionen) | MAC-Berechnung |
| Python `hmac`/`hashlib` | konstante-Zeit-Vergleich |

## Lab-Setup

- Linux-Host mit `openssl` (optional Python3).

## Aufgabe (selbst lösen)

1. Berechne einen **HMAC-SHA256** über eine Datei mit geheimem Key; ändere die Datei und zeige, dass sich der HMAC ändert.
2. Zeige, dass ein **falscher Key** einen anderen HMAC ergibt (nur der korrekte Key verifiziert).
3. Baue (Python) eine kleine `verify(msg, key, tag)`-Funktion, die mit **konstanter Zeit** (`hmac.compare_digest`) vergleicht – und erkläre, warum.
4. Ordne in einer Tabelle Hash / HMAC / Signatur den Zielen Integrity, Authentication, Non-Repudiation zu.

**Ziel:** HMAC praktisch anwenden und sauber von Hash und Signatur abgrenzen (inkl. Timing-sicherer Vergleich).

## SY0-701 Prüfungsbezug

- **1.0** HMAC/MAC; integrity + authentication mit Shared Key; Abgrenzung zu Signatur.
- Einsatz in TLS/JWT/API; encrypt-then-MAC; timing-safe comparison.
- Begriffe: *MAC*, *HMAC*, *shared secret*, *encrypt-then-MAC*, *timing attack*.
