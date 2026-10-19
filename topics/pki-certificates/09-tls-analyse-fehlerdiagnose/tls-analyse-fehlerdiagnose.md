# Übung 09 – TLS-Analyse & Fehlerdiagnose

**Schwierigkeit: 9/10 · Dauer: ca. 90 Min.**

## Lernziele

- Typische TLS-/Zertifikatsfehler gezielt reproduzieren und diagnostizieren
- Trust-, Namens-, Ketten-, Ablauf- und Protokollprobleme unterscheiden
- Werkzeuge (`openssl s_client`, `curl -v`, `testssl.sh`, `nmap`) zur Diagnose einsetzen

## Theorie

In der Praxis scheitert TLS selten „zufällig" – es gibt klar benennbare Fehlerklassen, die man als SecOps/Admin schnell zuordnen können muss:

- **Untrusted/Unknown CA** – Root/Intermediate nicht im Trust Store (Verify 19/20).
- **Incomplete chain** – Server sendet Intermediate nicht → „unable to get local issuer".
- **Hostname mismatch** – SAN passt nicht zum angefragten Namen.
- **Expired / not yet valid** – `notAfter`/`notBefore` verletzt (Uhrzeit/NTP!).
- **Revoked** – per CRL/OCSP widerrufen.
- **Weak/deprecated** – TLS 1.0/1.1, schwache Cipher, kein PFS, schwache Keys (vgl. `cryptography-basics` 09).
- **Wrong key usage/EKU** – Zert nicht für den Zweck ausgestellt.

Diagnose-Reflex: Was sagt der **Verify-Return-Code**? Passt **SAN**? Ist die **Kette** vollständig? Stimmt die **Zeit**? Welche **Version/Cipher** wurde ausgehandelt?

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `openssl s_client -showcerts` | Kette/Verify-Code/Version/Cipher |
| `curl -v` | High-Level-Fehlermeldung |
| `testssl.sh` / `nmap --script ssl-*` | Protokolle/Cipher/Schwächen |

## Lab-Setup

- Dein TLS-Server (Übung 05/06) + CA. Erzeuge gezielt **fehlerhafte** Setups zum Üben.

## Aufgabe (selbst lösen)

Reproduziere und **diagnostiziere** mindestens **vier** der folgenden Fehler an deinem eigenen Server – jeweils: Symptom, Diagnosebefehl, Ursache, Fix:

1. Server sendet **nur das Leaf** (keine Intermediate) → Chain-Fehler.
2. Zertifikat mit **falschem SAN** (Name-Mismatch).
3. **Abgelaufenes** Zertifikat (stelle eines mit `-days 1` in der Vergangenheit o. ä. aus bzw. stelle die Systemzeit vor).
4. **Widerrufenes** Zertifikat (aus Übung 08) mit aktivierter Prüfung.
5. Server nur mit **TLS 1.0 / schwacher Cipher** → Schwäche per `testssl.sh`/nmap finden.

**Ziel:** mindestens vier TLS-Fehlerklassen sauber reproduzieren, mit dem richtigen Tool diagnostizieren und den Fix benennen.

## SY0-701 Prüfungsbezug

- **3.0/4.0** TLS-Troubleshooting, certificate validation errors, weak protocol/cipher detection.
- **1.0** chain/SAN/validity/revocation/EKU – alle Validierungsschritte.
- Begriffe: *verify return code*, *incomplete chain*, *hostname mismatch*, *expired/revoked*, *weak cipher/downgrade*, *PFS*.
