# Übung 10 – Capstone: Data-Protection-Strategie

**Schwierigkeit: 10/10 · Dauer: ca. 3–4 Std.**

## Lernziele

- Eine durchgängige Data-Protection-Strategie fürs Lab erstellen
- Klassifizierung, Verschlüsselung, Masking/DLP, Key-Mgmt, Lifecycle und Privacy verbinden
- Einen management-tauglichen Report mit Datenschutz-/Schutz-Matrix erstellen

## Theorie

Dieses Capstone bündelt Übungen 01–09 zu einer **Data-Protection-Strategie**: Daten inventarisieren → **klassifizieren** → je **State** (at rest/in transit/in use) Schutz festlegen → **Verschlüsselung** + **Masking/Tokenization** + **DLP** + **Key Management** zuordnen → **Lifecycle/Retention/Sanitization** definieren → **Privacy/Compliance** berücksichtigen. Ergebnis ist eine **Data-Protection-Matrix** + Report mit priorisierten Maßnahmen. Nutze `data-protection-template.md`.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Klassifizierungs-/Schutz-Matrix | Strategie |
| cryptsetup/openssl/shred (Bezug) | Nachweise |
| (Ergebnisse Ü01–09) | Input |

## Lab-Setup

- Dein gesamtes Lab/Repo (Daten) + Ergebnisse der Übungen 01–09.

## Aufgabe (selbst lösen)

Erstelle eine vollständige Data-Protection-Strategie:

1. **Data Inventory & Classification:** ≥ 8 Datenarten, klassifiziert (public→restricted) mit Datentyp (PII/…).
2. **Schutz je State:** für jede Datenart Controls at rest / in transit / in use (Encryption/Access/Enclave).
3. **Masking/Tokenization/DLP:** wo nötig (z. B. Test-DB, Export, Egress) – mit Policy.
4. **Key Management:** wie/wo Schlüssel verwaltet werden (Lifecycle/Rotation/Storage, HSM/KMS/TPM-Bezug).
5. **Lifecycle/Retention/Sanitization:** Aufbewahrung + sichere Löschung je Klasse (NIST 800-88).
6. **Privacy/Compliance:** relevante Prinzipien/Rechte (falls personenbezogen) + Data Sovereignty.
7. **Schutz-Matrix + Report:** `data-protection-template.md` vollständig, inkl. Management Summary + priorisierten Lücken/Maßnahmen.

**Ziel:** eine durchgängige, belegte Data-Protection-Strategie (Classification→States→Encryption/Masking/DLP→Key-Mgmt→Lifecycle→Privacy) + management-tauglicher Report.

## SY0-701 Prüfungsbezug

- **3.0 (+1.0/5.0)** kombiniert: data states/classification, encryption at rest/in transit, masking/tokenization, DLP, key management, sanitization, privacy.
- Prüfungsnah: je State/Klasse die richtige Control wählen, Masking vs. Encryption, Sanitization-Methode, Privacy-Pflichten.
- Begriffe: *classification*, *data states*, *encryption*, *masking/tokenization*, *DLP*, *key management/HSM*, *retention/sanitization*, *privacy/GDPR*.
