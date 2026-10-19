# Übung 01 – Hashing & Integrität

**Schwierigkeit: 1/10 · Dauer: ca. 40 Min.**

## Lernziele

- Verstehen, was eine kryptografische Hashfunktion leistet (und was nicht)
- Integrität von Dateien über Hashes prüfen
- Eigenschaften (deterministisch, Einweg, Kollisionsresistenz, Avalanche) praktisch sehen

## Theorie

Eine **Hashfunktion** bildet beliebige Eingaben auf einen **festen** Ausgabewert (Digest) ab. Eigenschaften:

- **Deterministisch:** gleiche Eingabe → gleicher Hash.
- **Einweg (pre-image resistance):** aus dem Hash lässt sich die Eingabe nicht zurückrechnen.
- **Kollisionsresistenz:** praktisch unmöglich, zwei Eingaben mit gleichem Hash zu finden.
- **Avalanche-Effekt:** 1 Bit Änderung → komplett anderer Hash.

Wichtig: Hashing ist **keine Verschlüsselung** (kein Schlüssel, nicht umkehrbar) und sorgt für **Integrität**, nicht Vertraulichkeit. Gängige Algorithmen: **SHA-256/SHA-512** (sicher), **SHA-1/MD5** (gebrochen – nur noch Legacy/Checksummen, nicht für Security).

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `sha256sum`/`sha512sum` | Hashes berechnen/prüfen |
| `md5sum`/`sha1sum` | (Legacy, zum Vergleich) |
| `openssl dgst` | Hash mit wählbarem Algorithmus |

## Lab-Setup

- Beliebiger Linux-Host (Kali). Keine Netz-/Zusatz-Setups.

## Aufgabe (selbst lösen)

1. Erzeuge eine Textdatei und berechne ihren **SHA-256**. Ändere **ein** Zeichen und vergleiche → beschreibe den Avalanche-Effekt.
2. Berechne denselben Inhalt mit MD5, SHA-1, SHA-256, SHA-512 und vergleiche die Längen (in Bit).
3. Erzeuge eine `SHA256SUMS`-Datei für mehrere Dateien und **verifiziere** sie mit `-c`. Manipuliere danach eine Datei und zeige, dass die Prüfung fehlschlägt.
4. Erkläre in 2–3 Sätzen, warum man MD5/SHA-1 nicht mehr für Security-Zwecke nutzt.

**Ziel:** Integritätsprüfung per Hash beherrschen + die Eigenschaften (Avalanche, Länge, gebrochene Algorithmen) belegen.

## SY0-701 Prüfungsbezug

- **1.0** Hashing als Integritätsmechanismus; SHA-2 vs. MD5/SHA-1 (deprecated); Kollision.
- Abgrenzung Hashing ≠ Encryption; Einsatz: Download-Verifikation, Signaturen, Passwort-Speicherung (mit Salt, s. Übung 08).
- Begriffe: *hash*, *digest*, *collision*, *pre-image*, *avalanche*, *integrity*, *checksum*.
