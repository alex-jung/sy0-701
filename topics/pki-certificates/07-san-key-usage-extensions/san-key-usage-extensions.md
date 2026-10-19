# Übung 07 – SAN, Key Usage & Extensions

**Schwierigkeit: 7/10 · Dauer: ca. 75 Min.**

## Lernziele

- SAN (inkl. mehrerer Namen/Wildcard) korrekt setzen
- Key Usage & Extended Key Usage zweckgebunden vergeben
- Basic Constraints und Name Constraints verstehen

## Theorie

Extensions steuern, **wofür** und **für wen** ein Zertifikat gilt:

- **Subject Alternative Name (SAN):** die gültigen Hostnamen/IPs. Moderne Clients ignorieren den CN und prüfen **nur** SAN. Mehrere `DNS:`-Einträge oder **Wildcard** (`DNS:*.server.lab`, deckt genau **eine** Ebene ab).
- **Key Usage (KU):** erlaubte kryptografische Verwendungen (`digitalSignature`, `keyEncipherment`, `keyCertSign`, `cRLSign`…).
- **Extended Key Usage (EKU):** Anwendungszweck – `serverAuth` (TLS-Server), `clientAuth` (mTLS-Client), `codeSigning`, `emailProtection`.
- **Basic Constraints:** `CA:TRUE/FALSE` (+ `pathlen`).
- **Name Constraints:** beschränkt eine (Intermediate-)CA auf bestimmte Domains (z. B. nur `*.server.lab`) → begrenzt Schaden bei Kompromittierung.

Zweckbindung (least privilege) ist Sicherheits- **und** Prüfungsrelevant: ein TLS-Server-Zert soll `serverAuth` haben, nicht `codeSigning`.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `openssl` (`-addext`, `-extfile`) | Extensions setzen |
| `openssl x509 -ext` | Extensions anzeigen |

## Lab-Setup

- CA/Intermediate aus Übung 03/06. `openssl`.

## Aufgabe (selbst lösen)

1. Stelle ein Zertifikat mit **mehreren SAN** aus (`DNS:server.lab, DNS:www.server.lab, IP:10.0.0.10`) und eines mit **Wildcard** (`*.server.lab`) – prüfe, welche Namen abgedeckt sind (deckt `a.b.server.lab` der Wildcard ab?).
2. Setze bei einem TLS-Server-Zert **KU** `digitalSignature,keyEncipherment` und **EKU** `serverAuth`; bei einem Client-Zert EKU `clientAuth`.
3. Zeige an einem Beispiel, dass ein als `serverAuth` ausgestelltes Zert für `clientAuth`/`codeSigning` **nicht** gedacht/akzeptiert ist.
4. (Optional) Setze **Name Constraints** auf der Intermediate (`permitted;DNS:.server.lab`) und erkläre den Nutzen.

**Ziel:** Zertifikate mit korrekten, zweckgebundenen Extensions (SAN/KU/EKU) ausstellen und Wildcard-/Constraint-Verhalten verstehen.

## SY0-701 Prüfungsbezug

- **1.0** SAN, wildcard certificate, key usage/EKU, certificate types (server/client/code signing/email).
- **3.0** least privilege bei Zertifikaten; name constraints.
- Begriffe: *SAN*, *wildcard*, *key usage/EKU*, *serverAuth/clientAuth*, *name constraints*, *basic constraints*.
