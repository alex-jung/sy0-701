# Übung 08 – Revocation: CRL & OCSP

**Schwierigkeit: 8/10 · Dauer: ca. 80 Min.**

## Lernziele

- Zertifikate widerrufen und eine CRL erzeugen/veröffentlichen
- OCSP verstehen und einen OCSP-Responder im Lab betreiben
- CRL vs. OCSP vs. OCSP Stapling einordnen

## Theorie

Zertifikate gelten bis `notAfter` – aber manchmal muss man sie **vorzeitig widerrufen** (Key kompromittiert, Mitarbeiter weg, Fehlausstellung). Mechanismen:

- **CRL (Certificate Revocation List):** von der CA signierte Liste widerrufener Seriennummern, periodisch veröffentlicht (URL in `crlDistributionPoints`). Nachteil: kann groß/veraltet sein.
- **OCSP (Online Certificate Status Protocol):** der Client fragt einen **Responder** live nach dem Status **einer** Seriennummer (good/revoked/unknown). Aktueller, aber Latenz/Privacy-Thema.
- **OCSP Stapling:** der **Server** holt die OCSP-Antwort und „heftet" sie an den Handshake → kein Client→Responder-Roundtrip, besser für Privacy/Performance.

Revocation-Gründe (reason codes): keyCompromise, cessationOfOperation, superseded, affiliationChanged … Wichtig fürs Verständnis von realen Ausfällen (z. B. „Zert widerrufen, aber Client prüft CRL/OCSP nicht").

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `openssl ca -revoke` / `-gencrl` | widerrufen / CRL erzeugen |
| `openssl crl` | CRL anzeigen |
| `openssl ocsp` | OCSP-Responder + Abfrage |

## Lab-Setup

- CA mit `index.txt`/`crlnumber` (Übung 03). Zertifikate aus Übung 04/06. `openssl`.

## Aufgabe (selbst lösen)

1. **Widerrufe** ein ausgestelltes Zertifikat über deine CA und erzeuge eine **CRL**; zeige den Eintrag (`openssl crl -text`).
2. Prüfe ein Zertifikat gegen die CRL (`openssl verify -crl_check`) – vor und nach dem Widerruf.
3. Starte einen **OCSP-Responder** (`openssl ocsp`) für deine CA und frage den Status eines gültigen und eines widerrufenen Zertifikats ab.
4. Erkläre den Unterschied **CRL vs. OCSP vs. OCSP Stapling** und je einen Vor-/Nachteil.

**Ziel:** Widerruf über CRL **und** OCSP praktisch durchführen und den Status (good/revoked) nachweisen.

## SY0-701 Prüfungsbezug

- **1.0** Certificate revocation: CRL, OCSP, OCSP stapling, revocation reasons; certificate lifecycle (revoke).
- **3.0** Statusprüfung in TLS; Fail-open/closed-Problematik.
- Begriffe: *CRL*, *OCSP*, *OCSP stapling*, *revocation*, *key compromise*, *serial number*.
