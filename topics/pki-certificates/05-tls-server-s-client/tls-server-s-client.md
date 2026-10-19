# Übung 05 – TLS-Server betreiben & mit s_client prüfen

**Schwierigkeit: 5/10 · Dauer: ca. 70 Min.**

## Lernziele

- Einen TLS-Server mit eigenem (CA-signiertem) Zertifikat betreiben
- Mit `openssl s_client`/`curl` die TLS-Verbindung und den Trust prüfen
- Den TLS-Handshake und die Zertifikatsvalidierung verstehen

## Theorie

Jetzt wird das Zertifikat „scharf" geschaltet: Ein TLS-Server präsentiert dem Client sein Zertifikat (+ ggf. Intermediate-Kette), der Client prüft **Signatur-Kette, Gültigkeit und Hostname (SAN)** gegen seinen Trust Store und handelt Schlüssel (ECDHE) + Cipher aus. Erst dann fließt verschlüsselter Verkehr.

Zum Testen eignen sich `openssl s_server` (Quick-Test) oder ein echter Webserver (nginx). `openssl s_client` zeigt die gesendete Kette, die ausgehandelte TLS-Version/Cipher und den **Verify-Return-Code** (0 = ok). `curl --cacert` prüft gegen die eigene CA. Häufige Realfehler, die man hier übt: Server sendet Intermediate **nicht** mit → Client kann Kette nicht bilden.

## Verwendete Tools

| Tool | Zweck |
|------|-------|
| `openssl s_server` / `nginx` | TLS-Server mit eigenem Zert |
| `openssl s_client` | TLS-Debug, Kette/Verify-Code |
| `curl --cacert` | Trust gegen eigene CA prüfen |

## Lab-Setup

- Server-Zertifikat `www.cert.pem` + `www.key.pem` (Übung 04), CA-Zertifikat (Übung 03). Ein Host als Server, Client lokal oder zweite VM.

## Aufgabe (selbst lösen)

1. Starte einen TLS-Server mit deinem Server-Zertifikat (`openssl s_server` **oder** nginx-TLS-Vhost).
2. Verbinde mit `openssl s_client -connect ... -servername www.server.lab` **ohne** CA → beschreibe den Verify-Fehler.
3. Verbinde erneut **mit** `-CAfile ca.cert.pem` → zeige `Verify return code: 0 (ok)`; prüfe ausgehandelte TLS-Version/Cipher.
4. Teste mit `curl --cacert ca.cert.pem https://www.server.lab/` (Namensauflösung via `/etc/hosts`), dann ohne `--cacert` → vergleiche.

**Ziel:** ein TLS-Server mit eigener PKI läuft, Trust gegen die eigene CA ist nachgewiesen (Verify 0), Fehlkonfiguration (fehlende CA) verstanden.

## SY0-701 Prüfungsbezug

- **3.0** TLS-Handshake, server authentication, cipher negotiation, hostname validation.
- **1.0** chain validation, trust store, intermediate inclusion.
- Begriffe: *TLS handshake*, *s_client*, *verify return code*, *SNI/servername*, *cipher suite*, *ECDHE*.
