# Übung 05 – Data Masking & Tokenization

**Schwierigkeit: 5/10 · Dauer: ca. 65 Min.**

## Lernziele

- Masking, Tokenization, Anonymization und Pseudonymization unterscheiden
- Wann welches Verfahren statt/zusätzlich zu Verschlüsselung passt
- Verfahren praktisch an Testdaten anwenden

## Theorie

Nicht immer ist Verschlüsselung die richtige Antwort – oft soll man Daten **nutzbar machen, ohne das Original preiszugeben**:

- **Data Masking:** Original wird (teilweise) verdeckt, z. B. Kreditkarte `**** **** **** 1234`. Oft **irreversibel** in der Anzeige; für Test/Support/Anzeige.
- **Tokenization:** sensibler Wert wird durch ein **Token** ersetzt; das Mapping liegt sicher in einem **Token Vault**. Token ist **reversibel** (nur über den Vault). Klassisch bei PCI (Kartendaten).
- **Anonymization:** Personenbezug **unwiderruflich** entfernt → keine Re-Identifikation (fällt aus DSGVO-Scope).
- **Pseudonymization:** Personenbezug durch Pseudonym ersetzt, **re-identifizierbar** mit Zusatzinfo (DSGVO: weiterhin personenbezogen, aber geschützt).
- **Hashing/Salting** (für Nachschlag/Vergleich), **Aggregation/Generalization** (k-anonymity).

Abgrenzung zu Encryption: Encryption ist reversibel mit Key und schützt die **Vertraulichkeit**; Masking/Tokenization reduzieren die **Exposure** sensibler Werte in Anwendungen/Analysen. Oft **kombiniert**.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Skript (Python/sed) | Masking/Tokenization-Demo |
| (Konzept) Token Vault | Mapping |

## Lab-Setup

- Test-Datensatz (selbst erzeugt, keine echten PII): z. B. Namen/Karten/E-Mails.

## Aufgabe (selbst lösen)

1. Unterscheide Masking, Tokenization, Anonymization, Pseudonymization in je 1–2 Sätzen + Reversibilität.
2. Wende an einem Test-Datensatz **Masking** (z. B. Karten/E-Mail teilweise verdecken) und **Tokenization** (Wert → Token + Mapping) praktisch an (kleines Skript).
3. Entscheide für 4 Szenarien das passende Verfahren (Test-DB, PCI-Zahlung, DSGVO-Analyse, Support-Anzeige) und begründe.
4. Erkläre, warum **Pseudonymisierung** DSGVO-relevant bleibt, **Anonymisierung** aber nicht.

**Ziel:** Masking/Tokenization/Anonymisierung sicher abgrenzen und situationsgerecht anwenden.

## SY0-701 Prüfungsbezug

- **3.0** data masking, tokenization, anonymization, pseudonymization, obfuscation; vs. encryption.
- Begriffe: *masking*, *tokenization/token vault*, *anonymization vs. pseudonymization*, *k-anonymity*, *obfuscation*, *PCI*.
