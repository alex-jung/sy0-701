# Lösung – Übung 06: Artefakte extrahieren

## 1. Datei rekonstruieren

**File → Export Objects → HTTP** (bzw. FTP-DATA/SMB/IMF): Liste der übertragenen Objekte → gewünschtes auswählen → **Save**. Datei öffnen/hashen (`sha256sum`) zur Identifikation.

## 2. FTP-Credentials

```
ftp.request.command == "USER" || ftp.request.command == "PASS"
```
Zeigt `USER msfadmin` / `PASS msfadmin` im Klartext. (Telnet analog: `telnet` + Follow Stream zeigt die Eingabe Zeichen für Zeichen.)

## 3. HTTP Basic Auth

```
http.authorization
```
Header `Authorization: Basic bXNmYWRtaW46bXNmYWRtaW4=` → dekodieren:
```bash
echo 'bXNmYWRtaW46bXNmYWRtaW4=' | base64 -d      # user:pass
```
Base64 ist **keine** Verschlüsselung → trivial lesbar.

## 4. Tools → Credentials

**Tools → Credentials** (bzw. `credentials`-Dissector) listet automatisch erkannte Klartext-Logins (FTP/HTTP/IMAP/SNMP …) mit Paketnummer.

## 5. Warum HTTPS/SFTP scheitert

Bei **TLS/SSH** ist der Inhalt (Datei, Credentials) **verschlüsselt** → Export Objects/Credentials liefern nichts, nur Metadaten (Übung 08). Deshalb: Telnet→SSH, FTP→SFTP/FTPS, HTTP→HTTPS, SNMPv1/2c→SNMPv3. Das Capture belegt eindrücklich, warum Klartextdienste abzuschalten sind.

## Härtung (Blue Team)

Klartext-Protokolle deaktivieren/ersetzen, TLS erzwingen, SNMPv3, Netzwerk-Sniffing erschweren (Switch-Security, Port-Security, kein Legacy). Captures selbst sind sensibel → Zugriffsschutz.

## Häufige Fehler / Troubleshooting

- **Export Objects leer:** Transfer verschlüsselt (TLS) oder unvollständig im Capture.
- **Datei korrupt:** Transfer war fragmentiert/abgebrochen → vollständiges Capture nötig.
- **Keine Credentials:** Dienst verschlüsselt (gut!) oder anderer Port → „Decode As".
- **Base64 ≠ entschlüsselt:** nur Encoding; echte Verschlüsselung wäre nicht dekodierbar.
