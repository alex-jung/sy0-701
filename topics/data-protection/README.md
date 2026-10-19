# Thema: Data Protection

Praxis-/Analyse-Übungen zum **Datenschutz im Sicherheitssinn** (SY0-701-Domäne 3.0): Data States (at rest/in transit/in use), Datenklassifizierung, Verschlüsselung at-rest & in-transit, Data Masking/Tokenization, **DLP (Data Loss Prevention)**, Key Management/HSM, Data Lifecycle/Retention/Sanitization und Privacy/Rechtliches. Verbindet `cryptography-basics`, `pki-certificates`, `security-controls` und `governance-compliance` – mit dem eigenen Lab als Datenbestand.

> ℹ️ **Schutz eigener Daten / Lab-Bezug.** Hands-on-Teile (LUKS, TLS, Masking, Shredding) nur mit **eigenen** Test-Daten. Keine echten personenbezogenen/fremden Daten; Keys nie committen.

## Lernziele

- Data States unterscheiden und je State die richtigen Controls wählen
- Daten klassifizieren und daraus Schutzmaßnahmen ableiten
- Verschlüsselung at-rest (LUKS/FDE) und in-transit (TLS) praktisch umsetzen
- Masking/Tokenization und DLP verstehen und einordnen
- Key Management/HSM-Prinzipien anwenden
- Data Lifecycle, Retention und sichere Löschung (Sanitization) gestalten

## Abgedeckte SY0-701-Domänen

- **3.0 Security Architecture** – protecting data (states, classification, encryption, DLP, masking, tokenization, sanitization)
- **1.0 General Security Concepts** – cryptographic solutions (Bezug)
- **5.0 Program Management** – data governance, retention, privacy/compliance (Bezug)

## Übungen (Schwierigkeit 1 → 10)

| #  | Übung | Schwierigkeit |
|----|-------|---------------|
| 01 | Data States & Grundlagen | 1/10 |
| 02 | Data Classification | 2/10 |
| 03 | Encryption at Rest (LUKS/FDE) | 3/10 |
| 04 | Encryption in Transit (TLS) | 4/10 |
| 05 | Data Masking & Tokenization | 5/10 |
| 06 | DLP – Data Loss Prevention | 6/10 |
| 07 | Key Management & HSM | 7/10 |
| 08 | Data Lifecycle, Retention & Sanitization | 8/10 |
| 09 | Privacy & Rechtliches | 9/10 |
| 10 | Capstone: Data-Protection-Strategie | 10/10 |

## Lab-Voraussetzungen

- Kali/Linux mit `cryptsetup` (LUKS), `openssl`, `shred`/`wipe`; vorhandene CA (`pki-certificates`)
- Referenzen: **NIST SP 800-88 (Media Sanitization)**, **DSGVO/GDPR**, Data-Classification-Schemata
- Querbezug: `cryptography-basics`, `pki-certificates`, `governance-compliance` (Data Governance), `security-controls`

Reihenfolge: starte bei `01-data-states-grundlagen/`. Pro Übung erst die `.md` lösen, dann `solution.md`.
