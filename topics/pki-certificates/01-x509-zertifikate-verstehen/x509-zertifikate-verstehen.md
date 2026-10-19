# Übung 01 – X.509 & Zertifikate verstehen

**Schwierigkeit: 1/10 · Dauer: ca. 45 Min.**

## Lernziele

- Aufbau eines X.509-Zertifikats verstehen (Felder, Extensions)
- Ein echtes Zertifikat anschauen und seine Bestandteile benennen
- Die Rolle von CA, Signatur und Trust Chain begreifen

## Theorie

Ein **X.509-Zertifikat** bindet einen **Public Key** an eine **Identität** (z. B. einen Hostnamen) – bestätigt durch die **Signatur einer Certificate Authority (CA)**. Es löst das Vertrauensproblem aus `cryptography-basics`: Woher weiß ich, dass dieser Public Key wirklich zu `bank.example` gehört? → Eine vertrauenswürdige CA hat es signiert.

Wichtige Felder:
- **Subject** – wem gehört das Zertifikat (CN/Organisation; heute v. a. **SAN**).
- **Issuer** – welche CA hat signiert.
- **Validity** – Not Before / Not After (Gültigkeitszeitraum).
- **Public Key** – der zertifizierte Schlüssel (RSA/ECC).
- **Serial Number**, **Signature Algorithm**, **Signature**.
- **Extensions** – SAN, Key Usage, Extended Key Usage, Basic Constraints (CA ja/nein), CRL/OCSP-URLs.

Formate: **PEM** (Base64, `-----BEGIN CERTIFICATE-----`) vs. **DER** (binär); Container: **PKCS#12/.pfx** (Cert + Private Key). **Trust Store**: die Liste der von OS/Browser als vertrauenswürdig akzeptierten Root-CAs.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `openssl x509` | Zertifikat parsen/anzeigen |
| `openssl s_client` | Server-Zertifikat abrufen |

## Lab-Setup

- Linux-Host mit `openssl` und Internet für das Abrufen eines öffentlichen Zertifikats (oder ein beliebiges lokales Zertifikat).

## Aufgabe (selbst lösen)

1. Hole das Zertifikat einer HTTPS-Seite (z. B. deines Routers/einer Website) mit `openssl s_client` und speichere es als PEM.
2. Zeige es mit `openssl x509 -text` an und benenne: **Subject, Issuer, Validity, Public Key (Typ/Länge), Serial, Signature Algorithm**.
3. Finde die **Extensions**: SAN (welche Hostnamen?), Key Usage/EKU, Basic Constraints, CRL/OCSP-URL.
4. Erkläre in 3–4 Sätzen die **Trust Chain** vom Leaf-Zertifikat bis zur Root-CA im Trust Store.

**Ziel:** ein echtes Zertifikat vollständig „lesen" können und die Rolle der CA/Trust-Chain erklären.

## SY0-701 Prüfungsbezug

- **1.0** Certificates, CA, public key, chain of trust; certificate fields; formats (PEM/DER/PKCS#12).
- **3.0** Trust store, root of trust; Grundlage für TLS.
- Begriffe: *X.509*, *CA*, *subject/issuer*, *SAN*, *trust chain*, *root/intermediate/leaf*, *PEM/DER/PFX*.
