# Übung 04 – Encryption in Transit (TLS)

**Schwierigkeit: 4/10 · Dauer: ca. 60 Min.**

## Lernziele

- Verschlüsselung in-transit praktisch verifizieren (TLS)
- Klartext- vs. verschlüsselten Verkehr im Netz sichtbar machen
- Transport-Security-Mechanismen (TLS/VPN/HSTS/mTLS) einordnen

## Theorie

**Encryption in Transit** schützt Daten auf dem Weg durch (unsichere) Netze gegen **Sniffing/MITM**. Mechanismen:

- **TLS** (HTTPS, SMTPS, LDAPS, …) – der Standard; moderne Version (1.2/1.3), AEAD-Cipher, PFS, gültiges Zertifikat (`pki-certificates`).
- **VPN/IPsec** (`vpn-tunneling`) – Tunnel für ganze Verbindungen/Netze.
- **mTLS** – beidseitige Zertifikats-Authentifizierung (Service-zu-Service).
- **HSTS** (erzwingt HTTPS), sichere Protokolle (SSH statt Telnet, Übung `security-architecture` 08).

Kernidee (wie in `vpn-tunneling` 07): verschlüsselt ist der **Payload**; Metadaten (IP/Port/teils SNI) bleiben sichtbar. Diese Übung macht den Unterschied **Klartext vs. TLS** praktisch sichtbar und prüft die TLS-Qualität.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `tcpdump`/`wireshark` | Klartext vs. verschlüsselt |
| `openssl s_client`/`curl` | TLS prüfen |
| `testssl.sh` | TLS-Qualität |

## Lab-Setup

- Ein Test-Dienst in Klartext (HTTP) und einer mit TLS (aus `pki-certificates`), Capture-Möglichkeit.

## Aufgabe (selbst lösen)

1. Capture einen **HTTP**-Login (Klartext) und zeige, dass Credentials im Netz **lesbar** sind.
2. Capture denselben Vorgang über **HTTPS/TLS** und zeige, dass der Payload **nicht** lesbar ist (nur Metadaten).
3. Prüfe die TLS-Konfiguration (`testssl.sh`/`s_client`): Version, Cipher, PFS, Zertifikat.
4. Erkläre **mTLS** und **HSTS** und wann du sie einsetzt.

**Ziel:** den Schutz durch in-transit-Verschlüsselung praktisch belegen (Klartext vs. TLS) und TLS-Qualität bewerten.

## SY0-701 Prüfungsbezug

- **3.0/1.0** encryption in transit, TLS (1.2/1.3), VPN/IPsec, mTLS, HSTS, secure protocols.
- Begriffe: *in transit*, *TLS/AEAD/PFS*, *mTLS*, *HSTS*, *sniffing/MITM*, *metadata*.
