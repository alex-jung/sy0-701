# Übung 10 – Capstone: vollständige interne PKI

**Schwierigkeit: 10/10 · Dauer: ca. 3–4 Std.**

## Lernziele

- Eine komplette, mehrstufige PKI end-to-end aufbauen und betreiben
- Zertifikate ausstellen, verteilen, widerrufen und validieren
- Die PKI dokumentieren und als CP/CPS-artiges Konzept bewerten

## Theorie

Dieses Capstone führt alles zusammen: **Offline Root → Online Intermediate → Leaf-Zertifikate** für mehrere Zwecke (TLS-Server, mTLS-Client), inkl. korrekter Extensions, **CRL/OCSP**, Trust-Verteilung und Fehlerdiagnose. Du betreibst die PKI wie eine kleine interne CA und dokumentierst Rollen, Lifecycle und Policies (vereinfachtes **Certificate Policy / Practice Statement**). Nutze die Vorlage `pki-design-template.md`.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `openssl` (req/ca/x509/ocsp/crl/verify) | gesamte PKI |
| `nginx`/`s_server`, `curl`, `testssl.sh` | Deployment & Validierung |

## Lab-Setup

- Linux-Host(s). Optional getrennte VM für die „Offline"-Root. TLS-Server für Deployment.

## Aufgabe (selbst lösen)

Baue eine interne PKI, die Folgendes leistet und **nachweist**:

1. **Hierarchie:** Root-CA (offline gehalten) signiert **eine Intermediate-CA** (mit `pathlen:0`, optional Name Constraints auf `.server.lab`).
2. **Ausstellung:** über die Intermediate mindestens ein **TLS-Server-Zert** (SAN, `serverAuth`) und ein **Client-Zert** (`clientAuth`) ausstellen.
3. **Deployment:** TLS-Server mit **fullchain** betreiben; `curl --cacert`/`s_client` zeigt **Verify 0**. Optional **mTLS** (Server verlangt Client-Zert).
4. **Revocation:** ein Zert widerrufen, **CRL** veröffentlichen **und** OCSP-Status `revoked` nachweisen.
5. **Validierung/Diagnose:** mind. zwei Fehlklassen aus Übung 09 demonstriert + behoben; TLS-Konfiguration mit `testssl.sh` auf 1.2/1.3 + PFS geprüft.
6. **Dokumentation:** `pki-design-template.md` ausfüllen (Hierarchie-Diagramm, Rollen, Key-Schutz, Laufzeiten, Revocation-Prozess, Trust-Verteilung, Risiken).

**Ziel:** eine lauffähige, dokumentierte interne PKI (Root→Intermediate→Leafs, Deployment mit Verify 0, funktionierende Revocation) + ein PKI-Design-Dokument.

## SY0-701 Prüfungsbezug

- **1.0/3.0** gesamte PKI-Domäne: CA-Hierarchie, CSR/Issuance, chain of trust, SAN/EKU, CRL/OCSP, key protection, certificate lifecycle, mTLS.
- Prüfungsnah: Trust-Modelle begründen, Fehler diagnostizieren, Revocation/Lifecycle erklären.
- Begriffe: *PKI hierarchy*, *offline root*, *intermediate*, *fullchain*, *mTLS*, *CRL/OCSP*, *certificate lifecycle*, *key escrow*.
