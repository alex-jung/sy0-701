# Übung 08 – Verschlüsselter Traffic (TLS, JA3, Metadaten)

**Schwierigkeit: 8/10 · Dauer: ca. 65 Min.**

## Lernziele

- Den TLS-Handshake im Capture lesen (ClientHello/ServerHello/Cert)
- Verstehen, was bei TLS sichtbar bleibt (Metadaten) und was nicht (Payload)
- JA3/JA3S-Fingerprinting und SNI für Erkennung nutzen
- TLS-Entschlüsselung mit Schlüsselmaterial (nur eigene Keys) einordnen

## Theorie

Bei **TLS** ist der **Inhalt verschlüsselt** – Credential-/Datei-Extraktion (Übung 06) scheitert. **Sichtbar** bleiben aber wertvolle **Metadaten**:
- **ClientHello:** angebotene Cipher Suites/Extensions → **JA3**-Fingerprint (identifiziert den Client/das Tool, z. B. ein C2-Implant), **SNI** (Server-Name).
- **ServerHello/Certificate:** gewähltes Cipher, **Zertifikat** (Issuer/CN/Gültigkeit) → **JA3S**; self-signed/ungewöhnliche Zerts verdächtig.
- Flow-Metadaten (wer/wie oft/wie groß) → Beaconing (Übung 07).

**Entschlüsseln** geht nur mit dem passenden **Schlüsselmaterial**: Server-Private-Key (nur RSA-KX) oder – praxisnah – **(TLS/SSL) Key Log File** (`SSLKEYLOGFILE`) deines **eigenen** Clients. So kann man im Lab eigenen HTTPS-Traffic in Wireshark entschlüsseln.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| Wireshark (tls-Dissector) | Handshake/Metadaten, JA3 |
| `SSLKEYLOGFILE` | eigenen TLS-Traffic entschlüsseln |
| JA3-Referenzen | Fingerprint-Zuordnung |

## Lab-Setup

- Ein HTTPS-Mitschnitt (eigener Browser/Client). Für Entschlüsselung: Client mit `SSLKEYLOGFILE` gestartet. Optional ein C2-über-TLS-Capture (Bezug `post-exploitation`).

## Aufgabe (selbst lösen)

1. Finde einen **TLS-Handshake** und identifiziere **ClientHello/ServerHello/Certificate**; lies **SNI** und das **Server-Zertifikat** (CN/Issuer).
2. Bestimme den **JA3**-Fingerprint des Clients – wofür ist er nützlich?
3. Zeige, dass der **Payload verschlüsselt** ist (Application Data unlesbar), aber Metadaten/Beaconing sichtbar bleiben.
4. Entschlüssele **eigenen** HTTPS-Traffic mit einem **Key Log File** und lies den Klartext.
5. Erkläre, wie man TLS-C2 trotz Verschlüsselung erkennt (JA3/SNI/Beaconing) und wo die Grenzen sind.

**Ziel:** TLS-Metadaten (SNI/Cert/JA3) auswerten, eigenen Traffic per Key-Log entschlüsseln und TLS-Detection-Möglichkeiten/-Grenzen verstehen.

## SY0-701 Prüfungsbezug

- **TLS**, Handshake, Zertifikate, **SNI**, **JA3/JA3S-Fingerprinting**.
- Erkennung trotz Verschlüsselung (Metadaten); **TLS-Inspection** und ihre Grenzen/Datenschutz.
- Begriffe: *TLS handshake*, *SNI*, *JA3*, *encrypted traffic analysis*, *TLS inspection*.
